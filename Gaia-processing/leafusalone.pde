

PImage img;
color pixelColor;


void setup() {
  img = loadImage("fideo.jpg");
  pixelColor = img.get(0,0);
  float[][] r; 
  float[][] g;
  float[][] b;
  
  for (int i = 0; i < img.width/4; i ++) {    
      for (int j = 0; j < img.height/4; j++) {
        r[i][j] = r[i][j] + red(pixelColor);
        b[i][j] = b[i][j] + blue(pixelColor);
        g[i][j] = g[i][j] + green(pixelColor);             
      }
    
      for (int j = 0; j < img.height*2/4; j++) {
        r[i][j] = r[i][j] + red(pixelColor);
        b[i][j] = b[i][j] + blue(pixelColor);
        g[i][j] = g[i][j] + green(pixelColor);             
      }
      
      for (int j = 0; j < img.height*3/4; j++) {
        r[i][j] = r[i][j] + red(pixelColor);
        b[i][j] = b[i][j] + blue(pixelColor);
        g[i][j] = g[i][j] + green(pixelColor);             
      }    
      
      for (int j = 0; j < img.height; j++) {
        r[i][j] = r[i][j] + red(pixelColor);
        b[i][j] = b[i][j] + blue(pixelColor);
        g[i][j] = g[i][j] + green(pixelColor);             
      }               
          
  }

  
  println("R:", r);
  println("G:", g);
  println("B:", b);  
}

void draw() {
  
}

