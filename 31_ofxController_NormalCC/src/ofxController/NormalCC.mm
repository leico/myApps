//
//  NormalCC.cpp
//  emptyExample
//
//  Created by leico on 2014/08/31.
//
//

#include "NormalCC.h"

namespace ofxController{

  NormalCC :: NormalCC(void) : MidiArg() {}

  NormalCC :: NormalCC(const int ch,        const int controll, 
                       const int min_value, const int max_value) :
    MidiArg(ch, controll, min_value, max_value)
  {}

  NormalCC :: ~NormalCC(void){}
  

  void NormalCC :: touchDown(float value, Core :: MidiManager *midi){
    
    midi -> sendControlChange(_ch, _pitch, ofMap(value, 0., 1., _min_velocity, _max_velocity));
    return;
  }

  void NormalCC :: touchMove(float value, Core :: MidiManager *midi){
    
    touchDown(value, midi);
    return;
  }

  void NormalCC :: touchUp(float value, Core :: MidiManager *midi){
    touchDown(value, midi);
    return;
  }
}
