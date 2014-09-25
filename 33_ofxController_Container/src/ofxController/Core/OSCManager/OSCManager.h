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
  OSCManager(const OSCManager &obj);

public:

   OSCManager(void);
  ~OSCManager(void);
    
  void setup(Base *listener, std :: string hostname, int host_port, int listen_port);
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

/* ========================================== *
 * OSCManager :: OSCManager                   *
 * ========================================== */
inline OSCManager :: OSCManager(void){}
inline OSCManager :: OSCManager(const OSCManager &obj){}

/* ========================================== *
 * OSCManager :: ~OSCManager                  *
 * ========================================== */
inline OSCManager :: ~OSCManager(void){}

}
}
#endif /* defined(__emptyExample__OSCManager__) */
