//
//  MultiSwitch.h
//  emptyExample
//
//  Created by leico on 2014/09/10.
//
//

#ifndef __emptyExample__MultiSwitch__
#define __emptyExample__MultiSwitch__

#include "BasicController.h"
#include "Switch.h"

#include <vector>

namespace ofxController{

  class MultiSwitch : public BasicController{

    protected:
    std :: vector<Switch *> _switches;

    protected:
    MultiSwitch(void);
    MultiSwitch(const MultiSwitch &obj);

    public:
    MultiSwitch(
        Core :: OSCManager  *osc
      ,         OSCArg      *oscfunc
      , Core :: MidiManager *midi
      ,         MidiArg     *midifunc
      , const   ofRectangle &area
      ,         Skin        *skin
      , const   int          num
    );

    virtual ~MultiSwitch(void);

    void update(void);
    void draw  (void);
    
    void touchDown(ofTouchEventArgs &touch);
    void touchMove(ofTouchEventArgs &touch);
    void touchUp  (ofTouchEventArgs &touch);

    void newMidiMessage(ofxMidiMessage &msg);
    void newOscMessage (ofxOscMessage  &msg);

    
  };
}

#endif /* defined(__emptyExample__MultiSwitch__) */
