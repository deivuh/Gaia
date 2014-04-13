

PImage img;
color pixelColor;


void setup() {
  img = loadImage("fideo.png");
  float[][] r = new float[4][4]; 
  float[][] g = new float[4][4];
  float[][] b = new float[4][4];
  
  for (int i = 0; i < img.width/4; i ++) {       
      for (int j = 0; j < img.height/4; j++) {
        pixelColor = img.get(i,j);        
        r[0][0] = r[0][0] + red(pixelColor);
        b[0][0] = b[0][0] + blue(pixelColor);
        g[0][0] = g[0][0] + green(pixelColor);             
      }
    
      for (int j = 0; j < img.height*2/4; j++) {
        pixelColor = img.get(i,j);
        r[0][1] = r[0][1] + red(pixelColor);
        b[0][1] = b[0][1] + blue(pixelColor);
        g[0][1] = g[0][1] + green(pixelColor);             
      }
      
      for (int j = 0; j < img.height*3/4; j++) {
        pixelColor = img.get(i,j);
        r[0][2] = r[0][2] + red(pixelColor);
        b[0][2] = b[0][2] + blue(pixelColor);
        g[0][2] = g[0][2] + green(pixelColor);             
      }    
      
      for (int j = 0; j < img.height; j++) {
        pixelColor = img.get(i,j);
        r[0][3] = r[0][3] + red(pixelColor);
        b[0][3] = b[0][3] + blue(pixelColor);
        g[0][3] = g[0][3] + green(pixelColor);             
      }               
          
  }

  
  println("R:", r[0][0]/(img.width/4*img.height/4));
  println("G:", g[0][0]/(img.width/4*img.height/4));
  println("B:", b[0][0]/(img.width/4*img.height/4));
  pixelColor = img.get(0,0);
 
}

void draw() {
  
}

