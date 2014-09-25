//
//  BasicController.mm
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#include "BasicController.h"

namespace ofxController{


  /* ===================================================== *
   * BasicController :: BasicController                    *
   * ===================================================== */
  BasicController :: BasicController(void) :
      Base(ofRectangle(), NULL)
    , _osc     (NULL)
    , _oscfunc (NULL)
    , _midi    (NULL)
    , _midifunc(NULL)
  {}

  /* ===================================================== *
   * BasicController :: BasicController                    *
   * ===================================================== */
  BasicController :: BasicController(const BasicController &obj) :
      Base(ofRectangle(), NULL)
    , _osc     (NULL)
    , _oscfunc (NULL)
    , _midi    (NULL)
    , _midifunc(NULL)
  {}

  /* ===================================================== *
   * BasicController :: BasicController                    *
   * ===================================================== */
  BasicController :: BasicController(
      Core :: OSCManager  *osc
    ,         OSCArg      *oscfunc
    , Core :: MidiManager *midi
    ,         MidiArg     *midifunc
    , const   ofRectangle &area
    ,         Skin        *skin
  ) :
      Base(area, skin)
    , _osc     (osc)
    , _oscfunc (oscfunc)
    , _midi    (midi)
    , _midifunc(midifunc)
  {}

  /* ===================================================== *
   * BasicController :: ~BasicController                   *
   * ===================================================== */
  BasicController :: ~BasicController(void){
    
    delete _osc;
    delete _oscfunc;
    delete _midi;
    delete _midifunc;
  }
}
