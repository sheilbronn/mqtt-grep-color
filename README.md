# mqtt-grep-color
mqtt-grep-color is a shell script that subscribes to a MQTT topic, adds a time stamp in front of each line, optionally greps for an expression and colors its output. This eases MQTT debugging on the command line.

Notes:
1. mqtt-grep-color relies heavily on the output coloring feature of GNU grep. The BusyBox version of grep does not support coloring, so the script doesn't color the output on busybox.
2. A previous version used xargs instead of awk. Hopefully, awk works better! At least it has less overhead.
3. It seems that buffering on OpenWrt works different than on Raspbian. Please give me feedback.
