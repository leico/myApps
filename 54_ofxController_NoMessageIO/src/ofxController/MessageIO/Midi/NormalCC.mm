//
//  NormalCC.cpp
//  emptyExample
//
//  Created by leico on 2014/08/31.
//
//

#include "NormalCC.h"

namespace ofxController{

  /* ================================== *
   * NormalCC :: NormalCC               *
   * ================================== */
  NormalCC :: NormalCC(void) : MidiArg() {}

  /* ================================== *
   * NormalCC :: NormalCC               *
   * ================================== */
  NormalCC :: NormalCC(const NormalCC &obj) : MidiArg() {}

  /* ================================== *
   * NormalCC :: NormalCC               *
   * ================================== */
  NormalCC :: NormalCC(const int ch,        const int control, 
                       const int min_value, const int max_value) :
    MidiArg(ch, control, min_value, max_value)
  {}


  /* ================================== *
   * NormalCC :: ~NormalCC              *
   * ================================== */
  NormalCC :: ~NormalCC(void){}



  /* ================================== *
   * NormalCC :: touchDown              *
   * ================================== */
  void NormalCC :: touchDown(float value, Core :: MidiManager *midi){
    
    midi -> sendControlChange(
        _ch
      , _pitch
      , ofMap(value, MIN_INPUT_VALUE, MAX_INPUT_VALUE, _min_velocity, _max_velocity));
    return;
  }

  /* ================================== *
   * NormalCC :: touchMove              *
   * ================================== */
  void NormalCC :: touchMove(float value, Core :: MidiManager *midi){
    
    touchDown(value, midi);
    return;
  }

  /* ================================== *
   * NormalCC :: touchUp                *
   * ================================== */
  void NormalCC :: touchUp(float value, Core :: MidiManager *midi){
    touchDown(value, midi);
    return;
  }

  /* ================================== *
   * NormalCC :: newMidiMessage         *
   * ================================== */
  float NormalCC :: newMidiMessage(ofxMidiMessage &msg){

    if( ! (msg.status == MIDI_CONTROL_CHANGE)) return NAN;

    if(msg.channel == _ch && msg.control == _pitch)
      return ofClamp(
          ofMap(msg.value, _min_velocity, _max_velocity, MIN_INPUT_VALUE, MAX_INPUT_VALUE)
        , MIN_INPUT_VALUE
        , MAX_INPUT_VALUE
      );

    return NAN;
  }
}
