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

    void update(void);
    void draw (void);

    void touchDown(ofTouchEventArgs &touch);
    void touchMove(ofTouchEventArgs &touch);
    void touchUp  (ofTouchEventArgs &touch);

    void newMidiMessage(ofxMidiMessage &msg);
    void newOscMessage (ofxOscMessage  &msg);

    void AddController(Core :: Base *controller);
    
    const ofRectangle& Area(void);
  }; 

}

#endif /* defined(__emptyExample__Container__) */
