void tree(int n,float l){
          if(n==0||l<2) {
            return;
          }
        
          line(0,0,0,-l);
          // Move to the end of that line
          translate(0,-l);
          rotate(radians(45));
          tree(n-1,l/2);
        
          rotate(radians(-90));
          tree(n-1,l/2);
         
          rotate(radians(45));
            line(0,0,0,l);
          // Move to the end of that line
          translate(0,l);


}
void dandelion(int n, float l){
          
     if (n==0 || l<2){
           return;
          }
           line(0,0,0,-l);
  // Move to the end of that line
          translate(0,-l);
          rotate(radians(90));
          dandelion(n-1,l/2);
         rotate(radians(-60));
          dandelion(n-1,l/2);
          rotate(radians(-60));
          dandelion(n-1,l/2);
          rotate(radians(-60));
          dandelion(n-1,l/2);
          rotate(radians(90));
          line(0,0,0,l);

          translate(0,l);
}

void fern(int n,float l){
          
          if (n==0 || l<2){
               return;
          }
         line(0,0,0,0.3*-l);
         translate(0,0.3*-l);
         rotate(radians(-45));
         fern(n-1,l/2);
         rotate(radians(45));
         line(0,0,0,0.7*-l);
         translate(0,0.7*-l);
         rotate(radians(30));
         fern(n-1,l/2);
         rotate(radians(-30));
         line(0,0,0,-l);
         translate(0,-l);
         rotate(radians(-10));
         fern(n-1,0.8*l);
         rotate(radians(10));
         line(0,0,0,2*l);
         translate(0,2*l);
          
 }
          
 void koch(int n,float l){
           
       if (n==0 || l<2){
            line(0,0,0,-l);
            translate(0,-l);
            return;
          }
          koch(n-1,l/3);
          rotate(radians(60));
          koch(n-1,l/3);
          rotate(radians(-120));
          koch(n-1,l/3);
          rotate(radians(60));
          koch(n-1,l/3);       
  }       
  
  
void antiFlake(int n,float l){
          for (int i=0;i<3;i++){
               koch(n,l);
               rotate(radians(120));
          }
     }
     void flake(int n,float l){
           for (int i=0;i<3;i++){
               koch(n,l);
               rotate(radians(-120));
          }
     }
     
     
void triangleGasket(int n,float l){
          if (n==0 || l<2){
                  for (int i=0;i<3;i++){
                      line(0,0,0,-l);
                      translate(0,-l);
                      rotate(radians(120));
               }
               return;
          }
           for (int i=0;i<3;i++){
               triangleGasket(n-1,l/2);
                  line(0,0,0,-l);
                  translate(0,-l);
                  rotate(radians(120));
          }
     }  
          
void squareGasket(int n,float l){
          if(n==0 || l <2){
              for (int i=0;i<4;i++){
                     line(0,0,0,-l);
                  translate(0,-l);
                  rotate(radians(90));
              }
               return;
          }
          for (int j=0;j<4;j++){
               squareGasket(n-1,l/3);
            line(0,0,0,-l);
            translate(0,-l);
            rotate(radians(90));
          }
     }
void nineSquares(int n,float l){
          if(n==0 || l<2){
               for (int i=0;i<4;i++){
               line(0,0,0,-l);
               translate(0,-l);
              rotate(radians(90));
               }
               return;
          }
          for (int i=0;i<4;i++){
               nineSquares(n-1,l/3); line(0,0,0,-l/3);
               translate(0,-l/3);
               nineSquares(n-1,l/3); line(0,0,0,-l/3);
               translate(0,-l/3);
               line(0,0,0,-l/3);
               translate(0,-l/3);  rotate(radians(90));
          }
               
     }
     void hexagons(int n,float l){
          if(n==0 || l<2){
              for (int i=0;i<6;i++){
                  line(0,0,0,-l);
                  translate(0,-l);
                  rotate(radians(60));
               }
               return;
          }
          for (int i=0;i<4;i++){
               hexagons(n-1,l/3);
                line(0,0,0,-l);
                translate(0,-l);
                rotate(radians(60));
          }
     }
     
     void cubes(int n, float l){
         if(n==0 || l<2 ){
             for (int i=0;i<6;i++){
                      line(0,0,0,-l);
                  translate(0,-l);
                       rotate(radians(60));
             }
         rotate(radians(60));
         line(0,0,0,-l);
         translate(0,-l);
         rotate(radians(-60));
         line(0,0,0,-l);
         translate(0,-l);
         line(0,0,0,l);
         translate(0,l);
         rotate(radians(120));
         line(0,0,0,-l);
         translate(0,-l);
         rotate(radians(120));
         translate(0,-l);
         rotate(radians(60));
         translate(0,-l);
         rotate(radians(60));
         return;
         }
         cubes(n-1,l);
         rotate(radians(-180));
        for (int j=0;j<6;j++){
             cubes(n-1,l/2);
             line(0,0,0,l);
             translate(0,l);
             rotate(radians(60));
          }  
           rotate(radians(180));

     }
   
