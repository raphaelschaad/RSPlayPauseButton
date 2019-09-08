//
//  RSPlayPauseButton.m
//
//  Created by Raphael Schaad https://github.com/raphaelschaad on 2014-03-22.
//  This is free and unencumbered software released into the public domain.
//


#import "RSPlayPauseButton.h"
#include <tgmath.h> // type generic math, yo: http://en.wikipedia.org/wiki/Tgmath.h#tgmath.h


@interface RSPlayPauseButton () {
    CGFloat kScale;
    CGFloat kBorderSize;
    CGFloat kBorderWidth;
    CGFloat kSizederWidth;
    CGFloat kSize;
    CGFloat kPauseLineWidth;
    CGFloat kPauseLineHeight;
    CGFloat kPauseLinesSpace;
    CGFloat kPlayTriangleOffsetX;
    CGFloat kPlayTriangleTipOffsetX;
    
    CGPoint p1, p2, p3, p4, p5, p6, p7, p8;
    
}

@property (nonatomic, strong) CAShapeLayer *borderShapeLayer;
@property (nonatomic, strong) CAShapeLayer *playPauseShapeLayer;
@property (nonatomic, strong, readonly) UIBezierPath *pauseBezierPath;
@property (nonatomic, strong, readonly) UIBezierPath *pauseRotateBezierPath;
@property (nonatomic, strong, readonly) UIBezierPath *playBezierPath;
@property (nonatomic, strong, readonly) UIBezierPath *playRotateBezierPath;

@end


@implementation RSPlayPauseButton

#pragma mark - Accessors
#pragma mark Public

- (void)setPaused:(BOOL)paused
{
    if (_paused != paused) {
        [self setPaused:paused animated:NO];
    }
}


#pragma mark Private

@synthesize pauseBezierPath = _pauseBezierPath;

- (UIBezierPath *)pauseBezierPath
{
    if (!_pauseBezierPath) {
        _pauseBezierPath = [UIBezierPath bezierPath];
        
        // Subpath for 1. line
        [_pauseBezierPath moveToPoint:p1];
        [_pauseBezierPath addLineToPoint:p2];
        [_pauseBezierPath addLineToPoint:p3];
        [_pauseBezierPath addLineToPoint:p4];
        [_pauseBezierPath closePath];
        
        // Subpath for 2. line
        [_pauseBezierPath moveToPoint:p5];
        [_pauseBezierPath addLineToPoint:p6];
        [_pauseBezierPath addLineToPoint:p7];
        [_pauseBezierPath addLineToPoint:p8];
        [_pauseBezierPath closePath];
    }
    
    return _pauseBezierPath;
}


@synthesize pauseRotateBezierPath = _pauseRotateBezierPath;

- (UIBezierPath *)pauseRotateBezierPath
{
    if (!_pauseRotateBezierPath) {
        _pauseRotateBezierPath = [UIBezierPath bezierPath];
        
        // Subpath for 1. line
        [_pauseRotateBezierPath moveToPoint:p7];
        [_pauseRotateBezierPath addLineToPoint:p8];
        [_pauseRotateBezierPath addLineToPoint:p5];
        [_pauseRotateBezierPath addLineToPoint:p6];
        [_pauseRotateBezierPath closePath];
        
        // Subpath for 2. line
        [_pauseRotateBezierPath moveToPoint:p3];
        [_pauseRotateBezierPath addLineToPoint:p4];
        [_pauseRotateBezierPath addLineToPoint:p1];
        [_pauseRotateBezierPath addLineToPoint:p2];
        [_pauseRotateBezierPath closePath];
    }
    
    return _pauseRotateBezierPath;
}


@synthesize playBezierPath = _playBezierPath;

