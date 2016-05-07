//
//  ViewController.m
//  RSPlayPauseButtonDemo
//
//  Created by Raphael Schaad on 11/13/14.
//
//


#import "ViewController.h"
#import "RSPlayPauseButton.h"


@interface ViewController ()

@property (nonatomic, strong) RSPlayPauseButton *playPauseButton;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end


@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.playPauseButton) {
        self.playPauseButton = [[RSPlayPauseButton alloc] init];
        self.playPauseButton.hasBorderCircle = YES;
        self.playPauseButton.tintColor = [UIColor colorWithRed:0.0 green:105.0/255.0 blue:92.0/255.0 alpha:1.0];
        [self.playPauseButton addTarget:self action:@selector(playPauseButtonDidPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view addSubview:self.playPauseButton];
    
    if (!self.label) {
        self.label = [[UILabel alloc] init];
        self.label.font = [UIFont boldSystemFontOfSize:11.0];
        self.label.textColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        self.label.text = @"ANIMATION STYLE";
    }
    [self.view addSubview:self.label];
    
    if (!self.segmentedControl) {
        self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"None", @"Split", @"Split & Rotate"]];
        self.segmentedControl.selectedSegmentIndex = 0;
        [self.segmentedControl addTarget:self action:@selector(segmentedControlDidChangeValue:) forControlEvents:UIControlEventValueChanged];
    }
    [self.view addSubview:self.segmentedControl];
}


- (void)viewDidLayoutSubviews
{
    [self.playPauseButton sizeToFit];
    self.playPauseButton.center = self.view.center;
    
    [self.label sizeToFit];
    CGRect labelFrame = self.label.frame;
    labelFrame.origin.x = floor((self.view.bounds.size.width - labelFrame.size.width) / 2);
    labelFrame.origin.y = self.view.bounds.origin.y + 20.0;
    self.label.frame = labelFrame;
    
    [self.segmentedControl sizeToFit];
    CGRect segmentedControlFrame = self.segmentedControl.frame;
    segmentedControlFrame.origin.x = floor((self.view.bounds.size.width - segmentedControlFrame.size.width) / 2);
    segmentedControlFrame.origin.y = CGRectGetMaxY(self.label.frame) + 8.0;
    self.segmentedControl.frame = segmentedControlFrame;
}


#pragma mark - Actions

- (void)playPauseButtonDidPress:(id)sender
{
    if ([self.playPauseButton isEqual:sender]) {
        BOOL animated = self.segmentedControl.selectedSegmentIndex != 0;
        [self.playPauseButton setPaused:!self.playPauseButton.isPaused animated:animated];
    }
}


- (void)segmentedControlDidChangeValue:(id)sender
{
    if ([self.segmentedControl isEqual:sender]) {
        if (self.segmentedControl.selectedSegmentIndex == 1) {
            self.playPauseButton.animationStyle = RSPlayPauseButtonAnimationStyleSplit;
        } else if (self.segmentedControl.selectedSegmentIndex == 2) {
            self.playPauseButton.animationStyle = RSPlayPauseButtonAnimationStyleSplitAndRotate;
        }
    }
}


#pragma mark - Status Bar

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
