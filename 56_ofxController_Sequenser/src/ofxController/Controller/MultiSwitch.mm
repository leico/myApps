//
//  MultiSwitch.mm
//  emptyExample
//
//  Created by leico on 2014/09/10.
//
//

#include "MultiSwitch.h"
#include "NoOSC.h"
#include "NoMidi.h"

namespace ofxController{
  /* ===================================================== *
   * MultiSwitch :: MultiSwitch                            *
   * ===================================================== */
  MultiSwitch :: MultiSwitch(void) :
      BasicController()
    , _switches()
  {}

  /* ===================================================== *
   * MultiSwitch :: MultiSwitch                            *
   * ===================================================== */
  MultiSwitch :: MultiSwitch(const MultiSwitch &obj) :
      BasicController(
          obj._osc
        , obj._oscfunc
        , obj._midi
        , obj._midifunc
        , obj._area
        , obj._skin
      )
    , _switches(obj._switches)
  {}

  /* ===================================================== *
   * MultiSwitch :: MultiSwitch                            *
   * ===================================================== */
  MultiSwitch :: MultiSwitch(
      Core :: OSCManager  *osc
    ,         OSCArg      *oscfunc
    , Core :: MidiManager *midi
    ,         MidiArg     *midifunc
    , const   ofRectangle &area
    ,         Skin        *skin
    , const   int          num
  ) :
    BasicController(osc, oscfunc, midi, midifunc, area, skin)
  , _switches(num)
  {

    float w = area.width / num;

    for(int i = 0 ; i < num ; ++ i)
      _switches.at(i) = new Switch(
          _osc
        , new NoOSC()
        , _midi
        , new NoMidi()
        , ofRectangle(area.x + w * i, area.y, w, area.height)
        , _skin
     );
  }

  /* ===================================================== *
   * MultiSwitch :: ~MultiSwitch                           *
   * ===================================================== */
  MultiSwitch :: ~MultiSwitch(void){
    
    for(int i = 0 ; i < _switches.size() ; ++ i)
      delete _switches.at(i);
  }



  /* ===================================================== *
   * MultiSwitch :: update                                 *
   * ===================================================== */
  void MultiSwitch :: update(void){
    
    for(int i = 0 ; i < _switches.size() ; ++ i){
      _switches.at(i) -> update();
    }
  }

  /* ===================================================== *
   * MultiSwitch :: draw                                   *
   * ===================================================== */
  void MultiSwitch :: draw(void){

    ofFill();
    ofSetColor( _skin -> Off() );
    ofRect( _area );
    
    ofNoFill();
    ofSetColor( _skin -> Border() );
    ofRect( _area );
    
    for(int i = 0 ; i < _switches.size() ; ++ i){
      _switches.at(i) -> draw();
    }
  }



  /* ===================================================== *
   * MultiSwitch :: touchDown                              *
   * ===================================================== */
  void MultiSwitch :: touchDown(ofTouchEventArgs &touch){
    
    for(int i = 0 ; i < _switches.size() ; ++ i){
      _switches.at(i) -> touchDown(touch);
    }
  }
  /* ===================================================== *
   * MultiSwitch :: touchMove                              *
   * ===================================================== */
  void MultiSwitch :: touchMove(ofTouchEventArgs &touch){
    
    for(int i = 0 ; i < _switches.size() ; ++ i){
      _switches.at(i) -> touchMove(touch);
    }
  }
  /* ===================================================== *
   * MultiSwitch :: touchUp                                *
   * ===================================================== */
  void MultiSwitch :: touchUp(ofTouchEventArgs &touch){
    for(int i = 0 ; i < _switches.size() ; ++ i){
      _switches.at(i) -> touchUp(touch);
    }
  }



  /* ===================================================== *
   * MultiSwitch :: newMidiMessage                         *
   * ===================================================== */
  void MultiSwitch :: newMidiMessage(ofxMidiMessage &msg){
    
  }

  /* ===================================================== *
   * MultiSwitch :: newOscMessage                          *
   * ===================================================== */
  void MultiSwitch :: newOscMessage(ofxOscMessage &msg){

  }



}
