//
//  Container.h
//  emptyExample
//
//  Created by leico on 2014/08/31.
//
//

#ifndef __emptyExample__Container__
#define __emptyExample__Container__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "Base.h"

#include "Skin.h"

#include <list>


namespace ofxController{

  class Container : public Core :: Base{


    /* Base --------------------------------
     * ofRectange _area;
     * bool       _touch;
     * Skin *_skin;
     */

    protected:
    std :: list<Core :: Base *> _controller;

    private:
    Container(const Container &obj);

    protected:
    Container(void);

    public:
    Container(const ofRectangle &area, Skin *skin);
    virtual ~Container(void);

    virtual void update(void);
    virtual void draw (void);

    virtual void touchDown(ofTouchEventArgs &touch);
    virtual void touchMove(ofTouchEventArgs &touch);
    virtual void touchUp  (ofTouchEventArgs &touch);

    virtual void newMidiMessage(ofxMidiMessage &msg);
    virtual void newOscMessage (ofxOscMessage  &msg);

    virtual void AddController(Core :: Base *controller);
  }; 

}

#endif /* defined(__emptyExample__Container__) */
