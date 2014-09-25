#include "ofApp.h"


const char* const ofApp :: HOST_NAME   = "10.0.2.1";
const int         ofApp :: HOST_PORT   = 8000;
const int         ofApp :: LISTEN_PORT = 9000;

//--------------------------------------------------------------
void ofApp::setup(){
  ofSetOrientation(OF_ORIENTATION_90_RIGHT);

  ofBackground(40, 100, 40);
  
  osc.setup(HOST_NAME, HOST_PORT, LISTEN_PORT);
}

//--------------------------------------------------------------
void ofApp::update(){
  
  if(ofGetFrameNum() % 120 == 0){
    ofxOscMessage m;
    m.setAddress( "/misc/heartbeat" );
    m.addIntArg( ofGetFrameNum() );
    osc.sendMessage(m);
  }

}

//--------------------------------------------------------------
void ofApp::draw(){

  string buf;
  buf = "sending osc message to " + string(HOST_NAME) + ofToString(HOST_PORT);
  ofDrawBitmapString(buf, 10, 20);
  ofDrawBitmapString( "move the mouse to send osc message\n[/mouse/position <x> <y>]", 10, 50);
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

  ofxOscMessage m;
  m.setAddress("/mouse/button");
  m.addStringArg("down");
  osc.sendMessage(m);

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
  ofxOscMessage m;
  m.setAddress("/mouse/position");
  m.addIntArg(touch.x);
  m.addIntArg(touch.y);
  osc.sendMessage(m);
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

  ofxOscMessage m;
  m.setAddress("/mouse/button");
  m.addStringArg("up");
  osc.sendMessage(m);

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

