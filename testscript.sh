#!/bin/sh -x

# test script with a few simple test cases for mqtt-grep-color
# by far not comprehensive

mosquitto_pub -s -t testi/1 <<eof
	eins
	zwei
	drei
eof

sleep 2

mosquitto_pub -s -t tEsti/2 <<eof
 vier
 fünf
ü1
ö2
 sechs
eof

sleep 2

mosquitto_pub -s -t testi/3 <<eof
 sieben
 acht
beginningofline
endofthefile
eof
