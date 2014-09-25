//
//  Base.h
//  emptyExample
//
//  Created by leico on 2014/08/28.
//
//

#ifndef __emptyExample__Base__
#define __emptyExample__Base__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxOSC.h"
#include "ofxMidi.h"

namespace ofxController{
namespace Core{

  class Base{

    protected:
      ofRectangle _area;
      bool        _touch;

    private:
      Base(void);
      Base(const Base &obj);

    public:
      Base(const ofRectangle &area);
      virtual ~Base(void);

      virtual void update(void) = 0;
      virtual void draw  (void) = 0;

      virtual void touchDown(ofTouchEventArgs &touch) = 0;
      virtual void touchMove(ofTouchEventArgs &touch) = 0;
      virtual void touchUp  (ofTouchEventArgs &touch) = 0;

      virtual void newMidiMessage(ofxMidiMessage &msg) = 0;
      virtual void newOscMessage (ofxOscMessage  &msg) = 0;

  };

}
}

#endif /* defined(__emptyExample__Base__) */
