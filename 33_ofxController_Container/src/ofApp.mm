#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

  ofSetLogLevel(OF_LOG_VERBOSE);

  testskin = new ofxCon :: Skin(
    ofColor(255, 255, 255),
    ofColor(  0,   0,   0),
    ofColor(255, 255, 255)
  );

  test = new  ofxCon :: Container(
      ofRectangle(100, 100, 100, 100)
    , testskin
  );

  osc.setup(test, "10.0.2.1", 8000, 9000);
  midi.setup(test);

  ofSetCircleResolution(30);
	
	ofSetFrameRate(60);
  ofBackground(30, 30, 30);

}

//--------------------------------------------------------------
void ofApp::update(){

  while( osc.hasWaitingMessages() ){
    ofxOscMessage m;
    osc.getNextMessage(&m);

    string str(m.getAddress());

    ofLog(OF_LOG_VERBOSE, str );
  }

  test -> update();

}

//--------------------------------------------------------------
void ofApp::draw(){

  test -> draw();

}

//--------------------------------------------------------------
void ofApp::exit(){

  delete test;
  delete testskin;

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

