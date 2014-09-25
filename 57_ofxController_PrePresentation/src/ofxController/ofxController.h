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
#include "NoMidi.h"
#include "NormalMidi.h"
#include "NormalCC.h"

#include "OSCArg.h"
#include "NoOSC.h"
#include "NormalOSC.h"
#include "TouchOSC.h"

#include "Container.h"
#include "Pad.h"
#include "Switch.h"
#include "Fader.h"
#include "MultiSwitch.h"
#include "Sequenser.h"

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
    void addSwitch(Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc);

    template<Landscape L = Vertical, Style = Normal>
    void addFader(Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc);

    void addMultiSwitch(
               Container  *domain
      , const ofRectangle &area
      ,       MidiArg     *midifunc
      ,       OSCArg      *oscfunc
      , const int num
    );
    void addSequenser(
              Container   *domain
      , const ofRectangle &area
      ,       MidiArg     *midifunc
      ,       OSCArg      *oscfunc
      , const float        bpm
      , const int          steps
    );

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

  /* =============================================== *
   * ofxController :: addFader                       *
   * =============================================== */
  template<Landscape L, Style S>
  inline void ofxController :: addFader(Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc){

    if(domain == NULL) domain = _global;

    ofRectangle rect = area;
    
    rect.setPosition( domain -> Area().getPosition() + area.getPosition() );
    
    Core :: Base *fader = new Fader<L, S>(_osc, oscfunc, _midi, midifunc, rect, &_skin);
    domain -> AddController(fader);

    return;
  }

}
namespace ofxCon = ofxController;

#endif
