#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

  ofSetLogLevel(OF_LOG_VERBOSE);

  con.setup(
      "10.0.2.1"
    , 8000
    , 9000
    , ofxCon :: Skin(
        ofColor(255, 255, 255)
      , ofColor(  0,   0,   0)
      , ofColor(255, 255, 255)
    )
  );

	ofxCon :: Container* mother = con.addContainer(NULL, ofRectangle(100, 100, 400, 400));
  mother = con.addContainer(mother, ofRectangle(120, 120, 380, 380) );
  con.addPad(
      mother
    , ofRectangle(140, 140, 360, 360)
    , new ofxCon::NormalMidi(1,1,0,127)
    , new ofxCon::NormalOSC("/pad", 1, 100)
  );
	

  ofSetCircleResolution(30);
	
	ofSetFrameRate(60);
  ofBackground(30, 30, 30);

}

//--------------------------------------------------------------
void ofApp::update(){

  con.update();

}

//--------------------------------------------------------------
void ofApp::draw(){

  con.draw();

}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

  ofLog(OF_LOG_VERBOSE, "touchDown");

  con.touchDown(touch);

}


//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

  ofLog(OF_LOG_VERBOSE, "touchMove");

  con.touchMove(touch);

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

  ofLog(OF_LOG_VERBOSE, "touchUp");

  con.touchUp(touch);

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

