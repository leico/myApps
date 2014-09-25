#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
  
  ofxAccelerometer.setup();
  ofBackground(255, 255, 255);
  
  posX = 160;
  posY = 240;

}

//--------------------------------------------------------------
void ofApp::update(){

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

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

  posX = touch.x;
  posY = touch.y;

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

