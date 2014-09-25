//
//  NormalOSC.mm
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "NormalOSC.h"

namespace ofxController{


  /* =========================================================== *
   * NormalOSC :: NormalOSC                                      *
   * =========================================================== */
  NormalOSC :: NormalOSC(void) : OSCArg(){}

  /* =========================================================== *
   * NormalOSC :: NormalOSC                                      *
   * =========================================================== */
  NormalOSC :: NormalOSC(const NormalOSC &obj) :
    OSCArg(obj._address, obj._min, obj._max)
  {}

  /* =========================================================== *
   * NormalOSC :: NormalOSC                                      *
   * =========================================================== */
  NormalOSC :: NormalOSC(const std :: string &address, const float min, const float max) :
    OSCArg(address, min, max)
  {}

  /* =========================================================== *
   * NormalOSC :: ~NormalOSC                                     *
   * =========================================================== */
  NormalOSC :: ~NormalOSC(void){}



  /* =========================================================== *
   * NormalOSC :: touchDown                                      *
   * =========================================================== */
  void NormalOSC :: touchDown(float value, Core :: OSCManager *osc){
    
    ofxOscMessage msg;
    msg.setAddress(_address + NORMAL_DOMAIN);
    msg.addFloatArg( ofMap(value, MIN_VALUE, MAX_VALUE, _min, _max) );

    osc -> sendMessage(msg);
  }

  /* =========================================================== *
   * NormalOSC :: touchMove                                      *
   * =========================================================== */
  void NormalOSC :: touchMove(float value, Core :: OSCManager *osc){
    
    touchDown(value, osc);

  }

  /* =========================================================== *
   * NormalOSC :: touchUp                                        *
   * =========================================================== */
  void NormalOSC :: touchUp  (float value, Core :: OSCManager *osc){

    touchDown(value, osc);

  }


    

}
