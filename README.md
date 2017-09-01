# Onu!

Play Onu: Easy to Learn, But Easy to Master! <sup>tm</sup>

If you want to play Onu, you're probably in the wrong place! This is for development and stuff. Officially hosted website will be added soon!

# Setting up a development environment

## Prerequisites

Install this stuff.

* Make (Yeah, the really old one. Gulp sucks. Yes, you too, grunt)
* Elm Platform (alright, alright, you only need `elm-make`, but just get the whole thing, will you?)
* Sass. i don't care what version of it you get, just something in your `$PATH`. It's not rocket science

## Building

Run `make`. That's easier than gulp, now isn't it? And you didn't even need node! And it won't build unmodified files!

The first time you build, it will prompt you to install the elm dependencies. Hit enter and it should be fine. It will run non-interactively after that (unless we add extra dependencies)

## Playing

Just visit `public/index.html` in your browser of choice.