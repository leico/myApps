#include "ofApp.h"

void addMessage(string msg);


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

  for(int i = 0 ; i < ofxMidiOut :: getNumPorts() ; ++ i){
    
    outputs.push_back(new ofxMidiOut);

    outputs.at(i) -> openPort(i);
  }

  ofxMidi :: setConnectionListener(this);

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){

  ofSetColor(0);

  ofDrawBitmapString("Output:", 10, ofGetHeight() - 42);
  if(note > 0){
    ofDrawBitmapString("note " + ofToString(note), 10, ofGetHeight() - 28);
    ofRect(80, ofGetHeight() - 38, ofMap(note, 0, 127, 0, ofGetWidth() - 10), 12);
  }
  if(ctl > 0){
    ofDrawBitmapString("pan " + ofToString(ctl), 10, ofGetHeight() - 14);
    ofRect(80, ofGetHeight() - 24, ofMap(ctl, 0, 127, 0, ofGetWidth() - 10), 12);
  }
}

//--------------------------------------------------------------
void ofApp::exit(){

  for(int i = 0 ; i < outputs.size() ; ++ i){
    
    outputs.at(i) -> closePort();
    delete outputs.at(i);
  }

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

  note = (int) ofMap(touch.y, ofGetHeight(), 0, 0, 127);

  for(int i = 0 ; i < outputs.size() ; ++ i)
    outputs.at(i) -> sendNoteOn(1, note);

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

  ctl = (int) ofMap(touch.x, 0, ofGetWidth(), 0, 127);

  for(int i = 0 ; i < outputs.size() ; ++ i)
    outputs.at(i) -> sendControlChange(1, 10, ctl);
    

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

  for(int i = 0 ; i < outputs.size() ; ++ i)
    outputs.at(i) -> sendNoteOff(1, note);

  note = -1;
  ctl  = -1;

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

  addMessage(msg.toString());
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

  stringstream msg;
  msg << "ofxMidi: output added: " << name << " network: " << isNetwork << endl;
  addMessage(msg.str());

  ofxMidiOut *newOutput = new ofxMidiOut();
  newOutput -> openPort(name);
  outputs.push_back(newOutput);
}

/* =========================================== *
 * ofApp :: midiOutputRemoved                  *
 * =========================================== */
void ofApp :: midiOutputRemoved(string name, bool isNetwork){
  
  stringstream msg;
  msg << "ofxMidi: output removed: " << name << " network: " << isNetwork << endl;
  addMessage(msg.str());

  for( vector<ofxMidiOut*> :: iterator it ; it != outputs.end() ; ++ it){
    if((*it) -> getName() == name){

      (*it) -> closePort();
      delete (*it);

      outputs.erase(it);
    }
  }
  
}

/* =========================================== *
 * ofApp :: addMessage                         *
 * =========================================== */
void ofApp :: addMessage(const string &msg){
  messageMutex.lock();
    cout << msg << endl;
    messages.push_back(msg);
    while(messages.size() > maxMessages) messages.pop_front();
  messageMutex.unlock();
}
