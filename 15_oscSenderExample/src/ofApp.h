#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxOsc.h"

#define HOST "10.0.2.1"
#define PORT 8000

class ofApp : public ofxiOSApp {

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

		ofxOscSender sender;
};

