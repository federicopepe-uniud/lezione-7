XML xml;

String APIKEY = "";

void setup() {
  size(400, 500);
  
  // Prendo i dati
  xml = loadXML("http://api.openweathermap.org/data/2.5/weather?q=Pordenone,it&mode=xml&APPID="+APIKEY);
  
  // Creo le variabili
  String citta = xml.getChild("city").getString("name");
  float tempCurr = xml.getChild("temperature").getFloat("value");
  float tempMin = xml.getChild("temperature").getFloat("min");
  float tempMax = xml.getChild("temperature").getFloat("max");
  int humidity = xml.getChild("humidity").getInt("value");
  int pressure = xml.getChild("pressure").getInt("value");
  String country = xml.getContent("country");
  
  // Scrivo sulla finestra
  translate(30, 30);
  textSize(46);
  text(nfc(kelvinToCelsius(tempCurr), 1), 0, 40);
  textSize(32);
  text(citta + ", " + country, 0, 80);
  textSize(18);
  text("minima: " + nfc(kelvinToCelsius(tempMin), 1) + "\nmassima: " + nfc(kelvinToCelsius(tempMax), 1) 
    + "\numidità: " + humidity + "%\npressione: " + pressure + "hPa", 0, 150);
  
  noLoop();
}

void draw() {
}

float kelvinToCelsius(float value) {
  return value - 273.15;
}

float kelvinToFahrenheit(float value) {
  return (value*9/5)-459.67;
}
