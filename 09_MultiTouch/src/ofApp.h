#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class ofApp : public ofxiOSApp{

  private:

    const static int FINMAX = 5;

    float posX, posY;
    float velX, velY;
    float finX[FINMAX], finY[FINMAX];
    bool isTouching[FINMAX];

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


