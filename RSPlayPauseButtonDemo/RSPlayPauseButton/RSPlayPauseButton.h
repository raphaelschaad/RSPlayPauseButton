//
//  RSPlayPauseButton.h
//
//  Created by Raphael Schaad on 2014-03-22.
//  This is free and unencumbered software released into the public domain.
//


#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, RSPlayPauseButtonAnimationStyle) {
    RSPlayPauseButtonAnimationStyleSplit, // Default
    RSPlayPauseButtonAnimationStyleSplitAndRotate
};


//
//  Displays a  ⃝ with either the ► (play) or ❚❚ (pause) icon and nicely morphs between the two states.
//  It's targeted at iOS 8.1+ and is tintColor-aware.
//
@interface RSPlayPauseButton : UIControl

// State
@property (nonatomic, assign, getter = isPaused) BOOL paused; // Default is `YES`; setting this property doesn't animate the change
- (void)setPaused:(BOOL)paused animated:(BOOL)animated;

// Style
@property (nonatomic, assign) RSPlayPauseButtonAnimationStyle animationStyle; // Default is `RSPlayPauseButtonAnimationStyleSplit`

@end
