//
//  Pad.mm
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "Pad.h"

namespace ofxController{

  /* ===================================================== *
   * Pad :: Pad                                            *
   * ===================================================== */
  Pad :: Pad(void) :
    ToggleController()
  {}

  /* ===================================================== *
   * Pad :: Pad                                            *
   * ===================================================== */
  Pad :: Pad(const Pad &obj) :
    ToggleController(obj)
  {}

  /* ===================================================== *
   * Pad :: Pad                                            *
   * ===================================================== */
  Pad :: Pad(
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
   * Pad :: ~Pad                                           *
   * ===================================================== */
  Pad :: ~Pad(void){}

  /* ===================================================== *
   * Pad :: update                                         *
   * ===================================================== */
  void Pad :: update(void){}

  /* ===================================================== *
   * Pad :: draw                                           *
   * ===================================================== */
  void Pad :: draw  (void){

    ofNoFill();
    ofSetColor( _skin -> Border() );
    ofRect( _area );

    if( _data ){
      ofFill();
      ofSetColor( _skin -> On() );
      ofRect( _area );
    }
  }

  /* ===================================================== *
   * Pad :: touchDown                                      *
   * ===================================================== */
  void Pad :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y)) return;

    _data = true;

    _oscfunc  -> touchDown(_oscfunc  -> MAX_VALUE, _osc);
    _midifunc -> touchDown(_midifunc -> MAX_VALUE, _midi);
  }



  /* ===================================================== *
   * Pad :: touchMove                                      *
   * ===================================================== */
  void Pad :: touchMove(ofTouchEventArgs &touch){

    if( ! _data) return;

    if( ! _area.inside(touch.x, touch.y)) touchUp(touch);
  }




  /* ===================================================== *
   * Pad :: touchUp                                        *
   * ===================================================== */
  void Pad :: touchUp  (ofTouchEventArgs &touch){

    if( ! _data) return;

    _data = false;
    
    _oscfunc  -> touchUp(_oscfunc  -> MIN_VALUE, _osc);
    _midifunc -> touchUp(_midifunc -> MAX_VALUE, _midi);
  }  
      
}
