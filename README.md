# RSPlayPauseButton

A `UIControl` with a play/pause icon that nicely morphs between the two.

![RSPlayPauseButton Morph Animation](https://raw.githubusercontent.com/raphaelschaad/RSPlayPauseButton/master/Images/rsplaypausebutton-morph-animation.gif)

You can choose from [two morphing styles](http://vimeo.com/raphaelschaad/rsplaypausebutton): Split, and Split & Rotate.

If using CocoaPods, the quickest way to try it out is to type this on the command line:

```shell
$ pod try RSPlayPauseButton
```

To add it to your app, copy the class `RSPlayPauseButton.h/.m` into your Xcode project or add via [CocoaPods](http://cocoapods.org) by adding this to your Podfile:

```ruby
pod 'RSPlayPauseButton', '~> 1.0'
```

In your code, `#import "RSPlayPauseButton.h"`, create the control, and setup an action to toggle it:

```objective-c
	// ... e.g. in `-viewDidLoad:` ...
    RSPlayPauseButton *playPauseButton = [[RSPlayPauseButton alloc] init];
    [playPauseButton addTarget:self action:@selector(playPauseButtonDidPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playPauseButton];
}

- (void)playPauseButtonDidPress:(RSPlayPauseButton *)playPauseButton {
    [playPauseButton setPaused:!playPauseButton.isPaused animated:YES];
}
```

Since I release RSPlayPauseButton as free and unencumbered software into the public domain you can do with it whatever you want including using it in any app on the App Store. I released this code originally as a [Gist in early 2014](https://gist.github.com/raphaelschaad/9734463) and since then [Google adopted the Split style](http://littlebigdetails.com/post/119360573466/youtube-the-play-button-smoothly-animates-into) In mid-2015 on YouTube.com.

Feel free to reach out to [@RaphaelSchaad](https://twitter.com/raphaelschaad) and say hi.
