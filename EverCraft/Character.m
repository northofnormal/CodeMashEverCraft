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
        _level = 1;
        
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
    return 9 + self.strength.modifier + floor(self.level/2);
}

- (BOOL)attack:(NSInteger)roll wasSuccessfulAgainst:(Character *)opponent {
    NSInteger modifiedOpponentArmor = [opponent modify:opponent.armor WithModifier:opponent.dexterity];
    
    if (roll >= modifiedOpponentArmor) {
        [opponent takeDamageWithRoll:roll WithAttacker:self];
        self.experiencePoints += 10;
        [self refreshLevel];
        return YES;
    } else {
        return NO;
    }
}

- (NSInteger)modify:(NSInteger)property WithModifier:(Ability *)ability {
    return property += ability.modifier;
}

- (void)takeDamageWithRoll:(NSInteger)roll WithAttacker:(Character*)attacker {
    if (roll == 20) {
        self.hitPoints -= 2;
        self.hitPoints -= (attacker.strength.modifier * 2);
    }
    else {
        self.hitPoints -= 1;
        if (attacker.strength.modifier >= 0) {
            self.hitPoints = self.hitPoints - attacker.strength.modifier;
        }
    }
    
    self.isAlive = self.hitPoints > 0;
}

- (BOOL)attackRollIsCriticalHit:(NSInteger)attack {
    return attack == 20;
}

- (void)refreshAbilities {
    self.hitPoints += self.constitution.modifier;
    if (self.hitPoints <= 0) {
        self.hitPoints = 1; 
    };
}

-(void)refreshLevel {
    NSInteger previousLevel = self.level;
    self.level = floor(self.experiencePoints / 1000) + 1;
    
    if (previousLevel < self.level) {
        self.hitPoints = self.hitPoints + (MAX(1, (5 + self.constitution.modifier)));
    }
}


@end
