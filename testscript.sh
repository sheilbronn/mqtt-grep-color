#!/bin/sh -x

# test script with a few simple test cases for mqtt-grep-color
# by far not comprehensive

mosquitto_pub -t testi/0 -m asinglelinemessage

mosquitto_pub -t testi/0b -m asinglelinemessage/withslash

mosquitto_pub -s -t testi/1 <<eof
oneofsix
twoofsix
threeofsix
fourofsix
fiveofsix
sixofsix
eof

sleep 2

mosquitto_pub -s -t testi/2 <<eof
	eins tab
	zwei tab
	drei tab
eof

sleep 2

mosquitto_pub -s -t tEsti/3 <<eof
 vier
 fünf
before/slashsix
ö2
 sechs
eof

sleep 2

mosquitto_pub -s -t testi/4 <<eof
1 of 5
  2of 5
3 of 5
4 of 5
 5 of 5
endofthefile
eof
