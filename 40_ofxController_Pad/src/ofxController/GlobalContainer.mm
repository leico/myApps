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
    _midi(this),
    _osc(this, "localhost", 9000, 8000),
    _skin()
  {}
    
  GlobalContainer :: GlobalContainer(const GlobalContainer &obj) :
    Container(),
    _midi(this),
    _osc(this, "localhost", 9000, 8000),
    _skin()
  {}


  GlobalContainer :: GlobalContainer(const std :: string &hostaddress, int hostport, int remoteport, const Skin &skin) :
    Container( ofRectangle(0, 0, ofGetWidth(), ofGetHeight()), &_skin ),
    _midi(this),
    _osc(this, hostaddress, hostport, remoteport),
    _skin(skin)
  {
    ofLog(OF_LOG_VERBOSE, "GlobalContainer");
  }

  /* =============================================== *
   * GlobalContainer :: ~GlobalContainer             *
   * =============================================== */
  GlobalContainer :: ~GlobalContainer(void){

    ofLog(OF_LOG_VERBOSE, "~GlobalContainer");
  
  }

  /* =============================================== *
   * GlobalContainer :: update                       *
   * =============================================== */
  void GlobalContainer :: update(void){
    _osc.update();

    Container :: update();
  }

  
}
