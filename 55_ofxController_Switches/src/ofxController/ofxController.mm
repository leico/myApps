//
//  ofxController.mm
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "ofxController.h"

namespace ofxController{


  /* =============================================== *
   * ofxController :: ofxController                  *
   * =============================================== */
  ofxController :: ofxController(void) :
      _osc (NULL)
    , _midi(NULL)
    , _skin()
    , _global(NULL)
  {

    ofLog(OF_LOG_VERBOSE, "constructor");
  
  }

  /* =============================================== *
   * ofxController :: ~ofxController                 *
   * =============================================== */
  ofxController :: ~ofxController(void){

    delete _osc;
    delete _midi;
    delete _global;

    ofLog(OF_LOG_VERBOSE, "destructor");
  }

  /* =============================================== *
   * ofxController :: addContainer                   *
   * =============================================== */
  Container* ofxController :: addContainer(Container *domain, const ofRectangle &area){

    if(domain == NULL) domain = _global;
    
    ofRectangle rect = area;
    rect.setPosition( domain -> Area().getPosition() + area.getPosition() );

    Container *container = new Container(rect, &_skin);
    domain -> AddController(container);
    
    return container;
  }

  /* =============================================== *
   * ofxController :: addPad                         *
   * =============================================== */
  void ofxController :: addPad(Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc){

    if(domain == NULL) domain = _global;

    ofRectangle rect = area;
    rect.setPosition( domain -> Area().getPosition() + area.getPosition() );

    Core :: Base *pad = new Pad(_osc, oscfunc, _midi, midifunc, rect, &_skin);
    domain -> AddController(pad);

    return;
  }

  /* =============================================== *
   * ofxController :: addSwitch                      *
   * =============================================== */
  void ofxController :: addSwitch(Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc){

    if(domain == NULL) domain = _global;
    
    ofRectangle rect = area;
    rect.setPosition( domain -> Area().getPosition() + area.getPosition() );
    
    Core :: Base * sw = new Switch(_osc, oscfunc, _midi, midifunc, rect, &_skin);
    domain -> AddController(sw);
  }



  /* =============================================== *
   * ofxController :: addMultiSwitch                 *
   * =============================================== */
  void ofxController :: addMultiSwitch(Container *domain, const ofRectangle &area, MidiArg *midifunc, OSCArg *oscfunc, const int num){
    
    if(domain == NULL) domain = _global;

    ofRectangle rect = area;

    rect.setPosition( domain -> Area().getPosition() + area.getPosition() );
    Core :: Base *ms = new MultiSwitch(_osc, oscfunc, _midi, midifunc, rect, &_skin, num);

    domain -> AddController(ms);
  }

  


  /* =============================================== *
   * ofxController :: addXYPad                        *
   * =============================================== */
  void ofxController :: addXYPad(
            Container   *domain
    , const ofRectangle &area
    ,       MidiArg     *midifunc_x
    ,       MidiArg     *midifunc_y
    ,       OSCArg      *oscfunc_x
    ,       OSCArg      *oscfunc_y
  )
  {}



  /* =============================================== *
   * ofxController :: setup                          *
   * =============================================== */
  void ofxController :: setup(
            std :: string  hostname
    ,       int            hostport
    ,       int            remoteport
    , const Skin          &skin
    , const ofRectangle   &area)
  {

    _global = new Container(area, &_skin);
    _osc    = new Core :: OSCManager (_global, hostname, hostport, remoteport);
    _midi   = new Core :: MidiManager(_global);
    _skin   = skin;

    ofLog(OF_LOG_VERBOSE, "setup");
  }

  /* =============================================== *
   * ofxController :: update                         *
   * =============================================== */
  void ofxController :: update(void){

    _osc    -> update();
    _global -> update();
  }

  /* =============================================== *
   * ofxController :: draw                           *
   * =============================================== */
  void ofxController :: draw(void){

    _global -> draw();
  }

  /* =============================================== *
   * ofxController :: touchDown                      *
   * =============================================== */
  void ofxController :: touchDown(ofTouchEventArgs &touch){

    _global -> touchDown(touch);
  }

  /* =============================================== *
   * ofxController :: touchMove                      *
   * =============================================== */
  void ofxController :: touchMove(ofTouchEventArgs &touch){

    _global -> touchMove(touch);
  }

  /* =============================================== *
   * ofxController :: touchUp                        *
   * =============================================== */
  void ofxController :: touchUp(ofTouchEventArgs &touch){

    _global -> touchUp(touch);
  }



}
