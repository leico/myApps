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
      Base( ofRectangle(), NULL)
    , _midi    (NULL)
    , _midifunc(NULL)
    , _osc     (NULL)
    , _oscfunc (NULL)
  {}

  /* ===================================================== *
   * Pad :: Pad                                            *
   * ===================================================== */
  Pad :: Pad(const Pad &obj) :
      Base(obj._area, obj._skin)
    , _midi    (obj._midi)
    , _midifunc(obj._midifunc)
    , _osc     (obj._osc)
    , _oscfunc (obj._oscfunc)
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
      Base(area, skin)
    , _midi    (midi)
    , _midifunc(midifunc)
    , _osc     (osc)
    , _oscfunc (oscfunc)
  {}

  /* ===================================================== *
   * Pad :: update                                         *
   * ===================================================== */
  void Pad :: update(void){}

  /* ===================================================== *
   * Pad :: draw                                           *
   * ===================================================== */
  void Pad :: draw  (void){

    ofNoFill();
    ofRect( _area );

    if( _touch ){
      ofFill();
      ofRect( _area );
    }
  }

  /* ===================================================== *
   * Pad :: touchDown                                      *
   * ===================================================== */
  void Pad :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y)) return;

    _touch = true;

    _oscfunc  -> touchDown(1, _osc);
    _midifunc -> touchDown(1, _midi);
  }



  /* ===================================================== *
   * Pad :: touchMove                                      *
   * ===================================================== */
  void Pad :: touchMove(ofTouchEventArgs &touch){

    if( ! _touch) return;

    if( ! _area.inside(touch.x, touch.y)) touchUp(touch);
  }




  /* ===================================================== *
   * Pad :: touchUp                                        *
   * ===================================================== */
  void Pad :: touchUp  (ofTouchEventArgs &touch){

    if( ! _touch) return;

    _touch = false;
    
    _oscfunc  -> touchUp(0, _osc);
    _midifunc -> touchUp(0, _midi);
  }

  
      
}
