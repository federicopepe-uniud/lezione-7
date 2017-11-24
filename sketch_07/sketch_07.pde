XML xml;

String APIKEY = "";

float tempCurr;
float tempMin;
float tempMax;

String citta;
int humidity;
int pressure;
String country;

void setup() {
  size(400, 500);
  background(0);

  // Prendo i dati
  xml = loadXML("http://api.openweathermap.org/data/2.5/weather?q=Pordenone,it&mode=xml&APPID="+APIKEY);

  // Creo le variabili
  citta = xml.getChild("city").getString("name");

  humidity = xml.getChild("humidity").getInt("value");
  pressure = xml.getChild("pressure").getInt("value");
  country = xml.getContent("country");
}

void draw() {
  background(0);
  // Scrivo sulla finestra
  translate(30, 30);
  textSize(46);
  text(nfc(tempCurr, 1), 0, 40);
  textSize(32);
  text(citta + ", " + country, 0, 80);
  textSize(18);
  text("minima: " + nfc(tempMin, 1) + "\nmassima: " + nfc(tempMax, 1) 
    + "\numidità: " + humidity + "%\npressione: " + pressure + "hPa", 0, 150);
}

float kelvinToCelsius(float value) {
  return value - 273.15;
}

float kelvinToFahrenheit(float value) {
  return (value*9/5)-459.67;
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    tempCurr = kelvinToCelsius(xml.getChild("temperature").getFloat("value"));
    tempMin = kelvinToCelsius(xml.getChild("temperature").getFloat("min"));
    tempMax = kelvinToCelsius(xml.getChild("temperature").getFloat("max"));
  }
  if (key == 'f' || key == 'F') {
    tempCurr = kelvinToFahrenheit(xml.getChild("temperature").getFloat("value"));
    tempMin = kelvinToFahrenheit(xml.getChild("temperature").getFloat("min"));
    tempMax = kelvinToFahrenheit(xml.getChild("temperature").getFloat("max"));
  }
  if (key == 'k' || key == 'K') {
    tempCurr = xml.getChild("temperature").getFloat("value");
    tempMin = xml.getChild("temperature").getFloat("min");
    tempMax = xml.getChild("temperature").getFloat("max");
  }
}