

PImage img;
color pixelColor;
float[][] r,g,b,a;
float[][] r1,g1,b1,a1;
float[][] r2,g2,b2,a2;
float ar, ag, ab;
float[][] rDiff, gDiff, bDiff;
float[][] damageLevel;

void setup() {
  
  size(558, 413);
  
  rDiff = new float[4][4];
  gDiff = new float[4][4];
  bDiff = new float[4][4];
  damageLevel = new float[4][4];


  getImageAvgColors("hoja1a.png");
  r1 = r;
  g1 = g;
  b1 = b;
  a1 = a;
  
  getImageAvgColors("hoja1b.png");
  r2 = r;
  g2 = g;
  b2 = b;
  a2 = a;
  
  
//  // Get average color from all areas  
//  for (int i = 0; i < 4; i++) {
//     for (int j = 0; j < 4; j++) {
//           ar += r[i][j];
//           ag += g[i][j];
//           ab += b[i][j];
//     }
//  }
//  ar = ar/16;
//  ag = ag/16;
//  ab = ab/16;
//  
//  println(String.format("AR: %.2f, AG: %.2f, AB: %.2f", ar, ag, ab));
  
  
  
  
  //Compare RGB values of each area in each image
  for (int i = 0; i < 4; i++) {
     for (int j = 0; j < 4; j++) {
       
       rDiff[i][j] = r1[i][j] - r2[i][j];
       gDiff[i][j] = g1[i][j] - g2[i][j];
       bDiff[i][j] = b1[i][j] - b2[i][j];
       damageLevel[i][j] = abs(rDiff[i][j]) + abs(gDiff[i][j]);
       println(String.format("%d,%d damage level: %f", i, j, damageLevel[i][j]));
     }
  }
   

}

void getImageAvgColors(String image) {
  img = loadImage(image);
  r = new float[4][4]; 
  g = new float[4][4];
  b = new float[4][4];
  a = new float[4][4];
  
  //Divide the image into 4x4 areas, iterate each pixel on each area and get the average area RGB values
  for (int i2 = 1; i2 <= 4; i2 ++) {
    for (int i = (i2-1)*img.width/4; i < img.width*i2/4; i ++) {
        for (int j2 = 1; j2 <= 4; j2 ++) {       
          for (int j = (j2-1)*img.height/4; j < img.height*j2/4; j ++) {
            pixelColor = img.get(i,j);      
            
            // If magenta color is detected (BG color), ignore it and add to alpha counter            
            if (pixelColor == color(255, 0, 255)) {
               a[i2-1][j2-1] += 1;
            } else {
              r[i2-1][j2-1] = r[i2-1][j2-1] + red(pixelColor);
              b[i2-1][j2-1] = b[i2-1][j2-1] + blue(pixelColor);
              g[i2-1][j2-1] = g[i2-1][j2-1] + green(pixelColor);             
            }
          }
        }      
    }
  }



  for (int i = 0; i < 4; i++) {
     for (int j = 0; j < 4; j++) {
       r[i][j] = r[i][j]/((img.width/4*img.height/4)-a[i][j]);
       g[i][j] = g[i][j]/((img.width/4*img.height/4)-a[i][j]);
       b[i][j] = b[i][j]/((img.width/4*img.height/4)-a[i][j]);
            
     } 
  } 
}

void draw() {
  
  
  //Draw each area's average color  
  for (int i = 0; i < 4; i++) {
     for (int j = 0; j < 4; j++) {
        fill((int)r[i][j], (int)g[i][j], (int)b[i][j]);
        
        rect(i*100, j*100, 100, 100);
        
     } 
  }
  
  

  
//Draw affected image
  image (img, 0,0);
  
//Draw a rectangle on most affected areas  
  for (int i = 0; i < 4; i++) {
     for (int j = 0; j < 4; j++) {
       if (abs(damageLevel[i][j]) > 15) {
          fill(255, 0, 0, 50);      
          stroke(255, 0, 50);        
          rect(i*img.width/4, j*img.height/4, img.width/4, img.height/4);
       }
        
     } 
  }  
    
  
//    println("R:", r[0][0]/(img.width/4*img.height/4));
//  println("G:", g[0][0]/(img.width/4*img.height/4));
//  println("B:", b[0][0]/(img.width/4*img.height/4));
}

