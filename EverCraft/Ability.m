//
//  Ability.m
//  EverCraft
//
//  Created by BJ Miller on 1/7/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import "Ability.h"

@implementation Ability

- (instancetype)init {
    if (self = [super init]) {
        _score = 10;
    }
    return self;
}

-(void)setScore:(NSInteger)score {
    self.modifier = (floor(score/2) - 5);
    _score = score;
}

@end
