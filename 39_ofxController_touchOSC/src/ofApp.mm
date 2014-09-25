#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

  ofSetLogLevel(OF_LOG_VERBOSE);

  skin = new ofxCon :: Skin(
      ofColor(255, 255, 255)
    , ofColor(  0,   0,   0)
    , ofColor(255, 255, 255)
  );

  test = new ofxCon :: GlobalContainer(
      "10.0.2.1"
    , 8000
    , 9000
    , *skin
  );

  test -> AddController(new ofxCon :: Container(
      ofRectangle(100, 100, 400, 400)
    , skin
    )
  );

  ofSetCircleResolution(30);
	
	ofSetFrameRate(60);
  ofBackground(30, 30, 30);

}

//--------------------------------------------------------------
void ofApp::update(){

  test -> update();

}

//--------------------------------------------------------------
void ofApp::draw(){

  test -> draw();

}

//--------------------------------------------------------------
void ofApp::exit(){

  delete test;
  delete skin;

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

  ofLog(OF_LOG_VERBOSE, "touchDown");

  test -> touchDown(touch);

}


//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

  ofLog(OF_LOG_VERBOSE, "touchMove");


  test -> touchMove(touch);

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

  ofLog(OF_LOG_VERBOSE, "touchUp");

  test -> touchUp(touch);

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

