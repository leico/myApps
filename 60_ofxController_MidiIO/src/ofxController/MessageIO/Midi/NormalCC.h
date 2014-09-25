//
//  NormalCC.h
//  emptyExample
//
//  Created by leico on 2014/08/31.
//
//

#ifndef __emptyExample__NormalCC__
#define __emptyExample__NormalCC__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "MidiManager.h"

#include "MidiArg.h"

namespace ofxController{

  class NormalCC : public MidiArg{


    /* MessageIO -----------------------------
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
      NormalCC(void);
      NormalCC(const NormalCC &obj);
      
    public:
      NormalCC(const int ch, const int control, const int min_value, const int max_value);
      
      virtual ~NormalCC(void);
      
      virtual void touchDown(float value, Core :: MidiManager *midi);
      virtual void touchMove(float value, Core :: MidiManager *midi);
      virtual void touchUp  (float value, Core :: MidiManager *midi);

      virtual float newMidiMessage(ofxMidiMessage &msg);
  };

}


#endif /* defined(__emptyExample__NormalCC__) */
