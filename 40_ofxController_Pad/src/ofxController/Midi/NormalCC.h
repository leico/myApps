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


    const static float MIN_VALUE;
    const static float MAX_VALUE;

    private:
      NormalCC(void);
      NormalCC(const NormalCC &obj);
      
    public:
      NormalCC(const int ch, const int controll, const int min_value, const int max_value);
      
      virtual ~NormalCC(void);
      
      virtual void touchDown(float value, Core :: MidiManager *midi);
      virtual void touchMove(float value, Core :: MidiManager *midi);
      virtual void touchUp  (float value, Core :: MidiManager *midi);
  };

  const float NormalCC :: MIN_VALUE = 0;
  const float NormalCC :: MAX_VALUE = 1;
}


#endif /* defined(__emptyExample__NormalCC__) */
