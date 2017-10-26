

// ______ ooO PENDULUM SPIN Ooo ______
// MOVE YOUR MOUSE ACROSS EACH PEDULUM TO ACTIVATE MOMENTUM OF SPINNING PENDULUM AND A UNIQUE SOUND 
// MOUSE CAN STAY ON EACH PENDULUM TO LOOP/ KEEP SOUND PLAYING, THIS WORKS BEST IF MOUSE IS KEPT MOVING 
// ATPOP THE DESIRED PENDULUM RATHER THAN KEEPING THE MOUSE STILL

Pendulum[] p = new Pendulum[7];

import ddf.minim.*; 

Minim minim;
AudioPlayer[] playS = new AudioPlayer[14];

boolean ps0_IsOn = false; // boolean to trigger second .wav sample = upon mouse leaving pendulum 
boolean ps1_IsOn = false;
boolean ps2_IsOn = false;
boolean ps3_IsOn = false;
boolean ps4_IsOn = false;
boolean ps5_IsOn = false;
boolean ps6_IsOn = false;

void setup()
{
 
  surface.setTitle("..::: ooO   Pendulum Spin   Ooo :::..");
  
  size (1100, 750);
  
    minim = new Minim(this);
// Calling all sound smaples for each Pendulum

// PENDULUM 1 -----
    playS[0] = minim.loadFile("SAMPLE_1_6_LOOP.wav"); // First sample is a cropped version of the complete note intened to loop
    playS[1] = minim.loadFile("SAMPLE_1_7.wav"); // Second sample is the full note played out to pair with the constrain of -
                                                 // - pendulums angular velocity
// PENDULUM 2 -----                                  
    playS[2] = minim.loadFile("SAMPLE_2_3_LOOP.wav");
    playS[3] = minim.loadFile("SAMPLE_2_3.wav");
// PENDULUM 3 -----    
    playS[4] = minim.loadFile("SAMPLE_3_1_LOOP.wav");
    playS[5] = minim.loadFile("SAMPLE_3_2.wav");
// PENDULUM 4 -----    
    playS[6] = minim.loadFile("SAMPLE_4_1_LOOP.wav");
    playS[7] = minim.loadFile("SAMPLE_4_2.wav");
// PENDULUM 5 -----   
    playS[8] = minim.loadFile("SAMPLE_5_1_LOOP.wav");
    playS[9] = minim.loadFile("SAMPLE_5_1.wav");
// PENDULUM 6 -----    
    playS[10] = minim.loadFile("SAMPLE_6_1_LOOP.wav");
    playS[11] = minim.loadFile("SAMPLE_6_2.wav");
// PENDULUM 7 -----    
    playS[12] = minim.loadFile("SAMPLE_7_1_LOOP.wav");
    playS[13] = minim.loadFile("SAMPLE_7_3.wav");
    
// One pendulum has been created in class 'Pendulum' while all 7 are called here 
// with postion and size of center ellipse, pendulum arm set manually 
//---------------------------- PENDULUM 1 ---------------------------------     
    p[0] = new Pendulum();
    p[0].setPosition(200, 200); // position of center radius and pendulum arm origin
    p[0].setRadius(100); // pendulum arm length 
    p[0].setCenterRadius(90); // center ellipse size
    
//---------------------------- PENDULUM 2 ---------------------------------   
    p[1] = new Pendulum();
    p[1].setPosition(250, 560);
    p[1].setRadius(150);
    p[1].setCenterRadius(150);
    
//---------------------------- PENDULUM 3 --------------------------------- 
    p[2] = new Pendulum();
    p[2].setPosition(930, 160);
    p[2].setRadius(130);
    p[2].setCenterRadius(60);
    
//---------------------------- PENDULUM 4 ---------------------------------     
    p[3] = new Pendulum();
    p[3].setPosition(600, 350);
    p[3].setRadius(130);
    p[3].setCenterRadius(120);
    
//---------------------------- PENDULUM 5 ---------------------------------     
    p[4] = new Pendulum();
    p[4].setPosition(560, 100);
    p[4].setRadius(70);
    p[4].setCenterRadius(70);

//---------------------------- PENDULUM 6 ---------------------------------     
    p[5] = new Pendulum();
    p[5].setPosition(760, 640);
    p[5].setRadius(80);
    p[5].setCenterRadius(70);

//---------------------------- PENDULUM 7 ---------------------------------     
    p[6] = new Pendulum();
    p[6].setPosition(920, 430);
    p[6].setRadius(80);
    p[6].setCenterRadius(90);
    
}

