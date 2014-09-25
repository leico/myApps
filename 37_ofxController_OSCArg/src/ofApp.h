#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxController.h"

class ofApp : public ofxiOSApp{

  ofxCon :: GlobalContainer *test;
  ofxCon :: Skin            *skin;

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


