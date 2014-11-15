Pod::Spec.new do |spec|
  spec.name             = "RSPlayPauseButton"
  spec.version          = "1.0.0"
  spec.summary          = "Play/pause button that nicely morphs between the two states"
  spec.description      = <<-DESC
                        A UIControl with a play/pause icon that nicely morphs between the two.
                        You can choose from [two morphing styles](http://vimeo.com/raphaelschaad/rsplaypausebutton): Split, and Split & Rotate.
                        DESC

  spec.homepage         = "https://github.com/raphaelschaad/RSPlayPauseButton"
  spec.screenshots      = "https://raw.githubusercontent.com/raphaelschaad/RSPlayPauseButton/master/Images/rsplaypausebutton-morph-animation.gif"
  spec.license          = { :type => "Public domain", :file => "LICENSE.md" }
  spec.author           = { "Raphael Schaad" => "raphael.schaad@gmail.com" }
  spec.social_media_url = "https://twitter.com/raphaelschaad"
  spec.platform         = :ios, "7.0"
  spec.source           = { :git => "https://github.com/raphaelschaad/RSPlayPauseButton.git", :tag => "1.0.0" }
  spec.source_files     = "RSPlayPauseButtonDemo/RSPlayPauseButton", "RSPlayPauseButtonDemo/RSPlayPauseButton/**/*.{h,m}"
  spec.requires_arc     = true
end
