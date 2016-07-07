//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"

@interface LPGViewController ()

@property (nonatomic)IBOutlet UIImageView *petImageView;
@property (nonatomic)IBOutlet UIImageView *appleImageView;
@property Pet *myPet;

@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
//    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
//    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    self.petImageView.image = [UIImage imageNamed:@"default"];
//    
//    [self.view addSubview:self.petImageView];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
//                                                          attribute:NSLayoutAttributeCenterX
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterX
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
//                                                          attribute:NSLayoutAttributeCenterY
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterY
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//    
    
    self.myPet = [[Pet alloc] init];
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
}

- (IBAction)pettingPanGesture:(UIPanGestureRecognizer *)panGesture {
    //    NSLog(@"Pan gesture happened");
//    UIPanGestureRecognizer *panGesture = sender;
    
    CGPoint panVelocity;
    
    switch (panGesture.state) {

        case UIGestureRecognizerStateBegan:
            NSLog(@"petting began");
            break;
            
        case UIGestureRecognizerStateChanged:
            NSLog(@"petting pan changed %f", [panGesture locationInView:self.view].x);
            break;
            
        case UIGestureRecognizerStateEnded:
//            [panGesture locationInView:self.view];
            panVelocity = [panGesture velocityInView:self.view];
            [self.myPet gettingPettingVelocity:panVelocity];
            self.petImageView.image = self.myPet.petImage;
            NSLog(@"pan ended");
            break;

        default:
            break;
    }

}

- (IBAction)pinchingAppleGesture:(id)sender {

    UIPinchGestureRecognizer *pinchGesture = sender;
    
    switch (pinchGesture.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"Pinching strated.");
            break;
            
        case UIGestureRecognizerStateChanged: {
            CGPoint finger1Location = [sender locationOfTouch:0 inView:self.view];
            self.appleImageView.center = finger1Location;
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
//            NSLog(@"Pinching gesture changed %f.", [pinchGesture locationInView:self.appleImageView].x);
            CGPoint finger1Location = [sender locationOfTouch:0 inView:self.view];
            if ((100 < finger1Location.x && finger1Location.x < 300) && (300 < finger1Location.y && finger1Location.y < 385))
            {
                self.petImageView.image = [UIImage imageNamed:@"sleeping"];
            } else {
                [UIView animateWithDuration:1.0
                                 animations:^{
                                     self.appleImageView.center = CGPointMake(self.appleImageView.center.x, self.appleImageView.center.y + 900.0);
                                 }];
            }
            break;
        }
            
        default:
            break;
        
    }
    
}






@end
