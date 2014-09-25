//
//  Skin.mm
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "Skin.h"

namespace ofxController{
  /* ============================================ *
   * Skin :: Skin                                 *
   * ============================================ */
  Skin :: Skin(void) :
    _on    ( ofColor(0, 0, 0) ),
    _off   ( ofColor(0, 0, 0) ),
    _border( ofColor(0, 0, 0) )
  {}

  Skin :: Skin(const ofColor &on, const ofColor &off, const ofColor &border) :
    _on(on), _off(off), _border(border)
  {}

  Skin :: Skin(const Skin &obj) : 
    _on(obj._on), _off(obj._off), _border(obj._border)
  {}
  /* ============================================ *
   * Skin :: ~Skin                                *
   * ============================================ */
  Skin :: ~Skin(void){}
  
  /* ============================================ *
   * Skin :: On                                   *
   * ============================================ */
  const ofColor& Skin :: On(void){ return _on; }

  /* ============================================ *
   * Skin :: Off                                  *
   * ============================================ */
  const ofColor& Skin :: Off(void){ return _off; }

  /* ============================================ *
   * Skin :: Border                               *
   * ============================================ */
  const ofColor& Skin :: Border(void){ return _border; }

}
