//
//  Skin.h
//  emptyExample
//
//  Created by leico on 2014/08/28.
//
//

#ifndef emptyExample_Skin_h
#define emptyExample_Skin_h

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

namespace ofxController{

  class Skin{

    ofColor _on;
    ofColor _off;
    ofColor _border;

    private:
    Skin(void);

    public:
     Skin(ofColor &on, ofColor &off, ofColor &border);
     Skin(const Skin &obj);
    ~Skin(void);

    const ofColor& On    (void);
    const ofColor& Off   (void);
    const ofColor& Border(void);
  };

  /* ============================================ *
   * Skin :: Skin                                 *
   * ============================================ */
  inline Skin :: Skin(void){}
  inline Skin :: Skin(ofColor &on, ofColor &off, ofColor &border) :
    _on(on), _off(off), _border(border)
  {}
  inline Skin :: Skin(const Skin &obj) : 
    _on(obj._on), _off(obj._off), _border(obj._border)
  {}
  /* ============================================ *
   * Skin :: ~Skin                                *
   * ============================================ */
  inline Skin :: ~Skin(void){}
  
  /* ============================================ *
   * Skin :: On                                   *
   * ============================================ */
  inline const ofColor& Skin :: On(void){ return _on; }

  /* ============================================ *
   * Skin :: Off                                  *
   * ============================================ */
  inline const ofColor& Skin :: Off(void){ return _off; }

  /* ============================================ *
   * Skin :: Border                               *
   * ============================================ */
  inline const ofColor& Skin :: Border(void){ return _border; }
}


#endif
