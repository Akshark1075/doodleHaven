import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;
import java.awt.Dimension;
import java.awt.Toolkit;

UiBooster gui = new UiBooster();
UiBooster configGUI = new UiBooster(  UiBoosterOptions.Theme.DARK_THEME);
UiBooster shapeGUI = new UiBooster(  UiBoosterOptions.Theme.DARK_THEME);

int order = 1;
int len;
int angle=0;
int prevBg=0;
int bgColor=0;
int strokeColor=255;
int fillColor=255;
int strokeWidth=3;
boolean shouldDraw=false;
boolean shouldClearScreen=false;
String[] basicShape={"None","Line","Circle","Square","Rectangle"};
String[] fractals={"None","Binary Tree", "Dandelion","Fern","Koch","Anti Flake","Flake","Triangle Gasket","Square Gasket","Nine Squares","Hexagons","Cubes"};
String currentShapeSelection="None";
String currentFractalSelection="None";
Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
int screenWidth = (int)screenSize.getWidth();
int screenHeight = (int)screenSize.getHeight();
boolean useEraser = false;
final String SPLASH_IMAGE_FILE_NAME = "DoodleHaven.png";
float centerX = width / 2;
float centerY = height / 2;
int gridSize = 10; // Size of grid lines
int rulerHeight = 30; // Height of the ruler
int rulerWidth = 30; // Width of the ruler
boolean displayGrid = true;
float posX;
float posY;

void setup() {
  background(bgColor);
  
  String splashFile = dataPath(SPLASH_IMAGE_FILE_NAME);
  Splashscreen splash = gui.showSplashscreen(splashFile);
  startGUI();
   size(1080,800);
  splash.hide(); 
 
}

void draw() {
  if((bgColor!=prevBg)||shouldClearScreen){
  
    background(bgColor);
    prevBg=bgColor;
    
    shouldClearScreen=false;
  }
  frameRate(30);
  fill(fillColor);
  strokeWeight(strokeWidth);
  if (displayGrid) {
    drawRuler(); // Draw the ruler lines if displayGrid is true
  }
  if(shouldDraw ){
      stroke(strokeColor);
      pushMatrix();
    
     //translate(posX+50,posY-50);
  translate(posX,posY);
  rotate(radians(360-angle+90));
  switch (currentShapeSelection){
    
         case "Line":
           pushMatrix();
           translate(0,0);
           line(0,0,len,0);
           popMatrix();
           break;
         case "Circle":
           circle(0,0,len/2);
           break;
         case "Square":
          rect(0,0, len, len);
          break;
         case "Rectangle":
          rect(0,0, len/2, len);
          break;
         default:
           break;}
  switch (currentFractalSelection){
    
          case "Binary Tree":
               tree(order,len);
               break;
          case "Dandelion":
               dandelion(order,len);
               break;
          case "Fern":
              fern(order,len);
               break;
          case "Koch":
              koch(order,len);
               break;
          case "Anti Flake":
              antiFlake(order,len);
               break;
          case "Flake":
              flake(order,len);
              break;
          case "Triangle Gasket":
             triangleGasket(order,len);
               break;
          case "Square Gasket":
             squareGasket(order,len);
               break;
          case "Nine Squares":
             nineSquares(order,len);
               break;
          case "Hexagons":
             hexagons(order,len);
               break;
         case "Cubes":
             cubes(order,len);
               break;
          default:
           break;
       }
        shouldDraw=false;
        popMatrix();
        
       translate(0,0);
     
   
  }
 
 if (mousePressed) {
    if (useEraser) {
      stroke(bgColor); 
      strokeWeight(20);
      line(pmouseX, pmouseY, mouseX, mouseY);
    } else {  stroke(strokeColor);
    // Draw a line from previous mouse position to the current mouse position
    line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

void keyPressed() {
  if (key == 'e' || key == 'E') {
    useEraser = !useEraser; // Toggle eraser mode when 'E' key is pressed
  }
  if (key == 'g' || key == 'G') {
    displayGrid = !displayGrid; // Toggle displayGrid flag on 'g' key press
    
    if(!displayGrid){
      
    int eraseXWidth = width;
    int eraseXHeight = rulerHeight;
    
    int eraseYWidth = rulerWidth;
    int eraseYHeight = height;
    noStroke();
    fill(bgColor); 
    rect(0, 0, eraseXWidth, eraseXHeight); 
    rect(0, 0, eraseYWidth, eraseYHeight); 
    
    }
    
  } else if (key == 's' || key == 'S') {
    String filename = "sketch.png"; 
    
    // Erase the portion where grid lines are drawn
    int eraseXWidth = width;
    int eraseXHeight = rulerHeight;
 
    int eraseYWidth = rulerWidth;
    int eraseYHeight = height;
    noStroke();
    fill(bgColor); 
    rect(0, 0, eraseXWidth, eraseXHeight);
    rect(0, 0, eraseYWidth, eraseYHeight);
    save(filename); // Save the canvas as an image file (PNG by default)
    new UiBooster().showInfoDialog("Sketch saved as " + filename);
    
    
    
    if (displayGrid) {
      redraw(); 
    }
  }
}


void drawRuler() {
  // Draw text for ruler markings (numbers)
  textAlign(CENTER, CENTER);
  textSize(10);
  
  // X-axis markings
  for (int k = 0; k <= width; k += gridSize) {
    if (k % (gridSize * 5) == 0) {
      text(k, k, 15); // Display numbers every 5 grid units on X-axis
    }
  }
  
  // Y-axis markings
  for (int l = 0; l <= height; l += gridSize) {
    if (l % (gridSize * 5) == 0) {
      text(l, 15, l); // Display numbers every 5 grid units on Y-axis
    }
  }
}
