//
//  MidiManager.h
//  emptyExample
//
//  Created by leico on 2014/08/17.
//
//

#ifndef __emptyExample__MidiManager__
#define __emptyExample__MidiManager__

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxMidi.h"

#include "BaseMidi.h"

#include <deque>
#include <vector>

namespace ofxController{
namespace Core{

  class BaseMidi;


  class MidiManager : 
    public ofxMidiListener,
    public ofxMidiConnectionListener{

      private:

        vector< ofxMidiIn*  > inputs;
        vector< ofxMidiOut* > outputs;
			
				BaseMidi *_listener;

        MidiManager(const MidiManager &obj);
      public:

        MidiManager(void);
        ~MidiManager(void);

        void setup(BaseMidi *listener);

        void newMidiMessage(ofxMidiMessage &msg);

        void midiInputAdded  (string name, bool isNetwork);
        void midiInputRemoved(string name, bool isNetwork);

        void midiOutputAdded  (string name, bool isNetwork);
        void midiOutputRemoved(string name, bool isNetwork);

        void sendNoteOn        (int ch, int pitch, int velocity = 64);
        void sendPolyAfterTouch(int ch, int pitch, int velocity);
        void sendNoteOff       (int ch, int pitch, int velocity = 64);

        void sendControlChange(int ch, int pitch, int value);
    };
}
}
#endif /* defined(__emptyExample__MidiManager__) */
