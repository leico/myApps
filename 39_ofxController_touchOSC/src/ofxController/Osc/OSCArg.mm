//
//  OSCArg.mm
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "OSCArg.h"

namespace ofxController{

  /* ====================================================== *
   * OSCArg :: OSCArg                                       *
   * ====================================================== */
  OSCArg :: OSCArg(void) :
    _address()
    , _min(0)
    , _max(0)
  {}

  /* ====================================================== *
   * OSCArg :: OSCArg                                       *
   * ====================================================== */
  OSCArg :: OSCArg(const OSCArg &obj) :
      _address()
    , _min(0)
    , _max(0)
  {}

  /* ====================================================== *
   * OSCArg :: OSCArg                                       *
   * ====================================================== */
  OSCArg :: OSCArg(const std :: string &address, const float min, const float max) :
      _address(address)
    , _min(min)
    , _max(max)
  {}

  /* ====================================================== *
   * OSCArg :: ~OSCArg                                      *
   * ====================================================== */
  OSCArg :: ~OSCArg(void){}



}
