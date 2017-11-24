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
  textSize(46);
  text(tempCurr, 0, 40);
  
  
  
  noLoop();
}

void draw() {
}