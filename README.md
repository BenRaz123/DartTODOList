# Dart TODO List
## Ben Raz <benraz.dev>

## Overview

TODOList is a simple command-line application that allows you to create, read from, and delete to, a TODO list. 

## How to use

To use this app, `cd` into the `out/` directory and type `./todo`. Then, you can use your cursor to read to, write to, and delete to the TODO list.

## How to edit

To run the program, run `dart run todo.dart`. To compile, write `dart compile exe todo.dart` to get a standalone executable.

## How it works

The TODO list works by creating a `data.txt` file which it reads and wrights to. This sort of database allows the app to remember your TODO items even when closed.

## Open Issues

Something that is desired at the moment is to encrypt the `data.txt` file so that it is not malicously hacked. This can be done with something like `gpg`. This is low priority, however. 
