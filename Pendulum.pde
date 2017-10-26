class Pendulum {

PVector v; // location for centre ellipse and pendulum arm origin

float centerRadius; // radius of ellipses pendulum rotate around 

float radius = 100; 
float angle = 0.0;
float angularVelocity = 0.0;
float angularAcceleration = 0.3;

Pendulum() 
{
  
}
//------------------------------------------------------------------------
float getPositionToMouse()
{
  // This code was used to calculate location/ distance of mouse to location of
  // center ellipse [0] to trigger sample [0], though works successfuly for p[0]
  // other pedulums had to be set manually with if statements relative to mouse location
  PVector dist1 = new PVector(mouseX,mouseY); 
  PVector dist2 = new PVector(p[0].getPosition().x,p[0].getPosition().y);
  float distance = (dist1.sub(dist2)).mag();
  
  return distance;
}

//------------------------------------------------------------------------
void setPosition(int x, int y) 
{
  v = new PVector(x, y);
}

//------------------------------------------------------------------------
PVector getPosition() 
{
  return v; 
}

//------------------------------------------------------------------------
void setCenterRadius(int r)
{
  centerRadius = r;  
}

//------------------------------------------------------------------------
float getCenterRadius()
{
   return centerRadius; 
}

//------------------------------------------------------------------------
void setRadius(int r)
{
  radius = r; 
}

//------------------------------------------------------------------------
void drawPendulum()
{
  
  pushMatrix(); // push & pop matrix used to contain (0/ origin) x & y co-ordinates of (each) pendulum to set location 
  translate(v.x, v.y);
  float x = radius * cos(angle); // with radius and cos & sin(angle) set to x & y co-ordinates now angular - 
  float y = radius * sin(angle); // - velocity and acceloration can be added to create motion
  fill(255, 153, 153);
  stroke(255, 153, 153);
  line(0, 0, x, y);
  ellipse(x, y, 40, 40);
  popMatrix();
  
  ellipse(v.x, v.y, centerRadius, centerRadius);
  
  angle = angle + angularVelocity;
  
// This checks to see if we are hovering over the center buttons ---------  
  float d1 = dist(mouseX, mouseY, v.x, v.y);
  
  if (d1 <= centerRadius) 
  {
      
    angularAcceleration = 0.02; // Begin motion / rotation at set acceloration 


  } else 
  { 
    if (d1 > centerRadius) 
      angularAcceleration = -0.0002; // Slows rotation when mouse leaves center radius ellipse
    }
    angularVelocity = angularVelocity + angularAcceleration; 
    angularVelocity = constrain(angularVelocity, 0, 0.2); // Contraining momentum/rotation of pendulum 
  }
  
}