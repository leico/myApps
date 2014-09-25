//
//  Switch.mm
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#include "Switch.h"

namespace ofxController{


  /* ===================================================== *
   * Switch :: Switch                                      *
   * ===================================================== */
  Switch :: Switch(void) :
    ToggleController()
  {}

  /* ===================================================== *
   * Switch :: Switch                                      *
   * ===================================================== */
  Switch :: Switch(const Switch &obj) :
    ToggleController(obj)
  {}

  /* ===================================================== *
   * Switch :: Switch                                      *
   * ===================================================== */
  Switch :: Switch(
      Core :: OSCManager  *osc
    ,         OSCArg      *oscfunc
    , Core :: MidiManager *midi
    ,         MidiArg     *midifunc
    , const   ofRectangle &area
    ,         Skin        *skin
  ) :
    ToggleController(osc, oscfunc, midi, midifunc, area, skin)
  {}



  /* ===================================================== *
   * Switch :: ~Switch                                     *
   * ===================================================== */
  Switch :: ~Switch(void){}


  /* ===================================================== *
   * Switch :: update                                      *
   * ===================================================== */
  void Switch :: update(void){}

  /* ===================================================== *
   * Switch :: draw                                        *
   * ===================================================== */
  void Switch :: draw(void){

    ofNoFill();
    ofSetColor( _skin -> Border() );
    ofRect(_area);

    if( _data ){
      ofFill();
      ofSetColor( _skin -> On() );
      ofRect(_area);
    }

  }


  /* ===================================================== *
   * Switch :: touchDown                                   *
   * ===================================================== */
  void Switch :: touchDown(ofTouchEventArgs &touch){

    if( ! _area.inside(touch.x, touch.y)) return;

    _data  = !_data;

    if( _data ){
      
      _oscfunc  -> touchDown(_oscfunc  -> MAX_VALUE, _osc);
      _midifunc -> touchDown(_midifunc -> MAX_VALUE, _midi);

      return;
    }

    _oscfunc  -> touchUp(_oscfunc  -> MIN_VALUE, _osc);
    _midifunc -> touchUp(_midifunc -> MIN_VALUE, _midi);
  }

  /* ===================================================== *
   * Switch :: touchMove                                   *
   * ===================================================== */
  void Switch :: touchMove(ofTouchEventArgs &touch){}

  /* ===================================================== *
   * Switch :: touchUp                                     *
   * ===================================================== */
  void Switch :: touchUp  (ofTouchEventArgs &touch){}
  
}
