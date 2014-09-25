//
//  Pad.h
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#ifndef __emptyExample__Pad__
#define __emptyExample__Pad__

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

  class Pad : public Core :: Base{

    /* Base --------------------------------
     * ofRectange _area;
     * bool       _touch;
     * Skin *_skin;
     */

    Core :: MidiManager *_midi;
            MidiArg     *_midifunc;
    
    Core :: OSCManager *_osc;
            OSCArg     *_oscfunc;

    private:
    Pad(void);

    public:
    Pad(const Pad &obj);
    Pad(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
    );

    virtual ~Pad(void);

    void update(void);
    void draw  (void);
    
    void touchDown(ofTouchEventArgs &touch);
    void touchMove(ofTouchEventArgs &touch);
    void touchUp  (ofTouchEventArgs &touch);

    void newMidiMessage(ofxMidiMessage &msg);
    void newOscMessage (ofxOscMessage  &msg);
  };

}

#endif /* defined(__emptyExample__Pad__) */