void draw()
{
  background (255,230,220);
  
  fill(160, 160, 160);
  textSize(10);
  text("glide the curser over each shape", 450, 740);
  
//---------------------------- PENDULUM 1 --------------------------------- 
  p[0].drawPendulum(); // Draw pendulum with 'p' array [0]'s set parameters 
  
    if(ps0_IsOn){
           if(!(playS[0].isPlaying())) { // if statmement for sample [0] (the cropped sample) 
                                         // which plays and loops upon mouse hover over pendulum[0] 
           playS[0].loop();
           playS[0].rewind(); // rewind enables multiple play backs of sample versus just play will only play sample once
           playS[0].play(); 
           ps0_IsOn = false;
           }
    } else {
      if(playS[0].isPlaying() && (!(playS[1].isPlaying())) ) { // if statement for sample [1] (full note played out) -
                                                               // - set to play out once, then rewind ready for multiple -
                                                               // - play backs upon mouse location triggering 
         playS[1].rewind();
         playS[1].play();
         playS[0].pause();

  }
}

//---------------------------- PENDULUM 2 --------------------------------- 
  p[1].drawPendulum();
  
   if(ps1_IsOn){
           if(!(playS[2].isPlaying())) {
  
           playS[2].loop();
           playS[2].rewind();
           playS[2].play(); 
           ps1_IsOn = false;
           }
    } else {
      if(playS[2].isPlaying() && (!(playS[3].isPlaying())) ) {
         
         playS[3].rewind();
         playS[3].play();
         playS[2].pause();
         
      }
    }

  
//---------------------------- PENDULUM 3 --------------------------------- 
  p[2].drawPendulum();
  
     if(ps2_IsOn){
           if(!(playS[4].isPlaying())) {

           playS[4].loop();
           playS[4].rewind();
           playS[4].play(); 
           ps2_IsOn = false;
           }
    } else {
      if(playS[4].isPlaying() && (!(playS[5].isPlaying())) ) {
        
         playS[5].rewind();
         playS[5].play();
         playS[4].pause();
         
}
    }

//---------------------------- PENDULUM 4 --------------------------------- 
  p[3].drawPendulum();
  
       if(ps3_IsOn){
           if(!(playS[6].isPlaying())) {

           playS[6].loop();
           playS[6].rewind();
           playS[6].play(); 
           ps3_IsOn = false;
           }
    } else {
      if(playS[6].isPlaying() && (!(playS[7].isPlaying())) ) {
        
           playS[7].rewind();
           playS[7].play();
           playS[6].pause();
           
}
    }
  
//---------------------------- PENDULUM 5 --------------------------------- 
  p[4].drawPendulum();
  
         if(ps4_IsOn){
           if(!(playS[8].isPlaying())) {

           playS[8].loop();
           playS[8].rewind();
           playS[8].play(); 
           ps4_IsOn = false;
           }
    } else {
      if(playS[8].isPlaying() && (!(playS[9].isPlaying())) ) {
        
           playS[9].rewind();
           playS[9].play();
           playS[8].pause();
           
}
    }
  
//---------------------------- PENDULUM 6 --------------------------------- 
  p[5].drawPendulum();
  
           if(ps5_IsOn){
           if(!(playS[10].isPlaying())) {

           playS[10].loop();
           playS[10].rewind();
           playS[10].play(); 
           ps5_IsOn = false;
           }
    } else {
      if(playS[10].isPlaying() && (!(playS[11].isPlaying())) ) {
          
           playS[11].rewind();
           playS[11].play();
           playS[10].pause();
         
}
    }
  
//---------------------------- PENDULUM 7 --------------------------------- 
  p[6].drawPendulum();

           if(ps6_IsOn){
           if(!(playS[12].isPlaying())) {

           playS[12].loop();
           playS[12].rewind();
           playS[12].play(); 
           ps6_IsOn = false;
           }
    } else {
      if(playS[12].isPlaying() && (!(playS[13].isPlaying())) ) {
        
           playS[13].rewind();
           playS[13].play();
           playS[12].pause();
         
}
    }

      
//}

//void mouseMoved()
//{
//---------------------------- PENDULUM 1 ---------------------------------   

  if(p[0].getPositionToMouse() < p[0].getCenterRadius()) {
    ps0_IsOn = true;
      
  } else {
    ps0_IsOn = false;    
   }
   
//---------------------------- PENDULUM 2 ---------------------------------   
  // location parameters for mouse location 
  // set for each pendulum and center ellipse, triggering sounds when within set parameters
  if(mouseX > 235 && mouseX < 305 && mouseY > 485 && mouseY < 610){
    ps1_IsOn = true;
      
  } else {
    ps1_IsOn = false;    
   }
   
//---------------------------- PENDULUM 3 --------------------------------- 

       if(mouseX > 900 && mouseX < 960 && mouseY > 130 && mouseY < 190){
    ps2_IsOn = true;
      
  } else {
    ps2_IsOn = false;    
   }
   
//---------------------------- PENDULUM 4 ---------------------------------

     if(mouseX > 540 && mouseX < 660 && mouseY > 290 && mouseY < 410){
    ps3_IsOn = true;
      
  } else {
    ps3_IsOn = false;    
   }
   
//---------------------------- PENDULUM 5 ---------------------------------
  
       if(mouseX > 545 && mouseX < 615 && mouseY > 65 && mouseY < 135){
    ps4_IsOn = true;
      
  } else {
    ps4_IsOn = false;    
   }
   
//---------------------------- PENDULUM 6 ---------------------------------

      if(mouseX > 725 && mouseX < 795 && mouseY > 605 && mouseY < 675){
    ps5_IsOn = true;
      
  } else {
    ps5_IsOn = false;    
   }
   
//---------------------------- PENDULUM 7 ---------------------------------

      if(mouseX > 875 && mouseX < 965 && mouseY > 385 && mouseY < 475){
    ps6_IsOn = true;
      
  } else {
    ps6_IsOn = false;    
   }
  
}