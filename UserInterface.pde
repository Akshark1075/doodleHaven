import java.util.*;
void startGUI() {
  
  
  FormBuilder guiElements1 = configGUI.createForm("Pen Config"); 

  guiElements1
                .addButton("Set Bg color",()->setBgColor(configGUI))
                .setID("bgColor")
                .addButton("Set Stroke color",()->setStrokeColor(configGUI))
                .setID("strokeColor")
                .addButton("Set Fill color",()->setFillColor(configGUI))
                .setID("fillColor")
                .addText("Stroke Width")
                .setID("strokeWidth")
                .setChangeListener((element,value,form)->extractForSketch(element))
                .andWindow()
                .setSize(300,250)
                .setUndecorated()
                .setPosition(0, 0)
                .save() 
                .run();
  

  
  FormBuilder guiElements = shapeGUI.createForm("Shapes"); 

  guiElements
                .addSelection("Select shape",basicShape)
                .setID("basicShape")
                .addSelection("Select Fractal shape",fractals)
                .setID("fractalShape")
                .addSlider("Order", 1, 10, order, 1, 1)
                .setID("order")
                .addText("Length")
                .setID("length")
                .addText("Pos X")
                .setID("posx")
                .addText("Pos Y")
                .setID("posy")
                .addSlider("Angle", 0, 359, angle, 45, 45)
                .setID("angle")
                .addButton("Draw",()->drawShapes())
                .setID("drawBtn")
                .addButton("Clear",()->reset())
                .setID("resetBtn")
                .setChangeListener((element,value,form)->extractForSketch(element))
                .andWindow()
                .setSize(300,625)
                .setUndecorated()
                .setPosition(0, 250)
                .save()
                .run();
}
void setBgColor(UiBooster GUI){
   bgColor= GUI.showColorPickerAndGetRGB("Choose your favorite color", "Color picking");
 
}
void setStrokeColor(UiBooster GUI){
   strokeColor= GUI.showColorPickerAndGetRGB("Choose your favorite color", "Color picking");
}
void setFillColor(UiBooster GUI){
   fillColor= GUI.showColorPickerAndGetRGB("Choose your favorite color", "Color picking");
}
void reset(){
  bgColor=0;
  shouldClearScreen=true;
  shouldDraw=false;
}
void drawShapes(){
   if(currentFractalSelection=="None"&&currentShapeSelection=="None"){
     new UiBooster().showErrorDialog("Select a shape", "ERROR");
  }
  else if(currentFractalSelection!="None"&&currentShapeSelection!="None"){
     new UiBooster().showErrorDialog("Select either a basic shape or a fractal", "ERROR");
  }
  else if(!boolean(len)){
     new UiBooster().showErrorDialog("Length cannot be empty", "ERROR");
  }
  else if(posX== 0.0){
      new UiBooster().showErrorDialog("PosX cannot be empty", "ERROR");
  }
  else if(posY== 0.0){
      new UiBooster().showErrorDialog("PosY cannot be empty", "ERROR");
  }
   else {
      shouldDraw=true;
  }

}
void extractForSketch(FormElement element){
  switch(element.getId()){
    case "basicShape":
      currentShapeSelection=element.asString(); 
      break;
   case "fractalShape":
      currentFractalSelection=element.asString();
      break;
   case "strokeWidth":
      strokeWidth=element.asInt();
      break;
   case "order":
      order=element.asInt();
      break;
  case "length": 
      len=element.asInt();
      break;
  case "posx":
      posX=element.asFloat();
      break;
  case "posy":
      posY=element.asFloat();
      break;
  case "angle": 
      angle=element.asInt();
      break;
  default:
      break;
  }
} 
