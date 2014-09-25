//
//  BasicController.h
//  emptyExample
//
//  Created by leico on 2014/09/05.
//
//

#ifndef __emptyExample__BasicController__
#define __emptyExample__BasicController__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "Base.h"
#include "Skin.h"

#include "MidiManager.h"
#include "OSCManager.h"

#include "MidiArg.h"
#include "OSCArg.h"

namespace ofxController{

  enum Landscape{
      Vertical
    , Horizonal
  };


  class BasicController : public Core :: Base{

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
     * virtual void newMidiMessage(ofxMidiMessage &msg) = 0;
     * virtual void newOscMessage (ofxOscMessage  &msg) = 0;
     */

    const static int _MARGIN; //=5

    protected:
    Core :: MidiManager *_midi;
            MidiArg     *_midifunc;
    Core :: OSCManager  *_osc;
            OSCArg      *_oscfunc;

    ofRectangle _drawarea;

    private:
    BasicController(const BasicController &obj);

    protected:
    BasicController(void);
    BasicController(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
    );

    public:
    virtual ~BasicController(void);

  };
}

#endif /* defined(__emptyExample__BasicController__) */
