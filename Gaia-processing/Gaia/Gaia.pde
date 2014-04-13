

PImage img;
color pixelColor;


void setup() {
  img = loadImage("fideo.png");
  float[][] r = new float[4][4]; 
  float[][] g = new float[4][4];
  float[][] b = new float[4][4];
  
  //Divide the image into 4x4 areas, iterate each pixel on each area and get the average area RGB values
  for (int i2 = 1; i2 <= 4; i2 ++) {
    for (int i = 0; i < img.width*i2/4; i ++) {
        for (int j2 = 1; j2 <= 4; j2 ++) {       
          for (int j = 0; j < img.height/4; j++) {
            pixelColor = img.get(i,j);        
            r[i2-1][j2-1] = r[i2-1][j2-1] + red(pixelColor);
            b[i2-1][j2-1] = b[i2-1][j2-1] + blue(pixelColor);
            g[i2-1][j2-1] = g[i2-1][j2-1] + green(pixelColor);             
          }
        }      
    }
  }

  
  println("R:", r[0][0]/(img.width/4*img.height/4));
  println("G:", g[0][0]/(img.width/4*img.height/4));
  println("B:", b[0][0]/(img.width/4*img.height/4));
  pixelColor = img.get(0,0);
 
}

void draw() {
  
}

