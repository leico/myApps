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

    public:
     Skin(void);
     Skin(const ofColor &on, const ofColor &off, const ofColor &border);
     Skin(const Skin &obj);
    ~Skin(void);

    const ofColor& On    (void);
    const ofColor& Off   (void);
    const ofColor& Border(void);

    const Skin& operator=(const Skin &obj);
  };

}


#endif
