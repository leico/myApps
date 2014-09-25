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

  enum FaderStyle{
      Normal
    , Bipolar
    , Inverse
  };

  template<Landscape L = Vertical, FaderStyle S = Normal>
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
     *
     * ofRectangle _drawarea;
     */
    /* VariableController ------------------
     * float _data;
     */

    private:
    Fader(void);

    public:
    Fader(const Fader<L, S> &obj);
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

    private:
    void DrawBackground(void);
    
  };

  /* ===================================================== *
   * Fader<Landscape, FaderStyle> :: Fader                 *
   * ===================================================== */
  template<Landscape L, FaderStyle S>
  inline Fader<L, S> :: Fader(void) : VariableController(){}

  /* ===================================================== *
   * Fader<Landscape, FaderStyle> :: Fader                 *
   * ===================================================== */
  template<Landscape L, FaderStyle S>
  inline Fader<L, S> :: Fader(const Fader<L, S> &obj) : VariableController(obj){}

  /* ===================================================== *
   * Fader<Landscape, FaderStyle> :: Fader                 *
   * ===================================================== */
  template<Landscape L, FaderStyle S>
  inline Fader<L, S> :: Fader(
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
   * Fader<Landscape, FaderStyle> :: ~Fader                     *
   * ===================================================== */
  template<Landscape L, FaderStyle S>
  inline Fader<L, S> :: ~Fader(void){}

  /* ===================================================== *
   * Fader<Landscape, FaderStyle> :: update                     *
   * ===================================================== */
  template<Landscape L, FaderStyle S>
  inline void Fader<L, S> :: update(void){}












  /* ===================================================== *
   * Fader<Vertical, Normal> :: draw                       *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Normal> :: draw(void){

    DrawBackground();

    ofFill();
    ofSetColor( _skin -> On() );
    ofRect(_drawarea.x, _drawarea.y, _drawarea.width, _drawarea.height * _data);
  }

  /* ===================================================== *
   * Fader<Horizonal, Normal> :: draw                      *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Normal> :: draw(void){

    DrawBackground();

    ofFill();
    ofSetColor( _skin -> On() );
    ofRect(_drawarea.x, _drawarea.y, _drawarea.width * _data, _drawarea.height);
  }

  /* ===================================================== *
   * Fader<Vertical, Inverse> :: draw                      *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Inverse> :: draw(void){

    DrawBackground();

    ofFill();
    ofSetColor( _skin -> On() );
    ofRect(_drawarea.x, _drawarea.y + _drawarea.height,  _drawarea.width, -_data * _drawarea.height);
    
  }


  /* ===================================================== *
   * Fader<Horizonal, Inverse> :: draw                     *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Inverse> :: draw(void){

    DrawBackground();

    ofFill();
    ofSetColor( _skin -> On() );
    ofRect( _drawarea.x + _drawarea.width, _drawarea.y, -_data * _drawarea.width, _drawarea.height);
  }

  /* ===================================================== *
   * Fader<Vertical, Bipolar> :: draw                      *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Bipolar> :: draw(void){

    DrawBackground();

    ofFill();
    ofSetColor( _skin -> On() );

    float pos = MessageIO :: MAX_INPUT_VALUE / 2;
    ofRect(_drawarea.x, _drawarea.y + _drawarea.height / 2, _drawarea.width, (_data - pos) * _drawarea.height);

  }

  /* ===================================================== *
   * Fader<Horizonal, Bipolar> :: draw                     *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Bipolar> :: draw(void){

    DrawBackground();

    ofFill();
    ofSetColor( _skin -> On() );

    float pos = MessageIO :: MAX_INPUT_VALUE / 2;
    ofRect( _drawarea.x + _drawarea.width / 2, _drawarea.y, (_data - pos) * _drawarea.width, _drawarea.height);
  }






  /* ===================================================== *
   * Fader<Vertical, Normal> :: touchDown                  *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Normal> :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = (touch.y - _area.y) / _area.height;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);
  }

  /* ===================================================== *
   * Fader<Horizonal, Normal> :: touchDown                 *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Normal> :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = (touch.x - _area.x) / _area.width;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);
  }


  /* ===================================================== *
   * Fader<Vertical, Inverse> :: touchDown                 *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Inverse> :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = MessageIO :: MAX_INPUT_VALUE - (touch.y - _area.y) / _area.height;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);
  }
 
  /* ===================================================== *
   * Fader<Horizonal, Inverse> :: touchDown                *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Inverse> :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = MessageIO :: MAX_INPUT_VALUE - (touch.x - _area.x) / _area.width;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);
  }


  /* ===================================================== *
   * Fader<Vertical, Bipolar> :: touchDown                 *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Bipolar> :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = (touch.y - _area.y) / _area.height;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);

  }

  /* ===================================================== *
   * Fader<Horizonal, Bipolar> :: touchDown                *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Bipolar> :: touchDown(ofTouchEventArgs &touch){
    
    if( ! _area.inside(touch.x, touch.y) ) return;
    
    _touch = true;
    
    _data = (touch.x - _area.x) / _area.width;

    _oscfunc  -> touchDown( _data, _osc);
    _midifunc -> touchDown( _data, _midi);
  }

















  /* ===================================================== *
   * Fader<Vertical, Normal> :: touchMove                  *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Normal> :: touchMove(ofTouchEventArgs &touch){

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
   * Fader<Horizonal, Normal> :: touchMove                 *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Normal> :: touchMove(ofTouchEventArgs &touch){
    
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
   * Fader<Vertical, Inverse> :: touchMove                 *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Inverse> :: touchMove(ofTouchEventArgs &touch){

    if( ! _touch) return;
    
    _data = MessageIO :: MAX_INPUT_VALUE - (touch.y - _area.y) / _area.height;

    float clamp = ofClamp(
        _data
      , MessageIO :: MIN_INPUT_VALUE
      , MessageIO :: MAX_INPUT_VALUE
    );

    _oscfunc  -> touchMove( clamp, _osc);
    _midifunc -> touchMove( clamp, _midi);
  }

  /* ===================================================== *
   * Fader<Horizonal, Inverse> :: touchMove                *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Inverse> :: touchMove(ofTouchEventArgs &touch){
    
    if( ! _touch) return;
    
    _data = MessageIO :: MAX_INPUT_VALUE - (touch.x - _area.x) / _area.width;

    float clamp  = ofClamp(
        _data
      , MessageIO :: MIN_INPUT_VALUE
      , MessageIO :: MAX_INPUT_VALUE
    );

    _oscfunc  -> touchMove( clamp, _osc);
    _midifunc -> touchMove( clamp, _midi);
  }

  /* ===================================================== *
   * Fader<Vertical, Bipolar> :: touchMove                 *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Bipolar> :: touchMove(ofTouchEventArgs &touch){

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
   * Fader<Horizonal, Bipolar> :: touchMove                *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Bipolar> :: touchMove(ofTouchEventArgs &touch){
    
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
   * Fader<Vertical, Normal> :: touchUp                    *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Normal> :: touchUp  (ofTouchEventArgs &touch){

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
   * Fader<Horizonal, Normal> :: touchUp                   *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Normal> :: touchUp (ofTouchEventArgs &touch){

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

  /* ===================================================== *
   * Fader<Vertical, Inverse> :: touchUp                   *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Inverse> :: touchUp  (ofTouchEventArgs &touch){

    if( ! _touch) return;

    _touch = false;

    _data = ofClamp(
        MessageIO :: MAX_INPUT_VALUE - (touch.y - _area.y) / _area.height
      , MessageIO :: MIN_INPUT_VALUE
      , MessageIO :: MAX_INPUT_VALUE
    );
    
    _oscfunc  -> touchUp( _data, _osc);
    _midifunc -> touchUp( _data, _midi);
  }

  /* ===================================================== *
   * Fader<Horizonal, Inverse> :: touchUp                  *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Inverse> :: touchUp (ofTouchEventArgs &touch){

    if( ! _touch) return;
    
    _touch = false;
    
    _data = ofClamp(
        MessageIO :: MAX_INPUT_VALUE - (touch.x - _area.x) / _area.width
      , MessageIO :: MIN_INPUT_VALUE
      , MessageIO :: MAX_INPUT_VALUE
    );

    _oscfunc  -> touchUp( _data, _osc);
    _midifunc -> touchUp( _data, _midi);
  }

  /* ===================================================== *
   * Fader<Vertical, Bipolar> :: touchUp                   *
   * ===================================================== */
  template<>
  inline void Fader<Vertical, Bipolar> :: touchUp  (ofTouchEventArgs &touch){

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
   * Fader<Horizonal, Bipolar> :: touchUp                  *
   * ===================================================== */
  template<>
  inline void Fader<Horizonal, Bipolar> :: touchUp (ofTouchEventArgs &touch){

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













  /* ===================================================== *
   * Fader<Landscape, FaderStyle> :: DrawBackground        *
   * ===================================================== */
  template<Landscape L, FaderStyle S>
  inline void Fader<L, S> :: DrawBackground(void){

    ofFill();
    ofSetColor( _skin -> Off() );
    ofRect( _area );
    
    ofNoFill();
    ofSetColor( _skin -> Border() );
    ofRect( _area );

    ofRect( _drawarea );
  }


}

#endif /* defined(__emptyExample__Fader__) */
