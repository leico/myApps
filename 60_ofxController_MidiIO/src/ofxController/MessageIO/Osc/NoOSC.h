//
//  NoOSC.h
//  emptyExample
//
//  Created by leico on 2014/09/11.
//
//

#ifndef __emptyExample__NoOSC__
#define __emptyExample__NoOSC__

#include "OSCArg.h"

namespace ofxController{

  class NoOSC : public OSCArg{

    public:
             NoOSC(void) : OSCArg() {};
    virtual ~NoOSC(void){};

    virtual void touchDown(float value, Core :: OSCManager *osc){};
    virtual void touchMove(float value, Core :: OSCManager *osc){};
    virtual void touchUp  (float value, Core :: OSCManager *osc){};

    virtual float newOscMessage(ofxOscMessage &msg){ return NAN; };
  };
}

#endif /* defined(__emptyExample__NoOSC__) */
