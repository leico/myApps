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

    public:
      Base(ofRectangle &area);
      virtual ~Base(void);

      virtual void update(void) = 0;
      virtual void draw  (void) = 0;

      virtual void touchDown(ofTouchEventArgs &touch) = 0;
      virtual void touchMove(ofTouchEventArgs &touch) = 0;
      virtual void touchUp  (ofTouchEventArgs &touch) = 0;

  };

  inline Base ::  Base(void)                                          {}
  inline Base ::  Base(ofRectangle &area) : _area(area), _touch(false){}
  inline Base :: ~Base(void)                                          {}
}
}

#endif /* defined(__emptyExample__Base__) */
