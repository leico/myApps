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
    , 9000
    , 8000
    , *skin
  );

  ofxCon :: Container *tmp   = test;
  ofxCon :: Container *tmp2  = tmp;
  for(int i = 0 ; i < 20 ; ++ i){

    tmp2 = new ofxCon :: Container(
        ofRectangle(i * 10, i * 10, ofGetWidth() - i * 20 , ofGetHeight() - i * 20)
      , skin
    );

    tmp -> AddController(tmp2);
    tmp = tmp2;
  }

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

