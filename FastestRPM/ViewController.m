//
//  ViewController.m
//  FastestRPM
//
//  Created by Darah on 2015-08-13.
//  Copyright (c) 2015 Darah Joseph. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *needle;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.autoresizesSubviews=NO;
    self.needle.transform = CGAffineTransformRotate(self.needle.transform, 45*M_PI/180);
    
    UIPanGestureRecognizer *panning = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:panning];
    
    
}

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    
    
    CGPoint velocityCollected = [sender velocityInView:self.view];
    float velocity = sqrtf(pow(velocityCollected.x, 2) + pow(velocityCollected.y, 2));
    
    
    NSLog(@"velocity x: %f velocity y: %f", velocityCollected.x, velocityCollected.y);
    NSLog(@"Total velocity: %f", velocity);
    
    float newSpinnerPercentage = velocity / 5000;
    if (newSpinnerPercentage > 1) {
        newSpinnerPercentage = 1;
    }
    NSLog(@"New percent of spinner: %f", newSpinnerPercentage);
    
    
    [UIView animateWithDuration:0.2 animations:^{
        self.needle.transform = CGAffineTransformMakeRotation(M_PI/180*((newSpinnerPercentage*270)+40));
    }];
    
    if (sender.state == UIGestureRecognizerStateEnded ) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(cancelTimer:) userInfo:nil repeats:NO];
    }
}
    -(void)cancelTimer:(NSTimer *)timer {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.needle.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 45*M_PI/180);
        } completion:nil];
    }
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        
    }
    
    @end
