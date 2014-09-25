//
//  Fader.h
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#ifndef __emptyExample__Fader__
#define __emptyExample__Fader__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "VariableController.h"

namespace ofxController{


  template<Landscape L = Vertical>
  class Fader : public VariableController{

    /* Base --------------------------------
     * ofRectange _area;
     * bool       _touch;
     * Skin *_skin;
     */
    /* BasicController ---------------------
     * Core :: OSCManager  *_osc;
     *         OSCArg      *_oscfunc;
     * Core :: MidiManager *_midi;
     *         MidiArg     *_midifunc;
     */
    /* VariableController
     * float _data;
     */

    private:
    Fader(void);

    public:
    Fader(const Fader<L> &obj);
    Fader(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
    );

    virtual ~Fader(void);
    
    void update(void);
    void draw  (void);
    
    void touchDown(ofTouchEventArgs &touch);
    void touchMove(ofTouchEventArgs &touch);
    void touchUp  (ofTouchEventArgs &touch);
    
  };

  /* ===================================================== *
   * Fader :: Fader                                        *
   * ===================================================== */
  template<Landscape L>
  inline Fader<L> :: Fader(void) : VariableController(){}

  /* ===================================================== *
   * Fader :: Fader                                        *
   * ===================================================== */
  template<Landscape L>
  inline Fader<L> :: Fader(const Fader<L> &obj) : VariableController(obj){}

  /* ===================================================== *
   * Fader :: Fader                                        *
   * ===================================================== */
  template<Landscape L>
  inline Fader<L> :: Fader(
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
  template<Landscape L>
  inline Fader<L> :: ~Fader(void){}

  /* ===================================================== *
   * Fader :: update                                       *
   * ===================================================== */
  template<Landscape L>
  inline void Fader<L> :: update(void){}

  /* ===================================================== *
   * Fader<Vertical> :: draw                               *
   * ===================================================== */
  template<>
  inline void Fader<Vertical> :: draw(void){

    ofFill();
    ofSetColor( _skin -> Off() );
    ofRect( _area );

    ofNoFill();
    ofSetColor( _skin -> Border() );
    ofRect( _area );

    ofFill();
    ofSetColor( _skin -> On() );
    ofRect(_area.x, _area.y, _area.width, _area.height * _data);
  }


  /* ===================================================== *
   * Fader<Horizonal> :: draw                              *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal> :: draw(void){

    ofFill();
    ofSetColor( _skin -> Off() );
    ofRect( _area );
    
    ofNoFill();
    ofSetColor( _skin -> Border() );
    ofRect( _area );

    ofFill();
    ofSetColor( _skin -> On() );
    ofRect(_area.x, _area.y, _area.width * _data, _area.height);
  }


  /* ===================================================== *
   * Fader<Vertical> :: touchDown                          *
   * ===================================================== */
  template<>
  inline void Fader<Vertical> :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = (touch.y - _area.y) / _area.height;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);
  }

  /* ===================================================== *
   * Fader<Horizonal> :: touchDown                         *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal> :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = (touch.x - _area.x) / _area.width;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);
  }



  /* ===================================================== *
   * Fader<Vertical> :: touchMove                          *
   * ===================================================== */
  template<>
  inline void Fader<Vertical> :: touchMove(ofTouchEventArgs &touch){

    if( ! _touch) return;
    
    _data = (touch.y - _area.y) / _area.height;

    float clamp = ofClamp(
        _data
      , MessageIO :: MIN_INPUT_VALUE
      , MessageIO :: MAX_INPUT_VALUE
    );

    _oscfunc  -> touchMove( clamp, _osc);
    _midifunc -> touchMove( clamp, _midi);
  }

  /* ===================================================== *
   * Fader<Horizonal> :: touchMove                         *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal> :: touchMove(ofTouchEventArgs &touch){
    
    if( ! _touch) return;
    
    _data = (touch.x - _area.x) / _area.width;

    float clamp  = ofClamp(
        _data
      , MessageIO :: MIN_INPUT_VALUE
      , MessageIO :: MAX_INPUT_VALUE
    );

    _oscfunc  -> touchMove( clamp, _osc);
    _midifunc -> touchMove( clamp, _midi);
  }

  /* ===================================================== *
   * Fader<Vertical> :: touchUp                            *
   * ===================================================== */
  template<>
  inline void Fader<Vertical> :: touchUp  (ofTouchEventArgs &touch){

    if( ! _touch) return;

    _touch = false;

    _data = ofClamp(
        (touch.y - _area.y) / _area.height
      , MessageIO :: MIN_INPUT_VALUE
      , MessageIO :: MAX_INPUT_VALUE
    );
    
    _oscfunc  -> touchUp( _data, _osc);
    _midifunc -> touchUp( _data, _midi);
  }

  /* ===================================================== *
   * Fader<Horizonal> :: touchUp                           *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal> :: touchUp (ofTouchEventArgs &touch){

    if( ! _touch) return;
    
    _touch = false;
    
    _data = ofClamp(
        (touch.x - _area.x) / _area.width
      , MessageIO :: MIN_INPUT_VALUE
      , MessageIO :: MAX_INPUT_VALUE
    );

    _oscfunc  -> touchUp( _data, _osc);
    _midifunc -> touchUp( _data, _midi);
  }

}

#endif /* defined(__emptyExample__Fader__) */
