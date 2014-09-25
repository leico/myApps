//
//  Switch.h
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#ifndef __emptyExample__Switch__
#define __emptyExample__Switch__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ToggleController.h"

namespace ofxController{

  enum SwitchType{
      Toggle
    , Pad
  };


  template<SwitchType T = Toggle>
  class Switch : public ToggleController{

    /* Base --------------------------------
     * ofRectange _area;
     * bool       _touch;
     * Skin *_skin;
     * 
     */
    /* BasicController ---------------------
     * Core :: MidiManager *_midi;
     *         MidiArg     *_midifunc;
     * Core :: OSCManager  *_osc;
     *         OSCArg      *_oscfunc;
     */
    /* ToggleController --------------------
     * bool _data;
     */

    private:
    Switch(void);

    public:
    Switch(const Switch<T> &obj);
    Switch(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
    );

    virtual ~Switch(void);
    
    void update(void);
    void draw  (void);
    
    void touchDown(ofTouchEventArgs &touch);
    void touchMove(ofTouchEventArgs &touch);
    void touchUp  (ofTouchEventArgs &touch);

  };
  /* ===================================================== *
   * Switch<SwitchType> :: Switch                          *
   * ===================================================== */
  template<SwitchType T>
  inline Switch<T> :: Switch(void) : ToggleController(){}

  /* ===================================================== *
   * Switch<SwitchType> :: Switch                          *
   * ===================================================== */
  template<SwitchType T>
  inline Switch<T> :: Switch(const Switch<T> &obj) : ToggleController(obj){}

  /* ===================================================== *
   * Switch<SwitchType> :: Switch                          *
   * ===================================================== */
  template<SwitchType T>
  inline Switch<T> :: Switch(
      Core :: OSCManager  *osc
    ,         OSCArg      *oscfunc
    , Core :: MidiManager *midi
    ,         MidiArg     *midifunc
    , const   ofRectangle &area
    ,         Skin        *skin
  ) :
    ToggleController(
        osc
      , oscfunc
      , midi
      , midifunc
      , area
      , skin
    )
  {}

  /* ===================================================== *
   * Switch<SwitchType> :: ~Switch                         *
   * ===================================================== */
  template<SwitchType T>
  inline Switch<T> :: ~Switch(void){}

  /* ===================================================== *
   * Switch<SwitchType> :: update                          *
   * ===================================================== */
  template<SwitchType T>
  inline void Switch<T> :: update(void){}


  /* ===================================================== *
   * Switch<SwitchType> :: draw                            *
   * ===================================================== */
  template<SwitchType T>
  inline void Switch<T> :: draw(void){

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
   * Switch<Toggle> :: touchUp                             *
   * ===================================================== */
  template<>
  inline void Switch<Toggle> :: touchUp  (ofTouchEventArgs &touch){}

  /* ===================================================== *
   * Switch<Pad> :: touchUp                                *
   * ===================================================== */
  template<>
  inline void Switch<Pad> :: touchUp(ofTouchEventArgs &touch){
    
    if( ! _data) return;
    
    _data = false;
    
    _oscfunc  -> touchUp(_oscfunc  -> MIN_INPUT_VALUE, _osc);
    _midifunc -> touchUp(_midifunc -> MIN_INPUT_VALUE, _midi);
		
    return;
  }


  /* ===================================================== *
   * Switch<Toggle> :: touchMove                           *
   * ===================================================== */
  template<>
  inline void Switch<Toggle> :: touchMove(ofTouchEventArgs &touch){}

  /* ===================================================== *
   * Switch<Pad> :: touchMove                              *
   * ===================================================== */
  template<>
  inline void Switch<Pad> :: touchMove(ofTouchEventArgs &touch){

    if( ! _data) return;

    if( ! _area.inside(touch.x, touch.y)) touchUp(touch);
  }



  /* ===================================================== *
   * Switch<Toggle> :: touchDown                           *
   * ===================================================== */
  template<>
  inline void Switch<Toggle> :: touchDown(ofTouchEventArgs &touch){

    if( ! _area.inside(touch.x, touch.y)) return;

    _data  = !_data;

    if( _data ){
      
      _oscfunc  -> touchDown(_oscfunc  -> MAX_INPUT_VALUE, _osc);
      _midifunc -> touchDown(_midifunc -> MAX_INPUT_VALUE, _midi);

      return;
    }

    _oscfunc  -> touchUp(_oscfunc  -> MIN_INPUT_VALUE, _osc);
    _midifunc -> touchUp(_midifunc -> MIN_INPUT_VALUE, _midi);
  }

  /* ===================================================== *
   * Switch<Pad> :: touchDown                              *
   * ===================================================== */
  template<>
  inline void Switch<Pad> :: touchDown(ofTouchEventArgs &touch){

    if( ! _area.inside(touch.x, touch.y)) return;

    _data = true;

    _oscfunc  -> touchDown(_oscfunc  -> MAX_INPUT_VALUE, _osc);
    _midifunc -> touchDown(_midifunc -> MAX_INPUT_VALUE, _midi);
  }








}

#endif /* defined(__emptyExample__Switch__) */
