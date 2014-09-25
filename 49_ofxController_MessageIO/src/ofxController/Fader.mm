//
//  Fader.mm
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#include "Fader.h"

namespace ofxController{

  /* ===================================================== *
   * Fader :: Fader                                        *
   * ===================================================== */
  Fader :: Fader(void) : VariableController(){}

  /* ===================================================== *
   * Fader :: Fader                                        *
   * ===================================================== */
  Fader :: Fader(const Fader &obj) : VariableController(obj){}

  /* ===================================================== *
   * Fader :: Fader                                        *
   * ===================================================== */
  Fader :: Fader(
      Core :: OSCManager  *osc
    ,         OSCArg      *oscfunc
    , Core :: MidiManager *midi
    ,         MidiArg     *midifunc
    , const   ofRectangle &area
    ,         Skin        *skin
  ) :
    VariableController(
        osc
      , oscfunc
      , midi
      , midifunc
      , area
      , skin
    )
  {}

  /* ===================================================== *
   * Fader :: ~Fader                                       *
   * ===================================================== */
  Fader :: ~Fader(void){}

  /* ===================================================== *
   * Fader :: update                                       *
   * ===================================================== */
  void Fader :: update(void){}

  /* ===================================================== *
   * Fader :: draw                                         *
   * ===================================================== */
  void Fader :: draw(void){

    ofFill();
    ofSetColor( _skin -> Off() );

    ofNoFill();
    ofSetColor( _skin -> Border() );
    ofRect( _area );

    ofFill();
    ofSetColor( _skin -> On() );
    ofRect(_area.x, _area.y, _area.width, _area.height * _data);
  }

  /* ===================================================== *
   * Fader :: touchDown                                    *
   * ===================================================== */
  void Fader :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = (touch.y - _area.y) / _area.height;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);
  }

  /* ===================================================== *
   * Fader :: touchMove                                    *
   * ===================================================== */
  void Fader :: touchMove(ofTouchEventArgs &touch){

    if( ! _touch) return;
    
    _data = (touch.y - _area.y) / _area.height;

    _oscfunc  -> touchMove( _data, _osc);
    _midifunc -> touchMove( _data, _midi);
  }

  /* ===================================================== *
   * Fader :: touchUp                                      *
   * ===================================================== */
  void Fader :: touchUp  (ofTouchEventArgs &touch){

    if( ! _touch) return;

    _touch = false;

    _data = (touch.y - _area.y) / _area.height;
    
    _oscfunc  -> touchUp( _data, _osc);
    _midifunc -> touchUp( _data, _midi);
  }




  
}

