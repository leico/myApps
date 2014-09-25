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
    Base( ofRectangle() ),
    _controller(),
    _skin(NULL)
  {}

  /* ============================================ *
   * Container :: Container                       *
   * ============================================ */
  Container :: Container(const Container &obj) :
    Base( ofRectangle() ),
    _controller(),
    _skin(NULL)
  {}

  /* ============================================ *
   * Container :: Container                       *
   * ============================================ */
  Container :: Container(const ofRectangle &area, Skin *skin) :
    Base( area ),
    _controller(),
    _skin(skin)
  {}

  /* ============================================ *
   * Container :: ~Container                      *
   * ============================================ */
  Container :: ~Container(void){

    for(std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      delete (*it);
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

    for( std :: list<Core :: Base *> :: iterator it = _controller.begin() ; it != _controller.end() ; ++ it)
      (*it) -> newMidiMessage(msg);
  }

  /* ============================================ *
   * Container :: newOscMessage                   *
   * ============================================ */
  void Container :: newOscMessage(ofxOscMessage &msg){
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
