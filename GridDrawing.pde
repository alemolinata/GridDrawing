
float spacing = 50;
float x = 0;
float y = 0;

int[] clickX = new int[100];
int[] clickY = new int[100];

int clickCounter = 0;

void setup() {
  size( displayWidth, displayHeight);
  background(#F09E52);
  
  PFont font;
  font = createFont( "InputMono-Light", 36 );
  textFont(font);
}

void draw() {
  background( 40, 40, 40 );
  ellipseMode(CENTER);
  
  for( int i=1 ; i <= clickCounter; i++ ){
    fill(255);
    ellipse( clickX[i], clickY[i], 30, 30 );
      
    if( i >= 2 ){
      stroke(255);
      strokeWeight(4);
      line( clickX[i-1], clickY[i-1], clickX[i], clickY[i] );
    }
  }
  
  y = spacing/2;
  x = spacing/2;
  
  for ( float gridX = spacing/2; gridX < width; gridX = gridX + spacing ) {
    stroke( 255, 74 );
    strokeWeight(2);
    line( gridX, 0, gridX, height );
  }
  
  while ( y < height ) {
    stroke( 255,74 );
    strokeWeight(2);
    line( 0, y, width, y );
    
    while ( x < width ) {
      noStroke();
      
      float d = dist( x, y, mouseX, mouseY );
      fill( #27A5E3 );
      
      d = map( d, 0, 50, 25, 0 );
      d = constrain( d, 0, 25 );
      
      ellipse( x, y, d, d );
      x += spacing;
    }
    
    y += spacing;
    x = spacing/2;
  }
  rectMode(CORNERS);
  fill(0, 80);
  rect(19, 19, 181, 81, 6);
  rect(219, 19, 281, 81, 6);
  
  fill(250, 180, 30);
  rect(22, 22, 178, 78, 6);
  rect(222, 22, 278, 78, 6);
  cursor(CROSS);
  
  if( 19 < mouseX && mouseX < 181 && 19 < mouseY && mouseY < 81){
    fill(220, 150, 20);
    rect(22, 22, 178, 78, 6);
    cursor(HAND);
  }
  if( 219 < mouseX && mouseX < 281 && 19 < mouseY && mouseY < 81){
    fill(200, 120, 20);
    rect(222, 22, 278, 78, 6);
    cursor(HAND);
  }
  
  fill(255);
  textAlign( CENTER, CENTER );
  text( "erase", 100, 45 );
  quad( 230, 50 , 250, 50, 230, 30, 230, 30 );
  stroke(255);
  strokeWeight(2);
  noFill();
  arc( 250, 50, 30, 30, PI+QUARTER_PI, 2*PI + HALF_PI, OPEN );

  
  
}

void mouseClicked() {
  if( 19 < mouseX && mouseX < 181 && 19 < mouseY && mouseY < 81){
    clickCounter = 0;
  }
  else if( 219 < mouseX && mouseX < 281 && 19 < mouseY && mouseY < 81 ){
    if( clickCounter >= 1 ){
      clickCounter --;
    }
  }
  else{
    clickCounter ++;
  
    clickX[clickCounter] = round( mouseX/50 )*50+25;
    clickY[clickCounter] = round( mouseY/50 )*50+25;
  }
}

