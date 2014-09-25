#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

  ofxAccelerometer.setup();

  ofxiOSAlerts.addListener(this);

  ofSetLogLevel(OF_LOG_VERBOSE);

  ofBackground(127, 127, 127);

  maxMessages = 28;
  messages.push_back("nothing yet ...");

  note = -1;
  ctl  = -1;

  ofxMidi :: enableNetworking();

  ofxMidiIn  :: listPorts();
  ofxMidiOut :: listPorts();

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	
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



/* =========================================== *
 * ofApp :: newMidiMessage                     *
 * =========================================== */
void ofApp :: newMidiMessage(ofxMidiMessage &msg){
}

/* =========================================== *
 * ofApp :: midiInputAdded                     *
 * =========================================== */
void ofApp :: midiInputAdded(string name, bool isNetwork){
}

/* =========================================== *
 * ofApp :: midiInputRemoved                   *
 * =========================================== */
void ofApp :: midiInputRemoved(string name, bool isNetwork){

}

/* =========================================== *
 * ofApp :: midiOutputAdded                    *
 * =========================================== */
void ofApp :: midiOutputAdded(string name, bool isNetwork){
}

/* =========================================== *
 * ofApp :: midiOutputRemoved                  *
 * =========================================== */
void ofApp :: midiOutputRemoved(string name, bool isNetwork){
}
 
