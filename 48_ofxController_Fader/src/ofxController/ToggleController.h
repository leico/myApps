//
//  ToggleController.h
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#ifndef __emptyExample__ToggleController__
#define __emptyExample__ToggleController__

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

  class ToggleController : public BasicController{

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
     */

    protected:
    bool _data;

    protected:
    ToggleController(void);
    ToggleController(const ToggleController &obj);
    ToggleController(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
    );
      
    public:
    virtual ~ToggleController(void);

    virtual void newMidiMessage(ofxMidiMessage &msg);
    virtual void newOscMessage (ofxOscMessage  &msg);

  };
}

#endif /* defined(__emptyExample__ToggleController__) */
