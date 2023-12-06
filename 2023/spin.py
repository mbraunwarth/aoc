#!/usr/bin/python
#
# Spin the wheel to select a programming language

import random

langs = [ 
  'Python', 
  'Haskell',
  'Racket',
  'Nim',
  'OCaml',
  'Go',
  'Lua',
  'Elixir',
  'Prolog?',
  'C',
  'Ruby',
  #'Scala',
  'Rust',
  'PHP',
  'Java',
  'JavaScript',
  'Octave',
  'Erlang',
  'Julia',
  'Zig',
  'Crystal',
  'Kotlin',
  'Perl',
  'Common Lisp'
]

print(random.choice(langs))
