//
//  Character.h
//  EverCraft
//
//  Created by BJ Miller on 1/7/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ability.h"

typedef enum {
    CharacterAlignmentGood,
    CharacterAlignmentEvil,
    CharacterAlignmentNeutral
} CharacterAlignment;

@interface Character : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CharacterAlignment characterAlignment;
@property (nonatomic, assign) NSInteger armor;
@property (nonatomic, assign) NSInteger hitPoints;
@property (nonatomic, assign) BOOL isAlive;

@property (nonatomic, strong) Ability *strength;
@property (nonatomic, strong) Ability *dexterity;
@property (nonatomic, strong) Ability *constitution;
@property (nonatomic, strong) Ability *wisdom;
@property (nonatomic, strong) Ability *intelligence;
@property (nonatomic, strong) Ability *charisma;

-(NSInteger)rollToAttack;
- (BOOL)attack:(NSInteger)roll wasSuccessfulAgainst:(Character *)opponent;
-(void)takeDamageWithRoll:(NSInteger)roll;

@end
