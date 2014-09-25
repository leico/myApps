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
   * Pad :: ~Pad                                           *
   * ===================================================== */
  Pad :: ~Pad(void){

    delete _oscfunc;
    delete _midifunc;
  }

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

    _oscfunc  -> touchDown(_oscfunc  -> MAX_VALUE, _osc);
    _midifunc -> touchDown(_midifunc -> MAX_VALUE, _midi);
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
    
    _oscfunc  -> touchUp(_oscfunc  -> MIN_VALUE, _osc);
    _midifunc -> touchUp(_midifunc -> MAX_VALUE, _midi);
  }

  /* ===================================================== *
   * Pad :: newMidiMessage                                 *
   * ===================================================== */
  void Pad :: newMidiMessage(ofxMidiMessage &msg){

    float value = _midifunc -> newMidiMessage(msg);

    if(isnan(value)) return;

    _touch = int(value) == _midifunc -> MAX_VALUE;
  }

  /* ===================================================== *
   * Pad :: newOscMessage                                  *
   * ===================================================== */
  void Pad :: newOscMessage(ofxOscMessage &msg){

    float value = _oscfunc -> newOscMessage(msg);
    
    if(isnan(value)) return;

    _touch = int(value) == _oscfunc -> MAX_VALUE;
  }

  
      
}
