//
//  GlobalContainer.h
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#ifndef __emptyExample__GlobalContainer__
#define __emptyExample__GlobalContainer__

#include <iostream>

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "Container.h"

#include "MidiManager.h"
#include "OSCManager.h"

namespace ofxController{

  class GlobalContainer : public Container{
    
    /* Base -------------------------------
     * ofRectangle _area;
     * bool        _touch;
     * Skin *_skin;
     */

    /* Container --------------------------
     * std :: list<Core :: Base *> _controller;
     */

    Core :: MidiManager _midi;
    Core :: OSCManager  _osc;
    Skin                _skin;

    private:
    GlobalContainer(void);
    GlobalContainer(const GlobalContainer &obj);
    
    public:
     GlobalContainer(const std :: string &hostaddress, int hostport, int remoteport, const Skin &skin);
    ~GlobalContainer(void);

    void update(void);

    /* Container ---------------------------
     * void draw  (void);
     * 
     * void touchDown(ofTouchEventArgs &touch);
     * void touchMove(ofTouchEventArgs &touch);
     * void touchUp  (ofTouchEventArgs &touch);
     *
     * void newMidiMessage(ofxMidiMessage &msg);
     * void newOscMessage (ofxOscMessage  &msg);
     * 
     * void AddController(Core :: Base *controller);
     */
  };
}

#endif /* defined(__emptyExample__GlobalContainer__) */