- (UIBezierPath *)playBezierPath
{
    if (!_playBezierPath) {
        _playBezierPath = [UIBezierPath bezierPath];
        
        const CGFloat kPauseLinesHalfSpace = floor(kPauseLinesSpace / 2);
        const CGFloat kPauseLineHalfHeight = floor(kPauseLineHeight / 2);
        
        CGPoint _p1 = CGPointMake(p1.x + kPlayTriangleOffsetX, p1.y);
        CGPoint _p2 = CGPointMake(p2.x + kPauseLinesHalfSpace, p2.y);
        CGPoint _p3 = CGPointMake(p3.x + kPauseLinesHalfSpace, p3.y);
        CGPoint _p4 = CGPointMake(p4.x + kPlayTriangleOffsetX, p4.y);
        
        CGPoint _p5 = CGPointMake(p5.x - kPauseLinesHalfSpace, p5.y);
        CGPoint _p6 = CGPointMake(p6.x + kPlayTriangleTipOffsetX, p6.y);
        CGPoint _p7 = CGPointMake(p7.x + kPlayTriangleTipOffsetX, p7.y);
        CGPoint _p8 = CGPointMake(p8.x - kPauseLinesHalfSpace, p8.y);
        
        const CGFloat kPlayTriangleWidth = _p6.x - _p1.x;
        
        _p2.y += kPauseLineHalfHeight * (_p2.x - kPlayTriangleOffsetX) / kPlayTriangleWidth;
        _p3.y -= kPauseLineHalfHeight * (_p3.x - kPlayTriangleOffsetX) / kPlayTriangleWidth;
        
        _p5.y += kPauseLineHalfHeight * (_p5.x - kPlayTriangleOffsetX) / kPlayTriangleWidth;
        
        _p6.y = kPauseLineHalfHeight;
        _p7.y = kPauseLineHalfHeight;
        
        _p8.y -= kPauseLineHalfHeight * (_p8.x - kPlayTriangleOffsetX) / kPlayTriangleWidth;
        
        [_playBezierPath moveToPoint:_p1];
        [_playBezierPath addLineToPoint:_p2];
        [_playBezierPath addLineToPoint:_p3];
        [_playBezierPath addLineToPoint:_p4];
        [_playBezierPath closePath];
        
        [_playBezierPath moveToPoint:_p5];
        [_playBezierPath addLineToPoint:_p6];
        [_playBezierPath addLineToPoint:_p7];
        [_playBezierPath addLineToPoint:_p8];
        [_playBezierPath closePath];
    }
    
    return _playBezierPath;
}


@synthesize playRotateBezierPath = _playRotateBezierPath;

- (UIBezierPath *)playRotateBezierPath
{
    if (!_playRotateBezierPath) {
        _playRotateBezierPath = [UIBezierPath bezierPath];
        
        const CGFloat kPauseLineHalfHeight = floor(kPauseLineHeight / 2);
        
        CGPoint _p1, _p2, _p3, _p4, _p5, _p6, _p7, _p8;
        _p1 = _p2 = _p5 = _p6 = CGPointMake(p6.x + kPlayTriangleTipOffsetX, kPauseLineHalfHeight);
        _p3 = _p8 = CGPointMake(p1.x + kPlayTriangleOffsetX, kPauseLineHalfHeight);
        _p4 = CGPointMake(p1.x + kPlayTriangleOffsetX, p1.y);
        _p7 = CGPointMake(p4.x + kPlayTriangleOffsetX, p4.y);
        
        [_playRotateBezierPath moveToPoint:_p1];
        [_playRotateBezierPath addLineToPoint:_p2];
        [_playRotateBezierPath addLineToPoint:_p3];
        [_playRotateBezierPath addLineToPoint:_p4];
        [_playRotateBezierPath closePath];
        
        [_playRotateBezierPath moveToPoint:_p5];
        [_playRotateBezierPath addLineToPoint:_p6];
        [_playRotateBezierPath addLineToPoint:_p7];
        [_playRotateBezierPath addLineToPoint:_p8];
        [_playRotateBezierPath closePath];
    }
    
    return _playRotateBezierPath;
}


#pragma mark - Life Cycle

