#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	

  ofxAccelerometer.setup();

  ofBackground(255, 255, 255);
  ofSetFrameRate(30);
  
  this -> rad  = 0;
  this -> posX = 0;
  this -> posY = 0;
}

//--------------------------------------------------------------
void ofApp::update(){

  this -> rad += 0.01;
  posX = 160 + 100 * cos(rad * 5);
  posY = 240 + 100 * sin(rad * 6);

}

//--------------------------------------------------------------
void ofApp::draw(){

  ofSetColor(255, 0, 0);
  ofCircle(this -> posX, this -> posY, 96);
	
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

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

