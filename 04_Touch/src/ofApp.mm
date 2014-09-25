#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
  
  ofxAccelerometer.setup();
  ofBackground(255, 255, 255);
  
  goalX = posX = 160;
  goalY = posY = 240;

}

//--------------------------------------------------------------
void ofApp::update(){

  float diffX = goalX - posX;
  float diffY = goalY - posY;

  posX += diffX * 0.05;
  posY += diffY * 0.05;


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

  goalX = touch.x;
  goalY = touch.y;

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

  goalX = touch.x;
  goalY = touch.y;

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

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