- (instancetype)initWithSideLength:(CGFloat)length {
    return [self initWithFrame:CGRectMake(0, 0, length, length)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    NSAssert(frame.size.width == frame.size.height, @"Frame size width and height must be equal!");
    self = [super initWithFrame:frame];
    if (self) {
        _paused = YES;
                
        kScale = frame.size.width / 35.0;
        kBorderSize = 32.0 * kScale;
        kBorderWidth = 3.0 * kScale;
        kSize = kBorderSize + kBorderWidth; // The total size is the border size + 2x half the border width.
        kPauseLineWidth = 4.0 * kScale;
        kPauseLineHeight = 15.0 * kScale;
        kPauseLinesSpace = 4.0 * kScale;
        kPlayTriangleOffsetX = 2.0 * kScale;
        kPlayTriangleTipOffsetX = 2.0 * kScale;
        
        p1 = CGPointMake(0.0, 0.0);                          // line 1, top left
        p2 = CGPointMake(kPauseLineWidth, 0.0);              // line 1, top right
        p3 = CGPointMake(kPauseLineWidth, kPauseLineHeight); // line 1, bottom right
        p4 = CGPointMake(0.0, kPauseLineHeight);             // line 1, bottom left
        p5 = CGPointMake(kPauseLineWidth + kPauseLinesSpace, 0.0);                                // line 2, top left
        p6 = CGPointMake(kPauseLineWidth + kPauseLinesSpace + kPauseLineWidth, 0.0);              // line 2, top right
        p7 = CGPointMake(kPauseLineWidth + kPauseLinesSpace + kPauseLineWidth, kPauseLineHeight); // line 2, bottom right
        p8 = CGPointMake(kPauseLineWidth + kPauseLinesSpace, kPauseLineHeight);                   // line 2, bottom left
    }
    return self;
}


#pragma mark - UIView Method Overrides
#pragma mark Configuring a View's Visual Appearance

- (void)tintColorDidChange
{
    // Refresh view rendering when system calls this method with a changed tint color.
    [self setNeedsLayout];
}


#pragma mark Configuring the Resizing Behavior

- (CGSize)sizeThatFits:(CGSize)size
{
    // Ignore the current size/new size by super and instead use our default size.
    return [super sizeThatFits:size];
}


#pragma mark Laying out Subviews

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (self.hasBorderCircle) {
        if (!self.borderShapeLayer) {
            self.borderShapeLayer = [[CAShapeLayer alloc] init];
            // Adjust for line width.
            CGRect borderRect = CGRectInset(self.bounds, ceil(kBorderWidth / 2), ceil(kBorderWidth / 2));
            self.borderShapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:borderRect].CGPath;
            self.borderShapeLayer.lineWidth = kBorderWidth;
            self.borderShapeLayer.fillColor = [UIColor clearColor].CGColor;
            [self.layer addSublayer:self.borderShapeLayer];
        }
        self.borderShapeLayer.strokeColor = self.fillColor.CGColor ? self.fillColor.CGColor : self.tintColor.CGColor;
    }
    
    if (!self.playPauseShapeLayer) {
        self.playPauseShapeLayer = [[CAShapeLayer alloc] init];
        CGRect playPauseRect = CGRectZero;
        playPauseRect.origin.x = floor(((self.bounds.size.width) - (kPauseLineWidth + kPauseLinesSpace + kPauseLineWidth)) / 2);
        playPauseRect.origin.y = floor(((self.bounds.size.height) - (kPauseLineHeight)) / 2);
        playPauseRect.size.width = kPauseLineWidth + kPauseLinesSpace + kPauseLineWidth + kPlayTriangleTipOffsetX;
        playPauseRect.size.height = kPauseLineHeight;
        self.playPauseShapeLayer.frame = playPauseRect;
        UIBezierPath *path = self.isPaused ? self.playRotateBezierPath : self.pauseBezierPath;
        self.playPauseShapeLayer.path = path.CGPath;
        [self.layer addSublayer:self.playPauseShapeLayer];
    }
    self.playPauseShapeLayer.fillColor = self.fillColor.CGColor ? self.fillColor.CGColor : self.tintColor.CGColor;
}


#pragma mark - Public Methods

- (void)setPaused:(BOOL)paused animated:(BOOL)animated
{
    if (_paused != paused) {
        _paused = paused;
        
        UIBezierPath *fromPath = nil;
        UIBezierPath *toPath = nil;
        if (self.animationStyle == RSPlayPauseButtonAnimationStyleSplit) {
            fromPath = self.isPaused ? self.pauseBezierPath : self.playBezierPath;
            toPath = self.isPaused ? self.playBezierPath : self.pauseBezierPath;
        } else if (self.animationStyle == RSPlayPauseButtonAnimationStyleSplitAndRotate) {
            fromPath = self.isPaused ? self.pauseBezierPath : self.playRotateBezierPath;
            toPath = self.isPaused ? self.playRotateBezierPath : self.pauseRotateBezierPath;
        } else {
            // Unsupported animation style -- fall back to using default animation style's "to path" but don't animate to it.
            toPath = self.isPaused ? self.playBezierPath : self.pauseBezierPath;
            animated = NO;
        }
        
        NSString * const kMorphAnimationKey = @"morphAnimationKey";
        if (animated) {
            // Morph between the two states.
            CABasicAnimation *morphAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
            
            CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [morphAnimation setTimingFunction:timingFunction];
            
            // Make the new state stick.
            [morphAnimation setRemovedOnCompletion:NO];
            [morphAnimation setFillMode:kCAFillModeForwards];
            
            morphAnimation.duration = 0.3;
            morphAnimation.fromValue = (__bridge id)fromPath.CGPath;
            morphAnimation.toValue = (__bridge id)toPath.CGPath;
            
            [self.playPauseShapeLayer addAnimation:morphAnimation forKey:kMorphAnimationKey];
        } else {
            // Clear out potential existing morph animations.
            [self.playPauseShapeLayer removeAnimationForKey:kMorphAnimationKey];
            
            // Snap to new state.
            self.playPauseShapeLayer.path = toPath.CGPath;
        }
    }
}


@end
