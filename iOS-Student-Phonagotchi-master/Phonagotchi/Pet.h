//
//  Pet.h
//  Phonagotchi
//
//  Created by Martin Zhang on 2016-07-07.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property BOOL isGrumpyOrNot;
@property UIImage *petImage;

- (void)gettingGestureVelocity:(CGPoint)gestureVelocity;

@end
