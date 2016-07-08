//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "Pet.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (strong, nonatomic) IBOutlet UIImageView *petPicView;
@property (strong, nonatomic) IBOutlet UIImageView *appleView;
@property Pet *myPet;
@property (nonatomic) CGRect appleFrame;

@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.appleView.translatesAutoresizingMaskIntoConstraints = NO;

    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
//    [self.view addSubview:self.petImageView];
    
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
    self.myPet = [[Pet alloc] init];
    self.petPicView.image = self.petImageView.image;
}

- (IBAction)panGesture:(id)sender {
    
    CGPoint gestureVelocity;
    
    UIGestureRecognizer *panGesture = sender;
    
    switch (panGesture.state) {
            
        case UIGestureRecognizerStateBegan:
            NSLog(@"The pan gesture began.");
            break;
        case UIGestureRecognizerStateChanged:
            NSLog(@"The gesture is changed %f", [panGesture locationInView:self.petImageView].x);
        case UIGestureRecognizerStateEnded:{
            gestureVelocity = [sender velocityInView:self.view];
            NSLog(@"The ban gesture's velocity is %f.", gestureVelocity.x);
            [self.myPet gettingGestureVelocity:gestureVelocity];
            self.petPicView.image = self.myPet.petImage;
            NSLog(@"Gesture ended");
        }
            
        default:
            break;
    }
    
}

- (IBAction)pinchGesture:(id)sender {
    UIGestureRecognizer *pinchingGesture = sender;
    
    CGPoint fingerPosition;
    
    switch (pinchingGesture.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"The pinching started");
            self.appleView.alpha = 1;
            break;
        case UIGestureRecognizerStateChanged:
        {
            NSLog(@"The pinching state has changed");
            fingerPosition.x = [pinchingGesture locationOfTouch:0 inView:self.view].x;
            fingerPosition.y = [pinchingGesture locationOfTouch:0 inView:self.view].y;
            self.appleView.center = fingerPosition;
            break;
        }
        case UIGestureRecognizerStateEnded:
            NSLog(@"The pinching ended");
            
            if (CGRectIntersectsRect(self.appleView.frame, self.petPicView.frame)) {
                self.petPicView.image = [UIImage imageNamed:@"sleeping"];
                [UIView animateWithDuration:0.5 animations:^{
                    self.appleView.alpha = 0;
                }];
            } else {
                self.petPicView.image = [UIImage imageNamed:@"grumpy"];
                [UIView animateWithDuration:1.5
                                 animations:^{
                                     self.appleView.center = CGPointMake(self.appleView.center.x, self.appleView.center.y + 500);
                                 }];
                break;
            }
//            NSLog(@"pos : 0%f, %f",[pinchingGesture locationOfTouch:0 inView:self.view].x,[pinchingGesture locationOfTouch:0 inView:self.view].y);
        default:
            
            break;
    }
}
@end
