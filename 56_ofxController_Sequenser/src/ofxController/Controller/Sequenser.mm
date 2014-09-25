//
//  Sequenser.mm
//  emptyExample
//
//  Created by leico on 2014/09/11.
//
//

#include "Sequenser.h"

namespace ofxController{

  /* ===================================================== *
   * Sequenser :: Sequenser                                *
   * ===================================================== */
  Sequenser :: Sequenser(void) : 
      MultiSwitch()
    , _step     (0)
    , _numstep  (0)
    , _threshold(0)
    , _ms       (0)
    , _pos()
  {}

  /* ===================================================== *
   * Sequenser :: Sequenser                                *
   * ===================================================== */
  Sequenser :: Sequenser(const Sequenser &obj) :
      MultiSwitch(obj)
    , _step     (obj._step)
    , _numstep  (obj._numstep)
    , _threshold(obj._threshold)
    , _ms       (obj._ms)
    , _pos()
  {}

  /* ===================================================== *
   * Sequenser :: Sequenser                                *
   * ===================================================== */
  Sequenser :: Sequenser(
      Core :: OSCManager  *osc
    ,         OSCArg      *oscfunc
    , Core :: MidiManager *midi
    ,         MidiArg     *midifunc
    , const   ofRectangle &area
    ,         Skin        *skin
    , const   float        bpm
    , const   int          steps
  ) :
    MultiSwitch(osc, oscfunc, midi, midifunc, area, skin, steps + 1)
  , _step     (0)
  , _numstep  (steps)
  , _threshold(0)
  , _ms       (60.0f / bpm)
  , _pos(area.x, area.y, area.width / (steps + 1), area.height)
  {
    
  }


  /* ===================================================== *
   * Sequenser :: ~Sequenser                               *
   * ===================================================== */
  Sequenser :: ~Sequenser(void){}

  /* ===================================================== *
   * Sequenser :: update                                   *
   * ===================================================== */
  void Sequenser :: update(void){

    MultiSwitch :: update();
    
    if(_switches.at(0) -> Data()){

      if(_threshold < 0){
        _threshold = ofGetElapsedTimef() + _ms;
        std :: cout << _threshold << std :: endl;
        return;
      }

      if(_threshold < ofGetElapsedTimef()){
        
        _step = (_step + 1) % _numstep;
        _threshold += _ms;

        if(_switches.at(_step + 1) -> Data()){
          _oscfunc  -> touchDown( _oscfunc  -> MAX_INPUT_VALUE, _osc);
          _midifunc -> touchDown( _midifunc -> MAX_INPUT_VALUE, _midi);
        }
      }
    }
    else _threshold = -1;
  }
  /* ===================================================== *
   * Sequenser :: draw                                     *
   * ===================================================== */
  void Sequenser :: draw(void){

    MultiSwitch :: draw();

    ofFill();
    ofSetColor( _skin -> On() );
    ofRect(
        _pos.x + _pos.width * (_step + 1)
      , _pos.y
      , _pos.width
      , _pos.height
    );
  }



  /* ===================================================== *
   * Sequenser :: touchDown                                *
   * ===================================================== */
  void Sequenser :: touchDown(ofTouchEventArgs &touch){
    for(int i = 0 ; i < _switches.size() ; ++ i)
      _switches.at(i) -> touchDown(touch);
  }
  /* ===================================================== *
   * Sequenser :: touchMove                                *
   * ===================================================== */
  void Sequenser :: touchMove(ofTouchEventArgs &touch){
    for(int i = 0 ; i < _switches.size() ; ++ i)
      _switches.at(i) -> touchMove(touch);
  }
  /* ===================================================== *
   * Sequenser :: touchUp                                  *
   * ===================================================== */
  void Sequenser :: touchUp(ofTouchEventArgs &touch){
    for(int i = 0 ; i < _switches.size() ; ++ i)
      _switches.at(i) -> touchUp(touch);
  }


  /* ===================================================== *
   * Sequenser :: newMidiMessage                           *
   * ===================================================== */
  void Sequenser :: newMidiMessage(ofxMidiMessage &msg){
    
  }

  /* ===================================================== *
   * Sequenser :: newOscMessage                            *
   * ===================================================== */
  void Sequenser :: newOscMessage(ofxOscMessage &msg){
  }




 
}
