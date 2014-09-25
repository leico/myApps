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
#include "MessageIO.h"

namespace ofxController{
  
  class MidiArg : public MessageIO{


    /* MessageIO -----------------------------
     * const static float MAX_INPUT = 1
     * const static float MIN_INPUT = 0
     */

    protected:
    const int _ch;
    const int _pitch;
    const int _min_velocity;
    const int _max_velocity;

    private:
    MidiArg(const MidiArg &obj);

    protected:
    MidiArg(void);
    MidiArg(const int ch, const int pitch, const int min_velocity, const int max_velocity);

    public:
    virtual void touchDown(float value, Core :: MidiManager *midi) = 0;
    virtual void touchMove(float value, Core :: MidiManager *midi) = 0;
    virtual void touchUp  (float value, Core :: MidiManager *midi) = 0;

    virtual float newMidiMessage(ofxMidiMessage &msg) = 0;

    public:
    virtual ~MidiArg(void);
  };
}


#endif
