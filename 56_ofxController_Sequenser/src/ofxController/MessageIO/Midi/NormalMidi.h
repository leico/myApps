//
//  NormalMidi.h
//  emptyExample
//
//  Created by leico on 2014/08/31.
//
//

#ifndef __emptyExample__NormalMidi__
#define __emptyExample__NormalMidi__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "MidiManager.h"

#include "MidiArg.h"

namespace ofxController{

  class NormalMidi : public MidiArg{

    /* MessageIO -------------------------------------
     * const static float MAX_INPUT = 1
     * const static float MIN_INPUT = 0
     */
    /* MidiArg ---------------------------------------
     * protected:
     * const int _ch;
     * const int _pitch;
     * const int _min_velocity;
     * const int _max_velocity;
     */

    private:
      NormalMidi(void);
      NormalMidi(const NormalMidi &obj);

    public:
      NormalMidi(const int ch, const int pitch, const int min_velocity, const int max_velocty);
      virtual ~NormalMidi(void);

      virtual void touchDown(float value, Core :: MidiManager *midi);
      virtual void touchMove(float value, Core :: MidiManager *midi);
      virtual void touchUp  (float value, Core :: MidiManager *midi);

      virtual float newMidiMessage(ofxMidiMessage &msg);
  };
}


#endif /* defined(__emptyExample__NormalMidi__) */
