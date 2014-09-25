#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

  osc.setup("10.0.2.1", 8000, 9000);
  midi.setup();

  ofSetCircleResolution(30);
	
	ofSetFrameRate(60);
  ofBackground(30, 30, 30);

  box.set(100,100, 300, 300);

  on = false;
}

//--------------------------------------------------------------
void ofApp::update(){

  while( osc.hasWaitingMessages() ){
    ofxOscMessage m;
    osc.getNextMessage(&m);
    if(m.getAddress() == "/button"){
      int data = m.getArgAsInt32(0);

      on = data == 0 ? false : true;
    }
  }

}

//--------------------------------------------------------------
void ofApp::draw(){

  ofSetColor( on ? ofColor(230) : ofColor(50) );
  ofRect(box);
  

}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

  bool inside = box.inside(touch.x, touch.y);

  if(inside){

    on = !on;
    ofxOscMessage m;
    m.setAddress("/button");
    m.addIntArg(on ? 1 : 0);
    osc.sendMessage(m);

    midi.sendControlChange(1, 1, on ? 127 : 0);
  }
 

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

