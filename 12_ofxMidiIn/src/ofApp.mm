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

  for(int i = 0 ; i < ofxMidiIn :: getNumPorts() ; ++ i){
    
    inputs.push_back(new ofxMidiIn);

    inputs.at(i) -> addListener(this);
    inputs.at(i) -> openPort(i);
  }

  ofxMidi :: setConnectionListener(this);

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){

  ofSetColor(0);

  ofDrawBitmapString("Input :", 10, 20);

  ofPoint pos(10, 34);

  messageMutex.lock();
    for(deque<string> :: iterator it = messages.begin() ; it != messages.end() ; ++ it){
      ofDrawBitmapString((*it), pos);
      pos.y += 14;
    }
  messageMutex.unlock();

}

//--------------------------------------------------------------
void ofApp::exit(){

  for(int i = 0 ; i < inputs.size() ; ++ i){
    
    inputs.at(i) -> closePort();
    inputs.at(i) -> removeListener(this);
    delete inputs.at(i);
  }

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

  addMessage(msg.toString());
}

/* =========================================== *
 * ofApp :: midiInputAdded                     *
 * =========================================== */
void ofApp :: midiInputAdded(string name, bool isNetwork){

  stringstream msg;
  msg << "ofxMidi : input added: " << name << " network: " << isNetwork << endl;
  addMessage(msg.str());

  ofxMidiIn *newInput = new ofxMidiIn;

  newInput -> openPort(name);
  newInput -> addListener(this);

  inputs.push_back(newInput);
}

/* =========================================== *
 * ofApp :: midiInputRemoved                   *
 * =========================================== */
void ofApp :: midiInputRemoved(string name, bool isNetwork){

  stringstream msg;
  msg << "ofxMidi : input removed: " << name << " network: " << isNetwork << endl;
  addMessage(msg.str());

  for(vector<ofxMidiIn*> :: iterator it = inputs.begin() ; it != inputs.end() ; ++ it){
    
    if( (*it) -> getName() == name){
      (*it) -> closePort();
      (*it) -> removeListener(this);
      delete (*it);

      inputs.erase(it);
      break;
    }
  }
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
