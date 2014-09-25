//
//  OSCManager.mm
//  emptyExample
//
//  Created by leico on 2014/08/19.
//
//

#include "OSCManager.h"

namespace ofxController{
namespace Core{

  /* ========================================== *
   * OSCManager :: OSCManager                   *
   * ========================================== */
  OSCManager :: OSCManager(void){}
  OSCManager :: OSCManager(const OSCManager &obj){}
  OSCManager :: OSCManager(Base* listener, std :: string hostname, int host_port, int listen_port){

    ofxOscSender   :: setup(hostname, host_port);
    ofxOscReceiver :: setup(listen_port);

    _listener = listener;

  }

  /* ========================================== *
   * OSCManager :: ~OSCManager                  *
   * ========================================== */
  OSCManager :: ~OSCManager(void){

  }

  /* ========================================== *
   * OSCManager :: update                       *
   * ========================================== */
  void OSCManager :: update(void){

    while(hasWaitingMessages()){

      ofxOscMessage msg;
      getNextMessage(&msg);

      _listener -> newOscMessage(msg);
    }
  }

}
}
