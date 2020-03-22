# mqtt-grep-color

**mqtt-grep-color** is a shell script that **subscribes** to a MQTT topic using mosquitto_sub, adds a **time stamp** in front of each line, optionally **greps** for an expression plus **colors** the output. These features ease MQTT debugging on the command line.

### Usage
```sh
  mqtt-grep-color -e <grepexpr> -h <brokerhost> -d -t <MQTT topic>
```

### Notes
1. mqtt-grep-color relies heavily on the **output coloring feature of GNU grep**. However, the BusyBox version of grep does not support coloring, so the script can't color the output on busybox.
2. **Non-printable characters** are removed from the mosquitto_sub output before further processing.
3. If you have a BusyBox grep that doesn't support line buffering, try to install the command stdbuf, i.e. package "coreutils-stdbuf" on OpenWrt. Otherwise, ugly, bulky,delayed output might be the consequence.... (the script warns about this)

### Examples
```sh
 # connect to the default (local) broker and use standard coloring for *all* messages from the broker
mqtt-grep-color
```

This show the usage with optional parameters such as the the _grep-expression_, the _MQTT topic_ and and the _MQTT broker_:
```sh
  # follow any BBC subtitle stream and highlight the e's (dosn't make much sense but shows the capabilities)
  mqtt-grep-color -e e -t "bbc/#"  -h test.mosquitto.org
```
```sh
  # follow BBC News 24 compacted subtitle stream 
  mqtt-grep-color  -t "bbc/subtitles/bbc_news24/compacted"  -h test.mosquitto.org
```

### Additional stuff

1. As a shortcut, if you supply "test" as the broker host, it will be interpreted as test.mosquitto.org automatically.
2. If you omit a `#` after a trailing `/`, the `#` will be added by default.

   So the example from above could also be entered as:

```ash
  mqtt-grep-color -e e -t bbc/  -h test
```
