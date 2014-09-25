#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
  
  ofxAccelerometer.setup();
  ofBackground(255, 255, 255);
  
  posX = 160;
  posY = 240;
  velX = 0;
  velY = 0;

  for(int i = 0 ; i < FINMAX ; i ++) isTouching[i] = false;



}

//--------------------------------------------------------------
void ofApp::update(){

  for(int i = 0 ; i < FINMAX ; i ++){

    if(isTouching[i]){
      float difX = finX[i] - posX;
      float difY = finY[i] - posY;
      float len  = difX * difX + difY * difY;

      if(len > 0){
        velX += -5.0 * difX / len;
        velY += -5.0 * difY / len;
      }
    }
  }
  
  posX += velX;
  posY += velY;

  if(posX < 0){
    posX  = 0; 
    velX *= -0.9;
  }
  if(posX > 319){
    posX  = 319;
    velX *= -0.9;
  }
  if(posY < 0){
    posY  = 0;
    velY *= -0.9;
  }
  if(posY > 479){
    posY  = 479;
    velY *= -0.9;
  }
  velX *= 0.99;
  velY *= 0.99;

}

//--------------------------------------------------------------
void ofApp::draw(){
	
  ofSetColor(255, 0, 0);
  ofCircle(posX, posY, 48);
	
	ofSetColor(200, 200, 200);
	for(int i = 0 ; i < FINMAX ; i ++)
		if(isTouching[i])
			ofCircle(finX[i], finY[i], 48);
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

  if(touch.id < FINMAX){
  finX      [touch.id] = touch.x;
  finY      [touch.id] = touch.y;
  isTouching[touch.id] = true;
  }

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

  if(touch.id < FINMAX){
    finX[touch.id] = touch.x;
    finY[touch.id] = touch.y;
  }

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

  isTouching[touch.id] = false;

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}

