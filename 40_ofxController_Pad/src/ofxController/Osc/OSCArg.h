//
//  OSCArg.h
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#ifndef __emptyExample__OSCArg__
#define __emptyExample__OSCArg__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "OSCManager.h"

namespace ofxController{

  class OSCArg{

    private:
    OSCArg(const OSCArg &obj);

    protected:
    const std :: string _address;
    const float _min;
    const float _max;

    OSCArg(void);
    OSCArg(const std :: string &address, const float min, const float max);

    public:
    
    virtual void touchDown(float value, Core :: OSCManager *osc) = 0;
    virtual void touchMove(float value, Core :: OSCManager *osc) = 0;
    virtual void touchUp  (float value, Core :: OSCManager *osc) = 0;

    public:
    virtual ~OSCArg(void);

  };
}

#endif /* defined(__emptyExample__OSCArg__) */
