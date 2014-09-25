//
//  VariableController.h
//  emptyExample
//
//  Created by leico on 2014/09/06.
//
//

#ifndef __emptyExample__VariableController__
#define __emptyExample__VariableController__

#include "ofMain.h" 
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "Base.h"
#include "Skin.h"

#include "MidiManager.h"
#include "OSCManager.h"

#include "MidiArg.h"
#include "OSCArg.h"

#include "BasicController.h"

namespace ofxController{

  class VariableController : public BasicController{

    /* Base --------------------------------
     * ofRectange _area;
     * bool       _touch;
     * Skin *_skin;
     *
     * virtual void update(void) = 0;
     * virtual void draw  (void) = 0;
     * 
     * virtual void touchDown(ofTouchEventArgs &touch) = 0;
     * virtual void touchMove(ofTouchEventArgs &touch) = 0;
     * virtual void touchUp  (ofTouchEventArgs &touch) = 0;
     * 
     */
    /* BasicController ---------------------
     * Core :: MidiManager *_midi;
     *         MidiArg     *_midifunc;
     * Core :: OSCManager  *_osc;
     *         OSCArg      *_oscfunc;
     * 
     * ofRectangle _drawarea;
     */

    protected:
    float _data;

    protected:
    VariableController(void);
    VariableController(const VariableController &obj);
    VariableController(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
    );

    public:
    virtual ~VariableController(void);
    
    virtual void newMidiMessage(ofxMidiMessage &msg);
    virtual void newOscMessage (ofxOscMessage  &msg);

  };
}

#endif /* defined(__emptyExample__VariableController__) */
