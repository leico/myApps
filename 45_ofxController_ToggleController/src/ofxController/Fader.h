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

#include "BasicController.h"

#include "Skin.h"

#include "MidiManager.h"
#include "OSCManager.h"

#include "MidiArg.h"
#include "OSCArg.h"

namespace ofxController{


  class Fader : public BasicController{

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
     */

    float _data;

    private:
    Fader(void);

    public:
    Fader(const Fader &obj);
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
    
    void newMidiMessage(ofxMidiMessage &msg);
    void newOscMessage (ofxOscMessage  &msg);
  };
}

#endif /* defined(__emptyExample__Fader__) */
