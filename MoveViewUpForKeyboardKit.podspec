# coding: utf-8
Pod::Spec.new do |s|
  s.name             = "MoveViewUpForKeyboardKit"
  s.version          = "2.0.0"
  s.summary          = "MVUFKKit provides a view that will automatically move itself up for the keyboard."
  s.description      = %{
      The eternal battle between iOS developers and the keyboard rages on, and the
      keyboard seems poised for victory.

      Just Google 'iOS move view for keyboard' and gaze upon the desolation. The
      top answers don't call `convertRect`, and the keyboard easily destroys them
      all unless their view's bottom happens to be directly at the bottom of the
      screen. Apple's documentation doesn't even mention 'convertRect', and so it
      too is overrun by the dread keyboard. Many solutions fail miserably under
      AutoLayout, and are thusly rendered useless.

      But hark! A bright light appears suddenly upon the horizon, and
      MoveViewUpForKeyboardKit rides fiercely upon a white stallion to join the fray!

      MoveViewUpForKeyboardKit brutally provides a view that will automatically position
      itself at the bottom of its superview or the top of the keyboard, whichever is higher.
      With this ultimate weapon against it, the keyboard knows it cannot prevail. In
      desperation, the keyboard animates itself with undocumented animation curves, but
      MoveViewUpForKeyboardKit parrys by matching them perfectly! The keybaord is off balance,
      and MoveViewUpForKeyboardKit prepares it's coup de grâce. MoveViewUpForKeyboardKit
      mercilessly handles the case where the keyboard is _already visible_, and keys fly
      everywhere as the dread keyboard explodes in a ball of furious hellfire.
  }
  s.homepage         = "https://github.com/GriffinSchneider/MoveViewUpForKeyboardKit"
  s.license          = {:type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { "Griffin Schneider" => "griffinschneider@gmail.com" }
  s.source           = { :git => "https://github.com/GriffinSchneider/MoveViewUpForKeyboardKit.git", :tag => s.version.to_s }
    
  s.ios.frameworks = 'Foundation', 'UIKit'

  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.source_files = 'MoveViewUpForKeyboardKit/' + '*.{h,m}'
end
