//
//  BasicController.mm
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#include "BasicController.h"

namespace ofxController{

  const int BasicController :: _MARGIN = 12;


  /* ===================================================== *
   * BasicController :: BasicController                    *
   * ===================================================== */
  BasicController :: BasicController(void) :
      Base(ofRectangle(), NULL)
    , _osc     (NULL)
    , _oscfunc (NULL)
    , _midi    (NULL)
    , _midifunc(NULL)
    , _drawarea()
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
    , _drawarea()
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
    , _drawarea(
        _area.x      + _MARGIN
      , _area.y      + _MARGIN
      , _area.width  - _MARGIN * 2
      , _area.height - _MARGIN * 2
    )
  {}

  /* ===================================================== *
   * BasicController :: ~BasicController                   *
   * ===================================================== */
  BasicController :: ~BasicController(void){
    
    delete _oscfunc;
    delete _midifunc;
  }
}
