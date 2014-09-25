//
//  MidiManager.cpp
//  emptyExample
//
//  Created by leico on 2014/08/17.
//
//

#include "MidiManager.h"
namespace ofxController{
namespace Core{

  /* ================================================= *
   * MidiManager :: MidiManager                        *
   * ================================================= */
  MidiManager :: MidiManager(void){}

  /* ================================================= *
   * MidiManager :: MidiManager                        *
   * ================================================= */
  MidiManager :: MidiManager(const MidiManager &obj){}

  /* ================================================= *
   * MidiManager :: ~MidiManager                       *
   * ================================================= */
  MidiManager :: ~MidiManager(void){

    //||||||||||||||||||||||||||||||||||||||||||INPUT|||||||
    //close port and delete
    for(int i = 0 ; i < inputs.size() ; ++ i){

      inputs.at(i) -> closePort();
      inputs.at(i) -> removeListener(this);

      delete inputs.at(i);
    }

    //||||||||||||||||||||||||||||||||||||||||||OUTPUT||||||
    //close port and delete
    for(int i = 0 ; i < outputs.size() ; ++ i){

      outputs.at(i) -> closePort();
      delete outputs.at(i);
    }
  }

  /* ================================================= *
   * MidiManager :: setup                              *
   * ================================================= */
  void MidiManager :: setup(BaseMidi *listener){
		
    //contain listener
    _listener = listener;

    //Enable Networking
    ofxMidi :: enableNetworking();

    //Input------------------------------------
    ofxMidiIn :: listPorts();                                  //Show input ports
    for(int i = 0 ; i < ofxMidiIn :: getNumPorts() ; ++ i){    //all port
                                                               //add listener and
      inputs.push_back(new ofxMidiIn);                         //open port

      inputs.at(i) -> addListener(this);
      inputs.at(i) -> openPort(i);
    }

    //Output------------------------------------
    ofxMidiOut :: listPorts();                                 //Show output ports
    for(int i = 0 ; i < ofxMidiOut :: getNumPorts() ; ++ i){   //all port
                                                               //add listener and
      outputs.push_back(new ofxMidiOut);                       //open port

      outputs.at(i) -> openPort(i);
    }

    //connection add/remove listener setup
    ofxMidi :: setConnectionListener(this);
  }

  /* ================================================= *
   * MidiManager :: newMidiMessage                     *
   * ================================================= */
  void MidiManager :: newMidiMessage(ofxMidiMessage &msg){


    //throw midi message to controllers
    _listener -> newMidiMessage(msg);

    //debug......
    stringstream str;
    str << "Ch       : " << msg.channel  << "\n"
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

    /* --------------------------------------------------- *
     * search ports, close and delete it                   *
     * --------------------------------------------------- */
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

    /* --------------------------------------------------- *
     * search ports, close and delete it                   *
     * --------------------------------------------------- */
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
   * MidiManager :: sendPolyAfterTouch                 *
   * ================================================= */
  void MidiManager :: sendPolyAfterTouch(int ch, int pitch, int velocity){
    
    for(int i = 0 ; i < outputs.size() ; ++ i)
      outputs.at(i) -> sendPolyAftertouch(ch, pitch, velocity);
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


}
}
