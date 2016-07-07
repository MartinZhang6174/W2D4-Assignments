//
//  Pet.h
//  Phonagotchi
//
//  Created by Martin Zhang on 2016-07-07.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic, readonly) BOOL isGrumpyOrNot;
@property (nonatomic) UIImage *petImage;

- (void) gettingPettingVelocity:(CGPoint)pettingVelocity;


@end
