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
    
//    float startingPoinfloat velocity = sqrtf( pow(velocityInCGPoint.x,2) + pow(velocityInCGPoint.y,2) );t = 0.0;
    
//    CGPoint translation = [sender translationInView:self.view];
//    NSLog(@"Panned: %f & %f", translation.x, translation.y);
    
//        [self.needle setTransform:CGAffineTransformMakeRotation((startingPoint * translation.x) * (startingPoint * translation.y))];

//    CGPoint translation = [sender translationInView:self.view];
//        NSLog(@"Panned: %f & %f", translation.x, translation.y);
//
    
    CGPoint velocityCollected = [sender velocityInView:self.view];
    float velocity = sqrtf(pow(velocityCollected.x, 2) + pow(velocityCollected.y, 2));
    
    
    NSLog(@"velocity x: %f velocity y: %f", velocityCollected.x, velocityCollected.y);
    NSLog(@"Total velocity: %f", velocity);
    
    float newPercentOfSpinner = velocity / 5000;
    if (newPercentOfSpinner > 1) {
        newPercentOfSpinner = 1;
    }
    NSLog(@"New percent of spinner: %f", newPercentOfSpinner);
    
    
    [self.needle setTransform:CGAffineTransformMakeRotation(newPercentOfSpinner)];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.needle.transform = CGAffineTransformMakeRotation(M_PI/180*((newPercentOfSpinner*360)-320));
    }];
    /*
    if (self.panGesture.state == UIGestureRecognizerStateEnded || self.panGesture.state == UIGestureRecognizerStateCancelled || self.panGesture.state == UIGestureRecognizerStateFailed) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(cancelTimer:) userInfo:nil repeats:NO];
    }   */
    
    //    CGPoint velocity = [sender velocityInView:self.view];
//        NSLog(@"Velocity: %f & %f", velocity.x, velocity.y);
//
    
    
//    float needleMove = (translation.x * velocity.x) * (translation.y * velocity.y);
//    NSLog(@"Needle Move: %f", needleMove);
//    
//    [self.needle setTransform:CGAffineTransformMakeRotation(needleMove/50)];
    
    // ----- needle moves ---- //
//    CGPoint translation = [sender translationInView:self.view];
    
    // // // NSLog(@"Panned: %f x %f", velocity.x, velocity.y);
    
//    CGPoint velocity = [sender velocityInView:self.view];
//    float xx = velocity.x;
//    float yy = velocity.y;
//     float speed = needleMovement(xx, yy);
    
    // // // [self.needle setTransform:CGAffineTransformMakeRotation((velocity.x + velocity.y)/5000)];
    //  ----- ---------- //

    
//    -(void)
    
//    CGPoint startLocation = [sender locationInView:self.view];
//    CGPoint currentLocation = [sender locationInView:self.view];
//    CGFloat xx = currentLocation.x *
    
    

    
}


//float needleMovement(float x, float y) {
//    NSLog(@"Needle movement: %f, %f", x, y);
//    
//    float result = ((x + y) + 250);
//    
//    return result;
//}

//+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;



//-(void)rotateNeedle:(UIRotationGestureRecognizer *)recognizer{
//    if (recognizer.state == UIGestureRecognizerStateEnded) {
//        self.needle.transform = CGAffineTransformRotate(self.needle.transform, 45*M_PI/180);
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
