//
//  AbilityTests.m
//  EverCraft
//
//  Created by BJ Miller on 1/7/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Ability.h"

@interface AbilityTests : XCTestCase

@end

@implementation AbilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatModifiersOnAbilitiesWorkCorrectly {
    Ability *testAbility = [Ability new];
    testAbility.score = 13;
    
    XCTAssertEqual(testAbility.modifier, 1);
}

@end
