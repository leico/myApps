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

#include "Base.h"

#include <string>

namespace ofxController{
namespace Core{


class Base;


class OSCManager : 
  public ofxOscReceiver ,
  public ofxOscSender{

  
  Base *_listener;

private:
  OSCManager(void);
  OSCManager(const OSCManager &obj);

public:

   OSCManager(Base *listener, std :: string hostname, int hostport, int listenport);
  ~OSCManager(void);

  void update(void);
    
  /* ---------------------------------- ofxOscReceiver
   * void setup(int port);
   * bool hasWaitingMessages();
   * bool getNextMessage( ofxOscMessage* );
   * ---------------------------------- ofxOscSender
   * void setup(string hostname, int port);
   * void sendMessage( ofxOscMessage &msg);
   */
};


}
}
#endif /* defined(__emptyExample__OSCManager__) */
