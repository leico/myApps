//
//  MidiArg.h
//  emptyExample
//
//  Created by leico on 2014/08/31.
//
//

#ifndef emptyExample_MidiArg_h
#define emptyExample_MidiArg_h

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "MidiManager.h"

namespace ofxController{
  
  class MidiArg{
   
    protected:
    const int _ch;
    const int _pitch;
    const int _min_velocity;
    const int _max_velocity;

    MidiArg(void);
    MidiArg(const int ch, const int pitch, const int min_velocity, const int max_velocity);

    virtual void touchDown(float value, Core :: MidiManager *midi) = 0;
    virtual void touchMove(float value, Core :: MidiManager *midi) = 0;
    virtual void touchUP  (float value, Core :: MidiManager *midi) = 0;

    public:
    virtual ~MidiArg(void);
  };

  /* ============================================ *
   * MidiArg :: MidiArg                           *
   * ============================================ */
  inline MidiArg :: MidiArg(void) :
    _ch   (-1),
    _pitch(-1),
    _min_velocity(-1),
    _max_velocity(-1)
  {}


  inline MidiArg :: MidiArg(const int ch,           const int pitch, 
                            const int min_velocity, const int max_velocity) : 
    _ch(ch), 
    _pitch(pitch), 
    _min_velocity(min_velocity),
    _max_velocity(max_velocity)
  {}

  /* ============================================ *
   * MidiArg :: ~MidiArg                          *
   * ============================================ */
  inline MidiArg :: ~MidiArg(void){}
}


#endif
