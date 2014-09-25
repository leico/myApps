//
//  Container.cpp
//  emptyExample
//
//  Created by leico on 2014/08/31.
//
//

#include "Container.h"

namespace ofxController{


  /* ============================================ *
   * Container :: Container                       *
   * ============================================ */
  Container :: Container(void) : 
    Base( ofRectangle(), NULL ),
    _controller()
  {}

  /* ============================================ *
   * Container :: Container                       *
   * ============================================ */
  Container :: Container(const Container &obj) :
    Base( ofRectangle(), NULL ),
    _controller()
  {}

  /* ============================================ *
   * Container :: Container                       *
   * ============================================ */
  Container :: Container(const ofRectangle &area, Skin *skin) :
      Base( area, skin )
    , _controller()
  {
    ofLog(OF_LOG_VERBOSE, "Container");
  
  }

  /* ============================================ *
   * Container :: ~Container                      *
   * ============================================ */
  Container :: ~Container(void){

    for(std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      delete (*it);

    ofLog(OF_LOG_VERBOSE, "~Container");
  }

  /* ============================================ *
   * Container :: update                          *
   * ============================================ */
  void Container :: update(void){
    
    for(std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++it)
      (*it) -> update();
  }

  /* ============================================ *
   * Container :: draw                            *
   * ============================================ */
  void Container :: draw (void){

    ofNoFill();
    ofSetColor( _skin -> Border() );

    ofRect( _area );

    for(std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      (*it) -> draw();
  }

  /* ============================================ *
   * Container :: touchDown                       *
   * ============================================ */
  void Container :: touchDown(ofTouchEventArgs &touch){

    if( ! _area.inside(touch.x, touch.y) ) return;

    _touch = true;

    for( std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      (*it) -> touchDown(touch);

    ofLog(OF_LOG_VERBOSE, "inside:touchDown");

  }


  /* ============================================ *
   * Container :: touchMove                       *
   * ============================================ */
  void Container :: touchMove(ofTouchEventArgs &touch){

    if( ! _touch) return;

    for( std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      (*it) -> touchMove(touch);

    ofLog(OF_LOG_VERBOSE, "inside:touchMove");

  }

  /* ============================================ *
   * Container :: touchUp                         *
   * ============================================ */
  void Container :: touchUp(ofTouchEventArgs &touch){

    if( ! _touch) return;

    for( std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      (*it) -> touchUp(touch);

    _touch = false;

    ofLog(OF_LOG_VERBOSE, "inside:touchUp");


  }

  /* ============================================ *
   * Container :: newMidiMessage                  *
   * ============================================ */
  void Container :: newMidiMessage(ofxMidiMessage &msg){

    stringstream str;
    str << "Container :"  << "\n";
    str << "Ch        : " << msg.channel  << "\n"
        << "Pitch     : " << msg.pitch    << "\n"
        << "Velocity  : " << msg.velocity << "\n"
        << "Control   : " << msg.control  << "\n"
        << "Value     : " << msg.value    << endl;

    ofLog(OF_LOG_VERBOSE, str.str());

    for( std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      (*it) -> newMidiMessage(msg);
  }

  /* ============================================ *
   * Container :: newOscMessage                   *
   * ============================================ */
  void Container :: newOscMessage(ofxOscMessage &msg){

     string msg_string("Container:\n");
      msg_string += msg.getAddress();
      msg_string += ": ";

      for(int i = 0 ; i < msg.getNumArgs() ; ++ i){
        
        msg_string += msg.getArgTypeName(i);
        msg_string += ":";

        switch( msg.getArgType(i) ){
          
          case OFXOSC_TYPE_INT32:
            msg_string += ofToString( msg.getArgAsInt32(i) ) + " ";
          break;
          case OFXOSC_TYPE_FLOAT:
            msg_string += ofToString( msg.getArgAsFloat(i) ) + " ";
          break;
          case OFXOSC_TYPE_STRING:
            msg_string += msg.getArgAsString(i) + " ";
          break;
          default:
            msg_string += "unknown";
          break;
        }
      }

      ofLog(OF_LOG_VERBOSE, msg_string);

    for( std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      (*it) -> newOscMessage(msg);
  }


  /* ============================================ *
   * Container :: newOscMessage                   *
   * ============================================ */
  void Container :: AddController(Core :: Base *controller){
    
    _controller.push_back(controller);
  }


}
