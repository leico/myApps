//
//  OSCManager.h
//  emptyExample
//
//  Created by leico on 2014/08/19.
//
//

#ifndef __emptyExample__OSCManager__
#define __emptyExample__OSCManager__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxOsc.h"

#include <string>

class OSCManager : 
  public ofxOscReceiver ,
  public ofxOscSender{

public:

   OSCManager();
  ~OSCManager();
    
  void setup(std :: string hostname, int host_port, int listen_port);
};

#endif /* defined(__emptyExample__OSCManager__) */
