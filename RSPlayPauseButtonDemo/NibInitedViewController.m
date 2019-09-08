//
//  NibInitedViewController.m
//  RSPlayPauseButtonDemo
//
//  Created by Aaron Jubbal on 9/7/19.
//

#import "NibInitedViewController.h"
#import "RSPlayPauseButton.h"

@interface NibInitedViewController ()

@property (strong, nonatomic) IBOutlet RSPlayPauseButton *playPauseButton;

@end

@implementation NibInitedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.playPauseButton.hasBorderCircle = YES;
    self.playPauseButton.animationStyle = RSPlayPauseButtonAnimationStyleSplitAndRotate;
    self.playPauseButton.tintColor = [UIColor colorWithRed:0.0 green:105.0/255.0 blue:92.0/255.0 alpha:1.0];
}

- (IBAction)playPauseButtonTapped:(RSPlayPauseButton *)sender {
    if ([self.playPauseButton isEqual:sender]) {
        [self.playPauseButton setPaused:!self.playPauseButton.isPaused animated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
