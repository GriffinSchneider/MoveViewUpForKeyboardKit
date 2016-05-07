# MoveViewUpForKeyboardKit [![Version](https://img.shields.io/cocoapods/v/MoveViewUpForKeyboardKit.svg?style=flat)](http://cocoapods.org/pods/MoveViewUpForKeyboardKit) [![Build Status](https://travis-ci.org/GriffinSchneider/MoveViewUpForKeyboardKit.svg)](https://travis-ci.org/GriffinSchneider/MoveViewUpForKeyboardKit)

The eternal battle between iOS developers and the keyboard rages on, and the
keyboard seems poised for victory.

Just Google 'iOS move view for keyboard' and gaze upon the desolation. The
top answers don't call `convertRect`, and the keyboard easily destroys them
all unless their view's bottom happens to be directly at the bottom of the
screen. Apple's documentation doesn't even mention `convertRect`, and so it
too is overrun by the dread keyboard. Many solutions fail miserably under
AutoLayout, and are thusly rendered useless.

But hark! A bright light appears suddenly upon the horizon, and
`MoveViewUpForKeyboardKit` rides fiercely upon a white stallion to join the fray!

`MoveViewUpForKeyboardKit` brutally provides a view that will automatically position
itself at the bottom of its superview or the top of the keyboard, whichever is higher.
With this ultimate weapon against it, the keyboard knows it cannot prevail. In
desperation, the keyboard animates itself with undocumented animation curves, but
`MoveViewUpForKeyboardKit` parrys by matching them perfectly! The keyboard is off balance,
and `MoveViewUpForKeyboardKit` prepares it's coup de grâce. `MoveViewUpForKeyboardKit`
mercilessly handles the case where the keyboard is _already visible_, and keys fly
everywhere as the dread keyboard explodes in a ball of furious hellfire.

## Installation

MoveViewUpForKeyboardKit is available through [CocoaPods](http://cocoapods.org). To install
it, just add the following line to your Podfile:

```ruby
pod MoveViewUpForKeyboardKit
```

## Usage

`MoveViewUpForKeyboardKit` provides a single class, `MVUFKKView`. All you need to do
is put a view of this class in the view hierarchy. `MVUFKKView`s will automatically
do everything required to keep themselves above the keyboard with correct animation.
If the keyboard is not visible, or if it doesn't overlap your view, then the
`MVUFKKView` will position itself (using constraints) at the bottom of its superview.
Once you have a `MVUFKKView`, you can simply use layout constraints to adapt your
layout for the keyboard.
