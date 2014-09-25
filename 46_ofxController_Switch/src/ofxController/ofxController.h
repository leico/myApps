//
//  ofxController.h
//  emptyExample
//
//  Created by leico on 2014/08/28.
//
//

#ifndef emptyExample_ofxController_h
#define emptyExample_ofxController_h

#include "MidiManager.h"
#include "OSCManager.h"

#include "Base.h"

#include "Skin.h"

#include "MidiArg.h"
#include "NormalMidi.h"
#include "NormalCC.h"

#include "OSCArg.h"
#include "NormalOSC.h"
#include "TouchOSC.h"

#include "Container.h"
#include "Pad.h"
#include "Switch.h"

namespace ofxController{

  class ofxController{

    Core :: OSCManager  *_osc;
    Core :: MidiManager *_midi;

    Skin _skin;
    
    Container *_global;

    public:
     ofxController(void);
    ~ofxController(void);

    Container* addContainer(Container *domain, const ofRectangle &area);

    void addPad   (Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc);
    void addFader (Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc);
    void addSwitch(Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc);

    void addXYPad (
              Container   *domain
      , const ofRectangle &area
      ,       MidiArg     *midifuncx 
      ,       MidiArg     *midifuncy
      ,       OSCArg      *oscfuncx
      ,       OSCArg      *oscfuncy
    );

    

    void setup(
              std :: string  hostname
      ,       int            hostport
      ,       int            remoteport
      , const Skin          &skin
      , const ofRectangle   &area = ofRectangle(0, 0, ofGetWidth() + 1, ofGetHeight() + 1 )
    );

    void update(void);
    void draw  (void);

    void touchDown(ofTouchEventArgs &touch);
    void touchMove(ofTouchEventArgs &touch);
    void touchUp  (ofTouchEventArgs &touch);
    
  };
}
namespace ofxCon = ofxController;

#endif
