//
//  NormalOSC.h
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#ifndef __emptyExample__NormalOSC__
#define __emptyExample__NormalOSC__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "OSCArg.h"

namespace ofxController{

  class NormalOSC : public OSCArg{

    /* OSCArg --------------------------------
     * public:
     * const static float MIN_VALUE = 0;
     * const static float MAX_VALUE = 1;
     *
     * protected:
     * const std :: string _address;
     * const float _min;
     * const float _max;
     */

    protected:

    const static char NORMAL_DOMAIN[]; // = "/value"

    public:
     NormalOSC(void);
     NormalOSC(const NormalOSC &obj);
     NormalOSC(const std :: string &address, const float min, const float max);
    virtual ~NormalOSC(void);

    virtual void touchDown(float value, Core :: OSCManager *osc);
    virtual void touchMove(float value, Core :: OSCManager *osc);
    virtual void touchUp  (float value, Core :: OSCManager *osc);

    virtual float newOscMessage(ofxOscMessage &msg);
  };

}
#endif /* defined(__emptyExample__NormalOSC__) */
