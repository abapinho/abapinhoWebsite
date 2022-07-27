---
slug: split-loop
title: Use Python to rewrite ABAP code
description: rewrite-code-with-python
date: 2022-08-01T09:00:00Z
tags: [sapgui, python]
categories: [artigo]
keywords: [python for ABAP]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When you need to make mass changes to ABAP code, the SAPGui IDE isn't of much help. Eclipse ADT is better, especially if you just want to rename stuff. But there are lots of changes which you won't be able to automate there. Namely, changes that most be done hundreds of times and which cannot be done with a simple _find and replace_. In these cases you probably end up changing everything manually. But it doesn't have to be that way.

<!--more-->

## Automate

Not long ago I was faced with one of those things. I needed to modernize some code in a very old program. So I decided to create a simple Python program to make these changes for me.

It is faster, safer and more fun.

Here's the flowchart describing what I did:

{{< gravizo "" >}}
@startuml

start

partition #lightGrey "Setup" {
:Copy ABAP code to local file z_very_old.abap/
:Create skeleton of Python program to:

- read the ABAP file
- processe it
- save the result to a new file/
}

repeat
  partition #lightGrey "Iterative process" {
  repeat :Add or correct Python code/
    :Execute Python code;
    :Copy resulting code back to SAP/
    :Compile new ABAP code;
  repeat while (Does it compile?) is (no)
  -> yes;
  }

:manually validate new ABAP code;
repeat while (Is it ok?) is (no)
-> yes;

stop

@enduml
{{< /gravizo >}}

## Example

This is an old report using `WRITE` to output its results and we now want it to start writing them to the _Application Log_..

### AS-IS

```ABAP
REPORT z_very_old.

START-OF-SELECTION.
  WRITE / 'Starting...'.
  LOOP AT itbl INTO wa.
    WRITE: / 'Processing', wa-id, wa-description.
    (...)
  ENDLOOP.
  WRITE 'Finised.'.
```

### TO-BE

```abap
REPORT z_very_old.

START-OF-SELECTION.
  logger->add_text( 'Starting...' ).
  LOOP AT itbl INTO wa.
    logger->add_text( 'Processing' && wa-id && wa-description ).
    (...)
  ENDLOOP.
  logger->add_text( 'Finised.' ).
```

## Python

As you can see, _find and replace_ will not work here. And so I built a little Python program to do it for me. I'm not very versed in Python but it's really simple. And fun. I iterated dozens of times, running it against small bits of code, slowly increasing its scope and functionalities until it was spitting out the desired ABAP code. This is what I ended up with:

```Python
#!/usr/bin/python

import re
import os
import sys

REGEX_WRITE = [
  r'WRITE: / (.*?)\.',
  r'WRITE / (.*?)\.',
  r'WRITE: (.*?)\.',
  r'WRITE (.*?)\.'
]

def load_file(filename: str) -> str:
    with open(os.path.join(sys.path[0], filename), "r") as f:
        return(f.read())

def remove_points_inside_strings(str: str) -> str:
    """ To avoid making the regex expression unnecessarily complex """
    str = str.replace("'Req.", "'Req")
    str = str.replace(" repl.", " repl")
    str = str.replace("Screen Rel.", "Screen Rel")
    str = str.replace("WRITE: /.", "logger->add_text( ' ' ).")
    str = str.replace("WRITE /.", "logger->add_text( ' ' ).")
    return str

def convert_write_to_logger(str: str) -> str:
    for r in REGEX_WRITE:
      p = re.compile(r, re.S)
      str = p.sub(r'logger->add_text( \1 ).', str)
    return str

def concatenate_parts(str: str) -> str:
    p = re.compile(r'logger->add_text\( ((?:.){0,300}?),((?:.){0,300}?) \)\.', re.S)
    str2 = p.sub(
      r'logger->add_text( \1 && \2 ).', str
    )
    if str2 != str:
      str2 = concatenate_parts(str2)
    return str2

if __name__ == "__main__":
    str = load_file(sys.argv[1])
    str = remove_points_inside_strings(str)
    str = convert_write_to_logger(str)
    str = concatenate_parts(str)
    print(str)
```

Nothing fancy. I don't care. It's meant to be discarded. But it did in seconds what would have taken me an eternity.

If the code is scattered across several programs, includes, methods, etc, you can also use [abapGit][1] to export the whole code all at once and then run the Python program against it. It should work, even if you have to slightly adjust it.

Greetings from Abapinho.

[1]: https://abapgit.org/
