//
//  BaseMidi.h
//  emptyExample
//
//  Created by leico on 2014/08/28.
//
//

#ifndef __emptyExample__BaseMidi__
#define __emptyExample__BaseMidi__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxMidi.h"

#include "MidiManager.h"

namespace ofxController{
namespace Core{
	
	class MidiManager;

  class BaseMidi{

    protected:
      MidiManager *_midi;

    private:
      BaseMidi(void);

    protected:
      BaseMidi(MidiManager *midi);

    public:
      virtual ~BaseMidi(void);

      virtual void newMidiMessage(ofxMidiMessage &msg) = 0;
  };

  /* =============================================== *
   * BaseMidi :: BaseMidi                            *
   * =============================================== */
  inline BaseMidi ::  BaseMidi(void)                           {}
  inline BaseMidi ::  BaseMidi(MidiManager *midi) : _midi(midi){}

  /* =============================================== *
   * BaseMidi :: ~BaseMidi                           *
   * =============================================== */
  inline BaseMidi :: ~BaseMidi(void){}

}
}

#endif /* defined(__emptyExample__BaseMidi__) */
