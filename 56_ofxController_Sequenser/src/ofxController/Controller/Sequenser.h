//
//  Sequenser.h
//  emptyExample
//
//  Created by leico on 2014/09/11.
//
//

#ifndef __emptyExample__Sequenser__
#define __emptyExample__Sequenser__

#include "MultiSwitch.h"

namespace ofxController{

  class Sequenser : public MultiSwitch{

    protected:
    int   _step;
    int   _numstep;
    float _threshold;
    float _ms;

    ofRectangle _pos;

    protected:
    Sequenser(void);
    Sequenser(const Sequenser &obj);
    
    public:
    Sequenser(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
      , const   float        bpm
      , const   int          steps
    );

    virtual ~Sequenser(void);

    void update(void);
    void draw  (void);
    
    void touchDown(ofTouchEventArgs &touch);
    void touchMove(ofTouchEventArgs &touch);
    void touchUp  (ofTouchEventArgs &touch);

    void newMidiMessage(ofxMidiMessage &msg);
    void newOscMessage (ofxOscMessage  &msg);
  };
}

#endif /* defined(__emptyExample__Sequenser__) */
