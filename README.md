# mqtt-grep-colorize
mqtt-grep-colorise provides a shell script that subscribes to a MQTT topic, adds a time stamp, optionally greps for an expression and colorises the output. It wrote it to ease MQTT debugging on the command line.

Notes:
1. mqtt-grep-colorise relies on the colorizing feature of GNU grep. The BusyBox version of grep does not support coloring, so the script wont work on busybox.
2. So far mqtt-grep-colorise doesn't work with the BusyBox version of xargs. So this is another reason it won't work with BusyBox...
3. ... and it seems that buffering on OpenWrt is different from Raspbian. This is another diffuculty on a BusBox system.
