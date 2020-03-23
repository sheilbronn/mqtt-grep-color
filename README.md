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

#### Example 1

```sh
# connect to the default (local) broker and use standard coloring for *all* messages from the broker
mqtt-grep-color
```

#### Example 2

This command show the usage with optional parameters such as the the _grep-expression_, the _MQTT topic_ and and the _MQTT broker_:
```sh
# follow any BBC subtitle stream, grep for lines with the's only and highlight them (dosn't make much sense but shows the capabilities)
mqtt-grep-color -e the -t "bbc/#"  -h test.mosquitto.org
```
This results in output  like this (assuning the BBC newsfeed is still running):

![Sample output from mqtt-grep-color with a grep option](sample_bbc24_with_the.png?raw=true "Sample output with grep expression")

#### Example 3

```sh
# follow BBC News 24 compacted subtitle stream 
mqtt-grep-color  -t "bbc/subtitles/bbc_news24/compacted"  -h test.mosquitto.org
```

This command results in output like this (assuning the BBC newsfeed is still running):

![Another sample output from mqtt-grep-color](sample_bbc24.png?raw=true "Sample output from the BBC MQTT feed")

### Additional stuff

1. As a shortcut, if you supply "test" as the broker host, it will be interpreted as test.mosquitto.org automatically.
2. If you omit a `#` after a trailing `/`, the `#` will be added by default:

```sh
# So the example from above could also be entered as:
mqtt-grep-color -e e -t bbc/  -h test
```

### Issues
1. IMHO, the assumptions made regarding the coloring of the topic string should be based on these best practices. This is not enforced yet:  
https://www.hivemq.com/blog/mqtt-essentials-part-5-mqtt-topics-best-practices/ 

  Never use a leading forward slash.
  Never use spaces in a topic.
  Use only ASCII characters, avoid non printable characters.

2. Unfortunately, multi-line messages (containaing a line-feed char) from mosquitto_sub are hard to process, because the topic can hardly be diffrentiated from the message body on subsequent lines. The ugly hack introducing a unique string _XXshouldbetopicXX_ mitigates that to a certain extent, but maybe there is less imperfect solution...
