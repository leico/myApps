//
//  BaseOSC.h
//  emptyExample
//
//  Created by leico on 2014/08/28.
//
//

#ifndef emptyExample_BaseOSC_h
#define emptyExample_BaseOSC_h

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxOSC.h"

#include "OSCManager.h"

#include <string>

namespace ofxController{
namespace Core{

  class OSCManager;

  class BaseOSC{
    
    protected:

      std :: string  _address;
      OSCManager    *_osc;

    private:
      BaseOSC(void);
      
    protected:
      BaseOSC(OSCManager *osc, std :: string address);

    public:
      virtual ~BaseOSC(void);

      virtual void newOscMessage(ofxOscMessage &msg) = 0;
  };

  /* =============================================== *
   * BaseOSC :: BaseOSC                              *
   * =============================================== */
  inline BaseOSC :: BaseOSC(void)                                                                 {}
  inline BaseOSC :: BaseOSC(OSCManager *osc, std :: string address) : _osc(osc), _address(address){}
  /* =============================================== *
   * BaseOSC :: ~BaseOSC                             *
   * =============================================== */
  inline BaseOSC :: ~BaseOSC(void){}
 
}
}


#endif
