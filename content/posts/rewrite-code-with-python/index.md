---
slug: split-loop
title: Usa Python para reescrever código ABAP
description: rewrite-code-with-python
date: 2022-08-01T09:00:00Z
tags: [sapgui, python]
categories: [artigo]
keywords: [python for ABAP]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando é preciso fazer alterações de fundo ao código o IDE do SAPGui não ajuda. O Eclipse ADT já é bem melhor mas mesmo assim há muitas alterações que essas ferramentas não conseguem automatizar. Nomeadamente alterações que têm de ser feitas centenas de vezes e que não se conseguem fazer com um simples _find and replace_.  Nesses casos o mais normal é acabar por fazer tudo à mão.

<!--more-->

## Automatiza

Mas não tem de ser assim. No outro dia aconteceu-me uma dessas: precisei de modernizar algum código num programa muito antigo. Decidi criar um pequeno programa em Python para fazer as alterações por mim.

Não só é mais rápido como é mais seguro e também mais divertido.

Aqui está um fluxograma a descrever o que fiz:

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

## Exemplo

Temos um report antigo que usa `WRITE` para escrever os resultados e queremos que passe a escrevê-los para o _Application Log_.

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

Como podes ver, _find and replace_ não chegaria. E por isso desenvolvi um programinha Python para o fazer por mim. Não sou muito experiente em Python mas não é preciso. É simples e divertido. Fui iterando e verificando o ABAP resultante até obter o que queria. No fim ficou isto:

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

Não é nada do outro mundo mas faz em segundos aquilo que me teria demorado horas e com uma enorme probabilidade de me enganar.

Se o código a alterar estiver espalhado por vários programas, includes, métodos, etc, podes usar o [abapGit][1] para exportar o código todo para um XML e aplicar o programa a esse XML ao invés. Deverá funcionar à mesma, mais coisas menos coisa.

O Abapinho saúda-vos.

[1]: https://abapgit.org/
