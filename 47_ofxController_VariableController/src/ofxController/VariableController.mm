//
//  VariableController.mm
//  emptyExample
//
//  Created by leico on 2014/09/06.
//
//

#include "VariableController.h"

namespace ofxController{

  /* ===================================================== *
   * VariableController :: VariableController              *
   * ===================================================== */
  VariableController :: VariableController(void) :
      BasicController()
    , _data(0)
  {}


  /* ===================================================== *
   * VariableController :: VariableController              *
   * ===================================================== */
  VariableController :: VariableController(const VariableController &obj) :
      BasicController(obj._osc, obj._oscfunc, obj._midi, obj._midifunc, obj._area, obj._skin)
    , _data(obj._data)
  {}

  /* ===================================================== *
   * VariableController :: VariableController              *
   * ===================================================== */
  VariableController :: VariableController(
      Core :: OSCManager  *osc
    ,         OSCArg      *oscfunc
    , Core :: MidiManager *midi
    ,         MidiArg     *midifunc
    , const   ofRectangle &area
    ,         Skin        *skin
  ) :
    BasicController(osc, oscfunc, midi, midifunc, area, skin)
  , _data(0)
  {}


  /* ===================================================== *
   * VariableController :: newMidiMessage                  *
   * ===================================================== */
  void VariableController :: newMidiMessage(ofxMidiMessage &msg){

    float value = _midifunc -> newMidiMessage(msg);
    
    if(isnan(value)) return;

    _data = value;

    return;
  }


  /* ===================================================== *
   * VariableController :: newOscMessage                   *
   * ===================================================== */
  void VariableController :: newOscMessage(ofxOscMessage &msg){

    float value = _oscfunc -> newOscMessage(msg);

    if(isnan(value)) return;

    _data = value;

    return;
  }
}
