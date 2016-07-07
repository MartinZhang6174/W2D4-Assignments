//
//  Pet.m
//  Phonagotchi
//
//  Created by Martin Zhang on 2016-07-07.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet

//- (IBAction):(id)sender)

- (void) gettingPettingVelocity:(CGPoint)pettingVelocity
{
    if (pettingVelocity.x > 700 || pettingVelocity.x < -700) {
        _isGrumpyOrNot = true;
        self.petImage = [UIImage imageNamed:@"grumpy"];
    } else {
        _isGrumpyOrNot = false;
        self.petImage = [UIImage imageNamed:@"default"];
    }
}


@end
