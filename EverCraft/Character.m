//
//  Character.m
//  EverCraft
//
//  Created by BJ Miller on 1/7/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import "Character.h"

@implementation Character

- (instancetype)init {
    self = [super init];
    if (self) {
        _armor = 10;
        _hitPoints = 5;
        _isAlive = YES;
        
        _strength = [[Ability alloc] init];
        _dexterity = [[Ability alloc] init];
        _constitution = [[Ability alloc] init];
        _wisdom = [[Ability alloc] init];
        _intelligence = [[Ability alloc] init];
        _charisma = [[Ability alloc] init];
    }
    return self;
}

-(NSInteger)rollToAttack {
    return 11;
}

- (BOOL)attack:(NSInteger)roll wasSuccessfulAgainst:(Character *)opponent {
    if (roll >= opponent.armor) {
        [opponent takeDamageWithRoll:roll];
        return YES;
    } else {
        return NO;
    }
}

-(void)takeDamageWithRoll:(NSInteger)roll {
    self.hitPoints = self.hitPoints - (roll == 20 ? 2 :1);
    if (self.hitPoints <= 0) {
        self.isAlive = NO;
    }
}

- (BOOL)attackRollIsCriticalHit:(NSInteger)attack {
    return attack == 20;
}


@end
