//
//  EverCraftTests.m
//  EverCraftTests
//
//  Created by BJ Miller on 1/7/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Character.h"

@interface EverCraftTests : XCTestCase
@property (nonatomic, strong) Character *character;
@property (nonatomic, strong) Character *opponent;
@property (nonatomic, assign) NSInteger attackResult;
@end

@implementation EverCraftTests

- (void)setUp {
    [super setUp];
    _character = [[Character alloc] init];
    _opponent = [[Character alloc] init];
    self.attackResult = [self.character rollToAttack];
}

- (void)tearDown {
    _character = nil;
    _opponent = nil; 
    [super tearDown];
}

- (void)testThatCharacterCanGetAndSetAName {
   
    // when
    [self.character setName: @"Steve"];
    
    // then
    XCTAssertEqualObjects(self.character.name, @"Steve");
}

- (void)testThatCharacterCanGetAndSetAnAlignment {
    // when
    [self.character setCharacterAlignment: CharacterAlignmentEvil];
    // then
    XCTAssertEqual(self.character.characterAlignment, CharacterAlignmentEvil);
}

-(void)testThatCharacterArmorDefaultsToTen {
    //then
    XCTAssertEqual(self.character.armor, 10);
}

- (void)testThatCharacterHitPointsDefaultsTo5 {
    XCTAssertEqual(self.character.hitPoints, 5);
}

- (void)testThatCharacterCanRollAttack {
    XCTAssertGreaterThan(self.attackResult, 0);
    XCTAssertLessThan(self.attackResult, 21);
}

-(void)testThatRollBeatsOpponentsArmor {
    // then
    XCTAssertTrue([self.character attack:self.attackResult wasSuccessfulAgainst:self.opponent]);
}

- (void)testThatWeakerAttackDoesNotKillOpponent {
    XCTAssertFalse([self.character attack:7 wasSuccessfulAgainst:self.opponent]);
}

- (void)testThatASuccessfulAttackDoesDamageToTheOppenent {
    [self.character attack:15 wasSuccessfulAgainst:self.opponent];
    
    XCTAssertEqual(self.opponent.hitPoints, 4);
}

-(void)testThatUnsuccessfulAttackDoesNotDamageOpponent {
    [self.character attack:8 wasSuccessfulAgainst:self.opponent];

    XCTAssertEqual(self.opponent.hitPoints, 5);
}

- (void)testThatNatural20RollDealsDoubleDamage {
    [self.character attack:20 wasSuccessfulAgainst:self.opponent];
    
    XCTAssertEqual(self.opponent.hitPoints, 3);
}

- (void)testThatACharacterWithZeroOrFewerHitPointsIsDead {
    self.opponent.hitPoints = 1;
    [self.character attack:18 wasSuccessfulAgainst:self.opponent];
    
    XCTAssertFalse(self.opponent.isAlive);
}

-(void)testThatAbilitiesDefaultToTen {
    XCTAssertEqual(self.character.strength.score, 10);
    XCTAssertEqual(self.character.dexterity.score, 10);
    XCTAssertEqual(self.character.constitution.score, 10);
    XCTAssertEqual(self.character.wisdom.score, 10);
    XCTAssertEqual(self.character.intelligence.score, 10);
    XCTAssertEqual(self.character.charisma.score, 10);
}

-(void)testThatStrengthModifierModifiesAttack {
    self.character.strength.score = 15;
    XCTAssertEqual(13, [self.character rollToAttack]);
}

@end
