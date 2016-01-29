#!/bin/sh
. `dirname "$0"`/../config.sh
gst-launch-1.0 \
	videotestsrc pattern=smpte !\
		video/x-raw,format=I420,width=$WIDTH,height=$HEIGHT,framerate=$FRAMERATE/1,pixel-aspect-ratio=1/1 ! \
		mux. \
	\
	matroskamux name=mux !\
		tcpclientsink host=localhost port=16000
