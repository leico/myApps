//
//  Base.cpp
//  emptyExample
//
//  Created by leico on 2014/09/03.
//
//

#include "Base.h"

namespace ofxController{
namespace Core{
  /* ============================================ *
   * Base :: Base                                 *
   * ============================================ */
  Base ::  Base(void)           {}
  Base ::  Base(const Base &obj){}

  Base ::  Base(const ofRectangle &area) : _area(area), _touch(false){}


  /* ============================================ *
   * Base :: ~Base                                *
   * ============================================ */
  Base :: ~Base(void){}

}
}
