#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
  
  ofxAccelerometer.setup();
  ofBackground(255, 255, 255);
  
  posX = 160;
  posY = 240;
  velX = 0;
  velY = 0;

  isTouching = false;

}

//--------------------------------------------------------------
void ofApp::update(){

  if(isTouching){
    float difX = finX - posX;
    float difY = finY - posY;
    float len  = difX * difX + difY * difY;

    if(len > 0){
      velX += -10.0 * difX / len;
      velY += -10.0 * difY / len;
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

  ofSetColor(255, 0, 0);
}

//--------------------------------------------------------------
void ofApp::draw(){

  ofCircle(posX, posY, 48);
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

  finX = touch.x;
  finY = touch.y;
  isTouching = true;

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

  finX = touch.x;
  finY = touch.y;

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

  isTouching = false;

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

