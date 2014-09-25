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

#include "ToggleController.h"

namespace ofxController{

  class Pad : public ToggleController{

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
    /* ToggleController --------------------
     * bool _data;
     */

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

  };

}

#endif /* defined(__emptyExample__Pad__) */
