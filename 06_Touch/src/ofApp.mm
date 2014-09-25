#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
  
  ofxAccelerometer.setup();
  ofBackground(255, 255, 255);
  
  posX = 160;
  posY = 240;
  velX = 0;
  velY = 0;

}

//--------------------------------------------------------------
void ofApp::update(){
  
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

  posX = touch.x;
  posY = touch.y;
  velX = velY = 0;

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

  velX = touch.x - posX;
  velY = touch.y - posY;

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

