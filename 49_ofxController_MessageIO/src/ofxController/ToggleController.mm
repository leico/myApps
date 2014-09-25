//
//  ToggleController.mm
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#include "ToggleController.h"

namespace ofxController{
  
  /* ===================================================== *
   * ToggleController :: ToggleController                  *
   * ===================================================== */
  ToggleController :: ToggleController(void) :
      BasicController()
    , _data(false)
  {}


  /* ===================================================== *
   * ToggleController :: ToggleController                  *
   * ===================================================== */
  ToggleController :: ToggleController(const ToggleController &obj) :
      BasicController(
          obj._osc
        , obj._oscfunc
        , obj._midi
        , obj._midifunc
        , obj._area
        , obj._skin
      )
    , _data(false)
  {}


  /* ===================================================== *
   * ToggleController :: ToggleController                  *
   * ===================================================== */
  ToggleController :: ToggleController(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
  ) :
      BasicController(osc, oscfunc, midi, midifunc, area, skin)
    , _data(false)
  {}



  /* ===================================================== *
   * ToggleController :: ~ToggleController                 *
   * ===================================================== */
  ToggleController :: ~ToggleController(void){}




  /* ===================================================== *
   * ToggleController :: newMidiMessage                    *
   * ===================================================== */
  void  ToggleController :: newMidiMessage(ofxMidiMessage &msg){

    float value = _midifunc -> newMidiMessage(msg);

    ofLogVerbose("newMidiMessage value:" + ofToString(value));
    
    if(isnan(value)) return;

    _data = value == _midifunc -> MAX_INPUT_VALUE;

    ofLogVerbose(ofToString(_data));

    
  }



  /* ===================================================== *
   * ToggleController :: newOscMessage                     *
   * ===================================================== */
  void ToggleController :: newOscMessage(ofxOscMessage &msg){
    
    float value = _oscfunc -> newOscMessage(msg);

    ofLogVerbose("newOscMessage value:" + ofToString(value));
    
    if(isnan(value)) return;
    
    _data = value == _oscfunc -> MAX_INPUT_VALUE;

    ofLogVerbose(ofToString(_data));
  }
}
