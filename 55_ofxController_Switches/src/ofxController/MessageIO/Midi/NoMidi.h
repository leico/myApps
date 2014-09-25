//
//  NoMidi.h
//  emptyExample
//
//  Created by leico on 2014/09/11.
//
//

#ifndef __emptyExample__NoMidi__
#define __emptyExample__NoMidi__

#include "MidiArg.h"

namespace ofxController{

  class NoMidi : public MidiArg{

    public:
             NoMidi(void) : MidiArg(){};
    virtual ~NoMidi(void){};
    
    virtual void touchDown(float value, Core :: MidiManager *midi){};
    virtual void touchMove(float value, Core :: MidiManager *midi){};
    virtual void touchUp  (float value, Core :: MidiManager *midi){};
    
    virtual float newMidiMessage(ofxMidiMessage &msg){ return NAN; };
    
  };

}

#endif /* defined(__emptyExample__NoMidi__) */
