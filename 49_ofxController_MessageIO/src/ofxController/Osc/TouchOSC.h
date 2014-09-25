//
//  touchOSC.h
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#ifndef __emptyExample__touchOSC__
#define __emptyExample__touchOSC__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "NormalOSC.h"

namespace ofxController{

  class TouchOSC : public NormalOSC{


    /* MessageIO -----------------------------
     * const static float MAX_INPUT = 1
     * const static float MIN_INPUT = 0
     */
    /* OSCArg --------------------------------
     * protected:
     * const std :: string _address;
     * const float _min;
     * const float _max;
     */
    /* NormalOSC -----------------------------
     * const static char NORMAL_DOMAIN[] = "/value";
     */

    const static char TOUCH_DOMAIN[]; //= "/touch"

    const float _on;
    const float _off;

    public:
    TouchOSC(void);
    TouchOSC(const TouchOSC &obj);
    TouchOSC(
        const std :: string &address
      , const float          min
      , const float          max
      , const float          on  = 1
      , const float          off = 0);

    virtual ~TouchOSC(void);
    
    virtual void touchDown(float value, Core :: OSCManager *osc);
    virtual void touchMove(float value, Core :: OSCManager *osc);
    virtual void touchUp  (float value, Core :: OSCManager *osc);
    
  };

}

#endif /* defined(__emptyExample__touchOSC__) */
