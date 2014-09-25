//
//  MidiArg.mm
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "MidiArg.h"

namespace ofxController{
  /* ============================================ *
   * MidiArg :: MIN_VALUE                         *
   * ============================================ */
  const float MidiArg :: MIN_VALUE = 0;

  /* ============================================ *
   * MidiArg :: MAX_VALUE                         *
   * ============================================ */
  const float MidiArg :: MAX_VALUE = 1;

  /* ============================================ *
   * MidiArg :: MidiArg                           *
   * ============================================ */

  MidiArg :: MidiArg(const MidiArg &obj) : 
    _ch   (-1), 
    _pitch(-1), 
    _min_velocity(-1),
    _max_velocity(-1)
  {}


  MidiArg :: MidiArg(void) :
    _ch   (-1),
    _pitch(-1),
    _min_velocity(-1),
    _max_velocity(-1)
  {}


  MidiArg :: MidiArg(const int ch,           const int pitch, 
                     const int min_velocity, const int max_velocity) : 
    _ch(ch), 
    _pitch(pitch), 
    _min_velocity(min_velocity),
    _max_velocity(max_velocity)
  {}

  /* ============================================ *
   * MidiArg :: ~MidiArg                          *
   * ============================================ */
  MidiArg :: ~MidiArg(void){}

}
