#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

  ofSetLogLevel(OF_LOG_VERBOSE);

  ofSetOrientation(OF_ORIENTATION_90_RIGHT);

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

  const int   ch   =   9;
  const int   step =  16;
  const float bpm  = 130;
  
  const float height = ofGetHeight() / ch;
  const float width  = ofGetWidth () / (step + 1);
	string message[ch];
	message[0] = "/Seq/";
	message[1] = "/Seeeeeeq/";
	message[2] = "/Seeeeeeeeeeeeeeq/";
	message[3] = "/Seeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeq/";
	message[4] = "/Seqqqqqqqqqqqeeeeeeeeeeeeeeeennnnnnnnnnnnssser/";
	message[5] = "/SSSSSSSEEEEEEEEQQQQQQQQQQQUUUUUUUUUUEEEEEEEEEEEEEEEENNNNNNNNNNNSSSSSSSSEEEEEERRRRRRRR/";
	message[6] = "/AASDFADEFImdifnakediakAdgiahelsidmNagiandleigLegia/";
	message[7] = "/aobie/";
	message[8] = "/pulsesequenser/";
	
	

  for(int y = 0 ; y < ch ; ++ y){

    con.addSwitch(
        NULL
      , ofRectangle(0, y * height, width, height)
      , new ofxCon :: NoMidi()
      , new ofxCon :: NormalOSC("/Record/" + ofToString(y), 0, 1)
    );

    con.addSequenser(
        NULL
      , ofRectangle(width, y * height, width * step, height)
      , new ofxCon:: NoMidi()
      , new ofxCon:: NormalOSC( message[y] + ofToString(y), 0, 1)
      , bpm
      , step);
  }    
	

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

