#include "ofApp.h"


const char* const ofApp :: HOST_NAME   = "10.0.2.1";
const int         ofApp :: HOST_PORT   = 8000;
const int         ofApp :: LISTEN_PORT = 9000;

//--------------------------------------------------------------
void ofApp::setup(){
  ofSetOrientation(OF_ORIENTATION_90_RIGHT);

  cout << "listening for osc messages on port " << LISTEN_PORT << "\n";
  osc.setup(HOST_NAME, HOST_PORT, LISTEN_PORT);

  current_msg_string = 0;
  mouseX = 0;
  mouseY = 0;
  mouseButtonState = "";

  ofBackground(40, 100, 40);
  
}

//--------------------------------------------------------------
void ofApp::update(){
  
  if(ofGetFrameNum() % 120 == 0){
    ofxOscMessage m;
    m.setAddress( "/misc/heartbeat" );
    m.addIntArg( ofGetFrameNum() );
    osc.sendMessage(m);
  }

  for(int i = 0 ; i < NUM_MSG_STRINGS ; ++ i){
    if( timers[i] < ofGetElapsedTimef() )
      msg_strings[i] = "";
  }

  while( osc.hasWaitingMessages() ){
    
    ofxOscMessage m;
    osc.getNextMessage(&m);

    if( m.getAddress() == "/mouse/position"){
      mouseX = m.getArgAsInt32(0);
      mouseY = m.getArgAsInt32(1);
    }
    else if( m.getAddress() == "/mouse/button" ){
      mouseButtonState = m.getArgAsString(0);
    }
    else{
      
      string msg_string;
      msg_string = m.getAddress();
      msg_string += ": ";

      for(int i = 0 ; i < m.getNumArgs() ; ++ i){
        
        msg_string += m.getArgTypeName(i);
        msg_string += ":";

        switch( m.getArgType(i) ){
          
          case OFXOSC_TYPE_INT32:
            msg_string += ofToString( m.getArgAsInt32(i) ) + " ";
          break;
          case OFXOSC_TYPE_FLOAT:
            msg_string += ofToString( m.getArgAsFloat(i) ) + " ";
          break;
          case OFXOSC_TYPE_STRING:
            msg_string += m.getArgAsString(i) + " ";
          break;
          default:
            msg_string += "unknown";
          break;
        }
      }

      msg_strings[current_msg_string] = msg_string;
      timers     [current_msg_string] = ofGetElapsedTimef() + 5.0f;
      current_msg_string = ( current_msg_string + 1) % NUM_MSG_STRINGS;

      msg_strings[current_msg_string] = "";

    }
  }
}

//--------------------------------------------------------------
void ofApp::draw(){

  string buf;
  buf = "sending osc message to " + string(HOST_NAME) + ofToString(HOST_PORT);
  ofDrawBitmapString(buf, 10, 20);
  ofDrawBitmapString( "move the mouse to send osc message\n[/mouse/position <x> <y>]", 10, 50);

  buf = "listening for osc messages on port " + ofToString(LISTEN_PORT);
  ofDrawBitmapString(buf, 10, 80);
  
  buf = "mouse: " + ofToString(mouseX, 4) + " " + ofToString(mouseY, 4);
  ofDrawBitmapString(buf, 10, 120);
  ofDrawBitmapString(mouseButtonState, 10, 150);

  for(int i = 0 ; i < NUM_MSG_STRINGS ; ++ i)
    ofDrawBitmapString( msg_strings[i], 10, 180 + 15 * i);
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

