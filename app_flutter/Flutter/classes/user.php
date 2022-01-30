<?php
    class User{

        // Connection
        private $conn;

        // Columns
        public $id_user;
        public $name_user;
        public $first_name_user;
        public $login_user;
        public $mdp_user;

        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }

        public function getUsers() {
            $sqlQuery = "SELECT * FROM user";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->execute();

            $dataRow = $stmt->fetchAll();
            if(count($dataRow) > 0){
                $this->id_user = $dataRow['id_user'];
                $this->name_user = $dataRow['name_user'];
                $this->first_name_user = $dataRow['first_name_user'];
                $this->login_user = $dataRow['login_user'];
                
            }
        }
        
        // CREATE un nouvel utilisateur
        public function createUser($name_user,$first_name_user,$login_user,$mdp_user){
            $sqlQuery = "INSERT INTO
                            user(name_user, first_name_user, login_user, mdp_user)
                        Values 
                            (:name_user, 
                            :first_name_user, 
                            :login_user,
                            :mdp_user)";
        
            $stmt = $this->conn->prepare($sqlQuery);
            $createok;
            if($stmt->execute(
                array(
                'name_user'=>$name_user,
                'first_name_user'=>$first_name_user,
                'login_user'=>$login_user,
                'mdp_user'=>md5($mdp_user),
                )
                )
              ){
                $createok = false;
                $mdp_user= md5($mdp_user);
                try {   
                    
                    $bdd = new PDO('mysql:host=localhost;dbname=task1', 'root','', 
                    array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
                    //requete pour stocker le contenu de toute la table
                    $reponse = $bdd->query('SELECT * FROM user WHERE login_user = "'.$login_user.'"');
                    //boucle pour parcourir et afficher le contenu de chaque ligne de la table
                    while ($donnees = $reponse->fetch()){   
                        //test si le login existe
                        if($login_user == $donnees['login_user']){   
                            //création de la variable $createok si le login existe
                            $createok=true;                           
                        }                               
                    }
                    //test si le login n'existe pas
                    if($createok){
                        http_response_code(404);
                        echo json_encode("User already exist");
                    }
                    if(!$createok){
                        var_dump($createok);
                        var_dump($name_user);
                        var_dump($first_name_user);
                        var_dump($login_user);
                        $bdd = new PDO('mysql:host=localhost;dbname=task1', 'root','', 
                        array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
                        //requete pour stocker le contenu de toute la table
                        $reponse = $bdd->query('SELECT * FROM user WHERE login_user = "'.$login_user.'" AND mdp_user="'.$mdp_user.'"');
                        //boucle pour parcourir et afficher le contenu de chaque ligne de la table
                        while ($donnees = $reponse->fetch()){   
                            //test si le login et le mot de passe sont valides si ok affichage du login et du password
                            if($login_user == $donnees['login_user'] && $mdp_user == $donnees['mdp_user']){   
                                // create array
                                $emp_arr = array(
                                    "id_user"=>intval($donnees['id_user'], 10),
                                    "name_user"=>$donnees['name_user'],
                                    "first_name_user" =>$donnees['first_name_user'],
                                    "login_user"=>$donnees['login_user']
                                );
                                print_r($emp_arr);
                                http_response_code(200);
                                echo json_encode($emp_arr);                                                     
                            }                                            
                        }
                    }
                }
                catch(Exception $e){  
                     //affichage d'une exception
                    die('Erreur : '.$e->getMessage());
                }
            }
            http_response_code(404);
            echo json_encode("Error while creating user");
        }
        // login 
        public function login($login_user,$mdp_user){
            $mdp_user= md5($mdp_user);
            $connect =false;
            $loginok = false;
            try {   
                
                $bdd = new PDO('mysql:host=localhost;dbname=task1', 'root','', 
                array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
                //requete pour stocker le contenu de toute la table
                $reponse = $bdd->query('SELECT * FROM user WHERE login_user = "'.$login_user.'"');
                //boucle pour parcourir et afficher le contenu de chaque ligne de la table
                while ($donnees = $reponse->fetch()){   
                    //test si le login existe
                    if($login_user == $donnees['login_user']){   
                        //création de la variable $loginok si le login existe
                        $loginok=true;                           
                    }                               
                }
                //test si le login n'existe pas
                if(!$loginok){
                    http_response_code(404);
                    echo json_encode("User not found");
                }
                //test si le login existe vérification du mot de passe
                if($loginok){ 
                    $bdd = new PDO('mysql:host=localhost;dbname=task1', 'root','', 
                    array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
                    //requete pour stocker le contenu de toute la table
                    $reponse = $bdd->query('SELECT * FROM user WHERE login_user = "'.$login_user.'" AND mdp_user="'.$mdp_user.'"');
                    //boucle pour parcourir et afficher le contenu de chaque ligne de la table
                    while ($donnees = $reponse->fetch()){   
                        //test si le login et le mot de passe sont valides si ok affichage du login et du password
                        if($login_user == $donnees['login_user'] && $mdp_user == $donnees['mdp_user']){   
                            $connect = true;
                            // create array
                            $emp_arr = array(
                                "id_user"=>intval($donnees['id_user'], 10),
                                "name_user"=>$donnees['name_user'],
                                "first_name_user" =>$donnees['first_name_user'],
                                "login_user"=>$donnees['login_user']
                            );
      
                            http_response_code(200);
                            echo json_encode($emp_arr);                                                     
                        }                                            
                    }
                }
                //test si le login existe et le mot de passe est incorrect
                if($connect != true and $loginok == true) {
                    $connect = false;
                    http_response_code(404);
                    echo json_encode("password incorrect");
                }  //test si le login existe et le mot de passe est incorrect                     
            }
            catch(Exception $e){  
                 //affichage d'une exception
                die('Erreur : '.$e->getMessage());
            } 
        }
    }
?> 