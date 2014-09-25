#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "OSCManager.h"

class ofApp : public ofxiOSApp{

  const static char* const HOST_NAME;
  const static int         HOST_PORT;
  const static int         LISTEN_PORT;

  const static int NUM_MSG_STRINGS = 10;

  OSCManager osc;

  int           current_msg_string;
  std :: string msg_strings[NUM_MSG_STRINGS];
  float         timers[NUM_MSG_STRINGS];

  int           mouseX;
  int           mouseY;
  std :: string mouseButtonState;

public:
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

};


