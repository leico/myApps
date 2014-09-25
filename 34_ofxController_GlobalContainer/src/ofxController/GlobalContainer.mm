//
//  GlobalContainer.cpp
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "GlobalContainer.h"

namespace ofxController{


  /* =============================================== *
   * GlobalContainer :: GlobalContainer              *
   * =============================================== */
  GlobalContainer :: GlobalContainer(void) :
    Container(),
    _midi(),
    _osc(),
    _skin()
  {}
    
  GlobalContainer :: GlobalContainer(const GlobalContainer &obj) :
    Container(),
    _midi(),
    _osc(),
    _skin()
  {}


  GlobalContainer :: GlobalContainer(const std :: string &hostaddress, int hostport, int remoteport, const Skin &skin) :
    Container( ofRectangle(0, 0, ofGetWidth(), ofGetHeight()), &_skin ),
    _midi(),
    _osc(),
    _skin(skin)
  {
    _midi.setup(this);
    _osc .setup(this, hostaddress, hostport, remoteport);

    ofLog(OF_LOG_VERBOSE, "GlobalContainer");
  }

  /* =============================================== *
   * GlobalContainer :: ~GlobalContainer             *
   * =============================================== */
  GlobalContainer :: ~GlobalContainer(void){

    ofLog(OF_LOG_VERBOSE, "~GlobalContainer");
  
  }
  
}
