//
//  MidiManager.cpp
//  emptyExample
//
//  Created by leico on 2014/08/17.
//
//

#include "MidiManager.h"

/* ================================================= *
 * MidiManager :: MidiManager                        *
 * ================================================= */
MidiManager :: MidiManager(void){

  note = -1;
  ctl  = -1;

  ofxMidi :: enableNetworking();



  ofxMidiIn :: listPorts();
  for(int i = 0 ; i < ofxMidiIn :: getNumPorts() ; ++ i){
    
    inputs.push_back(new ofxMidiIn);

    inputs.at(i) -> addListener(this);
    inputs.at(i) -> openPort(i);
  }



  ofxMidiOut :: listPorts();
  for(int i = 0 ; i < ofxMidiOut :: getNumPorts() ; ++ i){
    
    outputs.push_back(new ofxMidiOut);

    outputs.at(i) -> openPort(i);
  }

  ofxMidi :: setConnectionListener(this);
}


/* ================================================= *
 * MidiManager :: ~MidiManager                       *
 * ================================================= */

MidiManager :: ~MidiManager(void){

  for(int i = 0 ; i < inputs.size() ; ++ i){
    
    inputs.at(i) -> closePort();
    inputs.at(i) -> removeListener(this);

    delete inputs.at(i);
  }

  for(int i = 0 ; i < outputs.size() ; ++ i){

    outputs.at(i) -> closePort();
    delete outputs.at(i);
  }
}

/* ================================================= *
 * MidiManager :: newMidiMessage                     *
 * ================================================= */
void MidiManager :: newMidiMessage(ofxMidiMessage &msg){

  stringstream str;
  str << "Status   : " << msg.getStatusString(msg.status) << "\n" 
      << "Ch       : " << msg.channel  << "\n"
      << "Pitch    : " << msg.pitch    << "\n"
      << "Velocity : " << msg.velocity << "\n"
      << "Control  : " << msg.control  << "\n"
      << "Value    : " << msg.value    << endl;

  ofLog(OF_LOG_VERBOSE, str.str());



}
/* ================================================= *
 * MidiManager :: midiInputAdded                     *
 * ================================================= */
void MidiManager :: midiInputAdded(string name, bool isNetwork){

  ofxMidiIn *newInput = new ofxMidiIn;

  newInput -> openPort   (name);
  newInput -> addListener(this);

  inputs.push_back(newInput);
}

/* ================================================= *
 * MidiManager :: midiInputRemoved                   *
 * ================================================= */
void MidiManager :: midiInputRemoved(string name, bool isNetwork){

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

/* ================================================= *
 * MidiManager :: midiOutputAdded                    *
 * ================================================= */
void MidiManager :: midiOutputAdded(string name, bool isNetwork){

  ofxMidiOut *newOutput = new ofxMidiOut();
  newOutput -> openPort(name);
  outputs.push_back(newOutput);
}

/* ================================================= *
 * MidiManager :: midiOutputRemoved                  *
 * ================================================= */
void MidiManager :: midiOutputRemoved(string name, bool isNetwork){

  for(vector< ofxMidiOut* > :: iterator it ; it != outputs.end() ; ++ it){

    if( (*it) -> getName() == name){

      (*it) -> closePort();
      delete (*it);
      
      outputs.erase(it);
    }
  }
}
/* ================================================= *
 * MidiManager :: sendNoteOn                         *
 * ================================================= */
void MidiManager :: sendNoteOn(int ch, int pitch, int velocity){

  for(int i = 0 ; i < outputs.size() ; ++ i)
    outputs.at(i) -> sendNoteOn(ch, pitch, velocity);
}

/* ================================================= *
 * MidiManager :: sendNoteOff                        *
 * ================================================= */
void MidiManager :: sendNoteOff(int ch, int pitch, int velocity){
  for(int i = 0 ; i < outputs.size() ; ++ i)
    outputs.at(i) -> sendNoteOff(ch, pitch, velocity);
}

/* ================================================= *
 * MidiManager :: sendCCMessage                      *
 * ================================================= */
void MidiManager :: sendControlChange(int ch, int control, int value){

  for(int i = 0 ; i < outputs.size() ; ++ i)
    outputs.at(i) -> sendControlChange(ch, control, value);
}

