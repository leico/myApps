//
//  OSCManager.mm
//  emptyExample
//
//  Created by leico on 2014/08/19.
//
//

#include "OSCManager.h"

OSCManager :: OSCManager(){
}

OSCManager :: ~OSCManager(){
}


void OSCManager :: setup(std :: string hostname, int host_port, int listen_port){

  ofxOscSender   :: setup(hostname, host_port);
  ofxOscReceiver :: setup(listen_port);
}