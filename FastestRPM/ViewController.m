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
    
//    // ----- needle moves ---- //
//    CGPoint translation = [sender translationInView:self.view];
//    NSLog(@"Panned: %f x %f", translation.x, translation.y);
//    CGPoint velocity = [sender velocityInView:self.view];
//    float xx = velocity.x;
//    float yy = velocity.y;
//     float speed = needleMovement(xx, yy);
//    [self.needle setTransform:CGAffineTransformMakeRotation(speed/100)];
//    //  ----- ----------
  
    
    

    
}


float needleMovement(float x, float y) {
    NSLog(@"Needle movement: %f, %f", x, y);
    
    float result = ((x + y) / 50);
    
    return result;
}


-(void)rotateNeedle:(UIRotationGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        self.needle.transform = CGAffineTransformRotate(self.needle.transform, 45*M_PI/180);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
