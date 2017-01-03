
//Declaring variables 
float waveSpeed = 0.0;

PImage graph;
PImage bg;
PImage arrowW;
PImage arrowN;
PImage arrowS;
PImage arrowE;

XML xml;

boolean Height = false;
boolean Period = false;
boolean Measure = false;
boolean Wind = false;
boolean zerothree = false;
boolean zeroseven = true;

String size = "Wave Height";
String period = "Perioid";
String measure = "Measurements";
String wind = "Wind";
String engch = "English Channel (62103)";
String landsend = "Lands End (62107)";

int cols = 12;
int rows =  5;



void setup()
{

  graph = loadImage("measure.png");
  bg = loadImage("bg.jpg");
  size(480, 320);
  smooth();

  
  arrowW = loadImage("arrowW.png");
  arrowN = loadImage("arrowN.png");
  arrowS = loadImage("arrowS.png");
  arrowE = loadImage("arrowE.png");

  //Array to draw a grid of arrows used to display wind speed

  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {


    }
  }
}

void draw()
{

  // Load .rss feed from local xml or live rss feed
  //xml = loadXML("data62103.xml");
  xml = loadXML("http://www.ndbc.noaa.gov/data/latest_obs/62103.rss");
 /* if (zerothree == true)
  {
    // xml = loadXML("http://www.ndbc.noaa.gov/data/latest_obs/62103.rss");
    xml = loadXML("data62103.xml");
  }
  if (zeroseven == true)
  {
    // xml = loadXML("http://www.ndbc.noaa.gov/data/latest_obs/62107.rss");
    xml = loadXML("data62107.xml");
  }
  */

  // Get title of each element
  XML[] children = xml.getChildren("channel/item/description");

  background(0);
  image(bg, 0, 0);

  if ( Measure == true)
  {
    image(graph, 0, 0);
  }

  noStroke();
  fill(255);
  textSize(15);
  text(period, 200, 60);
  text(size, 95, 60);
  text(measure, 265, 60);
  text(wind, 385, 60);
  text(engch, 80, 20);
  text(landsend, 300, 20);

  // speed ellipse's are drawn along the sine wave
  float x = waveSpeed;
  waveSpeed += 0.04;

  //looping through allLines array made up of .rss feed <description>
  for (int i = 0; i < children.length; i++) {
    String description = children[i].getContent();
    String[] allLines = description.split("\n");

    //selecting specific characters in each of the lines in the array
    String windDirection = allLines[3].substring(41, 43);
    String windSpeed = allLines[4].substring(37, 41);
    String waveHeight = allLines[5].substring(50, 53);
    String wavePeriod = allLines[6].substring(41, 43);


    //println("wind direction = "+ windDirection);
    //println("wind speed = " + windSpeed);
    //println("wave height = "+ waveHeight);
    //println("wave period = " + wavePeriod);

    //converting .rss strings into float/string vaiables to be used in if statement 
    String windD = new String(windDirection);
    float windS = new Float(windSpeed);
    float waveH = new Float(waveHeight);
    float waveP = new Float(wavePeriod);

    //Sine wave for wave height
    

    if (Height == true)
    {
      if (waveH > 0.0 && waveH < 1.0)
      {
        // loop is used to draw all the points along a sine wave.
        for (int j = 0; j <= width; j++) 
        {

          fill(255, 0, 0, 100);
          // Calculate y value based off of sine function
          float y = sin(x)*9;
          // accuteness of angle // size of ellipses 
          ellipse(j*2, y + height/1.13, 30, 2);

          // compactness
          x += 0.1;
        }
      }
      //sine wave displaying 2ft wave
      else if (waveH > 1.0 && waveH < 2.0) 
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(255, 0, 0, 100);
          float y = sin(x)*10;
          ellipse(j*3, y + height/1.13, 30, 2);
          x += 0.1;
        }
      }
      //sine wave displaying 3ft wave
      else if (waveH > 2.0 && waveH < 3.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(255, 150, 0, 150);
          float y = sin(x)*15;
          ellipse(j*3, y + height/1.18, 30, 2);
          x += 0.1;
        }
      }
      //sine wave displaying 4ft wave
      else if (waveH > 3.0 && waveH < 4.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*15;
          ellipse(j*3, y + height/1.18, 30, 2);
          x += 0.1;
        }
      }
      else if (waveH > 4.0 && waveH < 5.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*26; 
          ellipse(j*3, y + height/1.23, 30, 2);
          x += 0.1;
        }
      }
      else if (waveH > 5.0 && waveH < 6.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*30; 
          ellipse(j*3, y + height/1.25, 30, 2);
          x += 0.1;
        }
      }
      else if (waveH > 6.0 && waveH < 7.0) 
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*45; 
          ellipse(j*3, y + height/1.30, 30, 2);
          x += 0.1;
        }
      }
      else if (waveH > 7.0 && waveH < 8.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*50; 
          ellipse(j*3, y + height/1.35, 30, 2);
          x += 0.1;
        }
      }
      else if (waveH > 8.0 && waveH < 9.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*58; 
          ellipse(j*3.3, y + height/1.40, 30, 2);
          x += 0.1;
        }
      }
      else if (waveH > 9.0 && waveH < 10.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*65; 
          ellipse(j*3, y + height/1.44, 30, 2);
          x += 0.1;
        }
      }
      else if (waveH > 10.0 && waveH < 11.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*72; 
          ellipse(j*3, y + height/1.49, 30, 2);
          x += 0.09;
        }
      }
      else if (waveH > 11.0 && waveH < 12.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*77; 
          ellipse(j*3, y + height/1.55, 30, 2);
          x += 0.08;
        }
      }
      else if (waveH > 12.0 && waveH < 13.0) {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*85; 
          ellipse(j*3, y + height/1.60, 30, 2);
          x += 0.07;
        }
      }
      else {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*90; 
          ellipse(j*3, y + height/1.7, 30, 2);
          x += 0.06;
        }
      }
    }

    // Wave Period sine wave

    if (Period == true)
    {
      if (waveP == 5.0 || waveP < 5.0)
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(255, 0, 0, 100);
          float y = sin(x)*18;
          ellipse(j*1.7, y + height/1.2, 20, 1);
          x += 0.1;
        }
      }
      else if (waveP == 6.0) 
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(255, 150, 0, 150);
          float y = sin(x)*18;
          ellipse(j*2.2, y + height/1.2, 20, 1);
          x += 0.1;
        }
      }
      else if (waveP == 7.0)
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(255, 150, 0, 150);
          float y = sin(x)*18;
          ellipse(j*2.6, y + height/1.2, 20, 1);
          x += 0.1;
        }
      }
      else if (waveP == 8.0)
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*18;
          ellipse(j*3, y + height/1.2, 20, 1);
          x += 0.1;
        }
      }
      else if (waveP == 9.0)
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*18;
          ellipse(j*3.5, y + height/1.2, 20, 1);
          x += 0.1;
        }
      }
      else if (waveP == 10.0)
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*18;
          ellipse(j*4.0, y + height/1.2, 20, 1);
          x += 0.1;
        }
      }
      else if (waveP == 11.0)
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*18;
          ellipse(j*4.4, y + height/1.2, 30, 1);
          x += 0.1;
        }
      }
      else if (waveP == 12.0)
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 0, 100);
          float y = sin(x)*18;
          ellipse(j*4.9, y + height/1.2, 40, 1);
          x += 0.1;
        }
      }
      else
      {
        for (int j = 0; j <= width; j++) 
        {
          fill(0, 255, 255, 100);
          float y = sin(x)*18;
          ellipse(j*6, y + height/1.2, 40, 1);
          x += 0.1;
        }
      }
    }

    //Wind Direction calling different functions from class Arrows depending on wind direction

    if ( Wind == true)
    {
      if (windD.contains("E"))
      {
        for (int w = 0; w < cols; w ++ ) {     
          for (int n = 0; n < rows; n ++ ) {

          
          }
        }
      }
      else if (windD.contains("N"))
      {
        for (int w = 0; w < cols; w ++ ) {     
          for (int n = 0; n < rows; n ++ ) {


          }
        }
      }
      else if (windD.contains("S"))
      {
        for (int w = 0; w < cols; w ++ ) {     
          for (int n = 0; n < rows; n ++ ) {

            
          }
        }
      }
      else
      {
        for (int w = 0; w < cols; w ++ ) {     
          for (int n = 0; n < rows; n ++ ) {

    
          }
        }
      }
    }
  } //end for loop
} //end draw

void mousePressed() {

  //Navagation 

  if (mouseX >95 && mouseX <185 && mouseY >40 && mouseY <65)
  {
    Height = !Height;
    text(size, 95, 60);
  }
  if (mouseX >200 && mouseX <250 && mouseY >40 && mouseY <65)
  {
    Period = !Period;
    text(period, 200, 60);
  }
  if (mouseX >265 && mouseX <370 && mouseY >40 && mouseY <65) 
  {
    Measure = !Measure;
    text(measure, 265, 60);
  }
  if (mouseX >380 && mouseX <420 && mouseY >40 && mouseY <65) 
  {
    Wind = !Wind;
    text(wind, 385, 60);
  }
  if (mouseX >80 && mouseX <255 && mouseY <25) 
  {
    zerothree = !zerothree;
    text(engch, 80, 20);
  }
  if (mouseX >300 && mouseX <435 && mouseY <25) 
  {
    zeroseven = !zeroseven;
    text(landsend, 300, 20);
  }
}

