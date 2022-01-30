import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import 'MyFlutterApp.dart';
import 'api/Temp.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Location location = Location();
  LocationData? position = null;
  try{
    position = (await location.getLocation());
    print(position);
  }
  on PlatformException catch(e){
    print("Erreur: $e");
  }

  if(position != null){
    final latitude = position.latitude;
    final longitude = position.longitude;
    final Coordinates coordinates = Coordinates(latitude, longitude);
    final ville = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    if(ville != null){
      print(ville.first.locality);
      runApp(MyApp(ville.first.locality));

    }

  }
}

class MyApp extends StatelessWidget {
 MyApp(String ville){
   this.ville = ville;
 }

  String? ville;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ma Météo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key, required this.title}) : super(key: key);
  final String title;

  String? get villeDeLutilisateur => null;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String key = "villes";
  List<String> villes = [];
  late String villeChoisie;
  late Temp tempsActuel;

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isIOS) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(widget.title),
          ),
          child: const Center(
            child: Text('Mon body'),
          )
      );
    } else {
      return Scaffold (
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          titleTextStyle: const TextStyle(
              color: Colors.purpleAccent,
              backgroundColor: Colors.white38
          ),
        ),
        drawer: Drawer(
          child: Container(
            child: ListView.builder(
                itemCount: villes.length + 2,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          texteAvecStyle("Mes Villes", fontSize: 22.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue,
                              elevation: 15,
                              shadowColor: Colors.deepPurple,
                            ),
                            onPressed: () {
                              ajoutVille;
                            },
                            child: const Text(
                              "Valider",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  } else if (i == 1) {
                    return ListTile(
                      title: texteAvecStyle(widget.villeDeLutilisateur!),
                      onTap: () {
                        setState(() {
                          villeChoisie = "";
                          appelApi();
                          Navigator.pop(context);

                        });
                      },
                    );
                  } else {
                    String ville = villes[i - 2];
                    return ListTile(
                      title: texteAvecStyle(ville),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white,),
                          onPressed: (() => supprimer(ville))),
                      onTap: () {
                        setState(() {
                          villeChoisie = ville;
                          appelApi();
                          Navigator.pop(context);
                        });
                      },
                    );
                  }


                }),
            color: Colors.blue,
          ),
        ),
        body: (tempsActuel == null)
            ? Center(
          child: Text((villeChoisie.isEmpty)? widget.villeDeLutilisateur!: villeChoisie),
        )
            : Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage(assetName()),
                fit: BoxFit.cover
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              texteAvecStyle(tempsActuel.name, fontSize: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  texteAvecStyle("${tempsActuel.temp.toInt()}°C", fontSize: 60.0),
                  Image.asset(tempsActuel.icon)
                ],
              ),
              texteAvecStyle(tempsActuel.main, fontSize: 30.0),
              texteAvecStyle(tempsActuel.description, fontSize: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(MyFlutterApp.temperatire, color: Colors.white, size: 30.0,),
                      texteAvecStyle("${tempsActuel.pressure}", fontSize: 20.0)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(MyFlutterApp.droplet, color: Colors.white, size: 30.0,),
                      texteAvecStyle("${tempsActuel.humidity}", fontSize: 20.0)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(MyFlutterApp.arrow_upward, color: Colors.white, size: 30.0,),
                      texteAvecStyle("${tempsActuel.temp_max}", fontSize: 20.0)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(MyFlutterApp.arrow_downward, color: Colors.white, size: 30.0,),
                      texteAvecStyle("${tempsActuel.temp_min}", fontSize: 20.0)
                    ],
                  ),
                ],
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }
  String assetName() {
    if (tempsActuel.icon.contains("d")) {
      return "assets/n.jpg";
    } else if (tempsActuel.icon.contains("01") || tempsActuel.icon.contains("02") || tempsActuel.icon.contains("03")) {
      return "assets/d1.jpg";
    } else {
      return "assets/d2.jpg";
    }
  }

  Text texteAvecStyle(String data, {color: Colors.white, fontSize: 18.0, fontStyle: FontStyle.italic, textAlign: TextAlign.center}) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontStyle: fontStyle,
          fontSize: fontSize
      ),
    );
  }

  Future<Null> ajoutVille() async {
    return showDialog(
        barrierDismissible: true,
        builder: (BuildContext buildcontext) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(20.0),
            title: texteAvecStyle("Ajoutez une ville", fontSize: 22.0, color: Colors.blue),
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "ville: "),
                onSubmitted: (String str) {
                  ajouter(str);
                  Navigator.pop(buildcontext);
                },
              )
            ],

          );
        },
        context: context);
  }

  void obtenir() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? liste = await sharedPreferences.getStringList(key);
    if (liste != null) {
      setState(() {
        villes = liste;
      });
    }
  }

  void ajouter(String str) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    villes.add(str);
    await sharedPreferences.setStringList(key, villes);
    obtenir();
  }

  void supprimer(String str) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    villes.remove(str);
    await sharedPreferences.setStringList(key, villes);
    obtenir();
  }

  void appelApi() async {
    String str;
    if (villeChoisie.isEmpty) {
      str = widget.villeDeLutilisateur!;
    } else {
      str = villeChoisie;
    }
    List<Address> coord = await Geocoder.local.findAddressesFromQuery(str);
    if (coord != null) {
      final lat = coord.first.coordinates.latitude;
      final lon = coord.first.coordinates.longitude;
      String lang = Localizations.localeOf(context).languageCode;
      const key = "85d1a5953f91f37020fa288f7e0badbe";

      String urlApi = "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&lang=$lang&APPID=$key";

      final reponse = await http.get(Uri.parse(urlApi));
      if (reponse.statusCode == 200) {
        // Temp temp = Temp();
        Map map = json.decode(reponse.body);
        temp.fromJSON(map);
        setState(() {
          tempsActuel = temp;
        });
      }
    }
  }
}
