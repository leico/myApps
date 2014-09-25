//
//  NormalMidi.cpp
//  emptyExample
//
//  Created by leico on 2014/08/31.
//
//

#include "NormalMidi.h"

namespace ofxController{

  /* ========================================== *
   * NormalMidi :: NormalMidi                   *
   * ========================================== */
  NormalMidi :: NormalMidi(void) : MidiArg(){}

  /* ========================================== *
   * NormalMidi :: NormalMidi                   *
   * ========================================== */
  NormalMidi :: NormalMidi(const int ch,           const int pitch,
                           const int min_velocity, const int max_velocity) :
    MidiArg(ch, pitch, min_velocity, max_velocity)
  {}

  /* ========================================== *
   * NormalMidi :: ~NormalMidi                  *
   * ========================================== */
  NormalMidi :: ~NormalMidi(void){}
  
  /* ========================================== *
   * NormalMidi :: touchDown                    *
   * ========================================== */
  void NormalMidi :: touchDown(float value, Core :: MidiManager *midi){
    
    midi -> sendNoteOn(_ch, _pitch, ofMap(value, 0., 1., _min_velocity, _max_velocity));
  }

  /* ========================================== *
   * NormalMidi :: touchMove                    *
   * ========================================== */
  void NormalMidi :: touchMove(float value, Core :: MidiManager *midi){

    midi -> sendPolyAfterTouch(_ch, _pitch, ofMap(value, 0., 1., _min_velocity, _max_velocity));
  }

  /* ========================================== *
   * NormalMidi :: touchUp                      *
   * ========================================== */
  void NormalMidi :: touchUp(float value, Core :: MidiManager *midi){

    midi -> sendNoteOff(_ch, _pitch, ofMap(value, 0., 1., _min_velocity, _max_velocity));
  }
}
