//
//  touchOSC.mm
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "TouchOSC.h"

namespace ofxController{

  /* ================================================== *
   * TouchOSC :: TouchOSC                               *
   * ================================================== */
  TouchOSC :: TouchOSC(void) : 
      NormalOSC()
    , _on (1)
    , _off(0)
  {}

  /* ================================================== *
   * TouchOSC :: TouchOSC                               *
   * ================================================== */
  TouchOSC :: TouchOSC(const TouchOSC &obj) : 
      NormalOSC(obj._address, obj._min, obj._max)
    , _on (obj._on)
    , _off(obj._off)
  {}

  /* ================================================== *
   * TouchOSC :: TouchOSC                               *
   * ================================================== */
  TouchOSC :: TouchOSC(
    const std :: string &address
  , const float          min
  , const float          max
  , const float          on
  , const float          off) :

      NormalOSC(address, min, max)
    , _on (on)
    , _off(off)
  {}

  
  /* ================================================== *
   * TouchOSC :: ~TouchOSC                              *
   * ================================================== */
  TouchOSC :: ~TouchOSC(void){}

  /* ================================================== *
   * TouchOSC :: touchDown                              *
   * ================================================== */
  void TouchOSC :: touchDown(float value, Core :: OSCManager *osc){
    
    NormalOSC :: touchDown(value, osc);
    
    ofxOscMessage msg;
    msg.setAddress(_address + TOUCH_DOMAIN);
    msg.addFloatArg( _on );

    osc -> sendMessage(msg);
  }


  /* ================================================== *
   * TouchOSC :: touchMove                              *
   * ================================================== */
  void TouchOSC :: touchMove(float value, Core :: OSCManager *osc){

    NormalOSC :: touchMove(value, osc);
  }

  /* ================================================== *
   * TouchOSC :: touchUp                                *
   * ================================================== */
  void TouchOSC :: touchUp  (float value, Core :: OSCManager *osc){

    NormalOSC :: touchUp(value, osc);
    
    ofxOscMessage msg;
    msg.setAddress(_address + TOUCH_DOMAIN);
    msg.addFloatArg( _off );

    osc -> sendMessage(msg);
  }

}
