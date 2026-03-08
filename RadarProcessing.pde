import processing.serial.*; // for serial communication
Serial myPort;

String angle = "";
String distance = "";
String data = "";
String noObject;
float pixsDistance;
int iAngle, iDistance;

void setup() {
  size(1200, 700); 
  smooth();

  println(Serial.list()); // check which port index your Arduino is
  myPort = new Serial(this, Serial.list()[0], 115200); 
  myPort.bufferUntil('\n');
}

void draw() {
  fill(248, 245, 241);
  stroke(#32EA39);
  fill(0, 10);
  rect(0, 0, width, height - height*0.066); 

  drawRadar(); 
  drawLine();
  drawObject();
  drawText();
}

void serialEvent(Serial myPort) {
  data = myPort.readStringUntil('\n');
  if (data == null) return;
  data = data.trim();

  int index1 = data.indexOf(",");
  if (index1 == -1) return;

  angle = data.substring(0, index1);
  distance = data.substring(index1+1);

  try {
    iAngle = int(angle);
    iDistance = int(distance);
  } catch(Exception e) {
  
  }
}


void drawRadar() {
  pushMatrix();
  translate(width/2, height - height*0.074);
  noFill();
  strokeWeight(1);
  stroke(#32EA39);
  arc(0, 0, (width - width*0.0625), (width - width*0.0625), PI, TWO_PI);
  arc(0, 0, (width - width*0.27), (width - width*0.27), PI, TWO_PI);
  arc(0, 0, (width - width*0.479), (width - width*0.479), PI, TWO_PI);
  arc(0, 0, (width - width*0.687), (width - width*0.687), PI, TWO_PI);
  line(0, 0, (-width/2)*cos(radians(30)), (-width/2)*sin(radians(30)));
  line(0, 0, (-width/2)*cos(radians(60)), (-width/2)*sin(radians(60)));
  line(0, 0, (-width/2)*cos(radians(90)), (-width/2)*sin(radians(90)));
  line(0, 0, (-width/2)*cos(radians(120)), (-width/2)*sin(radians(120)));
  line(0, 0, (-width/2)*cos(radians(150)), (-width/2)*sin(radians(150)));
  popMatrix();
}

void drawObject() {
  pushMatrix();
  translate(width/2, height - height*0.074);
  strokeWeight(12);
  strokeCap(SQUARE);
  stroke(#F01B29);
  pixsDistance = iDistance * ((height - height*0.1666)*0.025);
  if (iDistance >= 2 && iDistance < 40) {
    line(pixsDistance*cos(radians(iAngle)), -pixsDistance*sin(radians(iAngle)), 
         (width - width*0.505)*cos(radians(iAngle)), -(width - width*0.505)*sin(radians(iAngle)));
}
  popMatrix();
}

void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(#32EA39);
  translate(width/2, height - height*0.074);
  line(0, 0, (height - height*0.12)*cos(radians(iAngle)), -(height - height*0.12)*sin(radians(iAngle)));
  popMatrix();
}

void drawText() {
  pushMatrix();
  noObject = (iDistance > 40 || iDistance <= 0) ? "Out of Range" : "In Range";
  fill(0, 0, 0);
  noStroke();
  rect(0, height - height*0.0648, width, height);
  fill(#32EA39);
  textSize(25);
  text("10cm", width - width*0.3854, height - height*0.0833);
  text("20cm", width - width*0.281, height - height*0.0833);
  text("30cm", width - width*0.177, height - height*0.0833);
  text("40cm", width - width*0.0729, height - height*0.0833);
  textSize(40);
  text("Tims Radar", width - width*0.80, height - height*0.023);
  text("Angle: " + iAngle +" ", width - width*0.48, height - height*0.023);
  text("Distance: ", width - width*0.26, height - height*0.023);
  if (iDistance > 0 && iDistance < 40) {
    text("        " + iDistance +" cm", width - width*0.1767, height - height*0.023);
  }
  textSize(25);
  popMatrix();
}
