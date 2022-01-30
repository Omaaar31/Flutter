class Temp() {
    String name;
    String main;
    String description;
    String icon;
    var temp;
    var pressure;
    var humidity;
    var temp_min;
    var temp_max;

    Temp();

    void fromJSON(Map map) {
        this.name = map["name"];
        List weather = map["weather"];
        Map mapWeather = weather[0];

        this.main = mapWeather["main"];
        this.description = mapWeather ["description"];
        String monIcone = mapWeather["icon"];

        this.icon = this.icon = "assets/${monIcone.replaceAll("d", "").replaceAll("n", "")}.png";
        Map main = map["main"];

        this.temp = main["temp"];

        this.pressure = pressure[];
        this.humidity = humidity[];
        this.temp_min = temp_min[];
        this.temp_max = temp_max[];
    }
}