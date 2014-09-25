#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxMidi.h"

#include <deque>
#include <vector>

class ofApp : 
  public ofxiOSApp, 
  public ofxMidiListener, 
  public ofxMidiConnectionListener{

    private :

      vector < ofxMidiIn*  > inputs;
      vector < ofxMidiOut* > outputs;

      int            maxMessages;
      deque <string> messages;
      ofMutex        messageMutex;

      int                     note, ctl;
      vector< unsigned char > bytes;

      void addMessage(const string &msg);


    public :
      void setup();
      void update();
      void draw();
      void exit();

      void touchDown(ofTouchEventArgs & touch);
      void touchMoved(ofTouchEventArgs & touch);
      void touchUp(ofTouchEventArgs & touch);
      void touchDoubleTap(ofTouchEventArgs & touch);
      void touchCancelled(ofTouchEventArgs & touch);

      void lostFocus();
      void gotFocus();
      void gotMemoryWarning();
      void deviceOrientationChanged(int newOrientation);



      void newMidiMessage(ofxMidiMessage &msg);
      
      void midiInputAdded  (string name, bool isNetwork);
      void midiInputRemoved(string name, bool isNetwork);

      void midiOutputAdded  (string name, bool isNetwork);
      void midiOutputRemoved(string name, bool isNetwork);


  };


