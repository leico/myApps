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
  
    private:
    MidiArg(const MidiArg &obj);

    protected:
    const int _ch;
    const int _pitch;
    const int _min_velocity;
    const int _max_velocity;

    MidiArg(void);
    MidiArg(const int ch, const int pitch, const int min_velocity, const int max_velocity);

    public:
    virtual void touchDown(float value, Core :: MidiManager *midi) = 0;
    virtual void touchMove(float value, Core :: MidiManager *midi) = 0;
    virtual void touchUp  (float value, Core :: MidiManager *midi) = 0;

    public:
    virtual ~MidiArg(void);
  };
}


#endif
