//
//  Pet.m
//  Phonagotchi
//
//  Created by Martin Zhang on 2016-07-07.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet

- (void) gettingGestureVelocity:(CGPoint)gestureVelocity {
    if (gestureVelocity.x > 500 || gestureVelocity.x < -500) {
        self.petImage = [UIImage imageNamed:@"grumpy"];
    } else {
        self.petImage = [UIImage imageNamed:@"sleeping"];
    }
}

@end
