//
//  NewKiwiSpec.m
//  TestingSampleApp
//
//  Created by François Benaiteau on 7/9/13.
//  Copyright 2013 Klax. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(NewKiwiSpec)

beforeAll(^{
    NSLog(@"FIRST BEFORE ALL");
});
beforeEach(^{
    NSLog(@"FIRST BEFORE EACH");
});

describe(@"inside the first describe", ^{
    NSLog(@"FIRST DESCRIBE NO BLOCKS");
    beforeAll(^{
        NSLog(@"BEFORE ALL - inside the first describe");
    });
    beforeEach(^{
        NSLog(@"BEFORE EACH - inside the first describe");
    });
    it(@"should test something", ^{
        NSLog(@"should test something");
    });
    
    it(@"should test something else", ^{
        NSLog(@"should test something else");
    });
    
    it(@"should failed", ^{
        [[theValue(YES) should] beFalse];
    });

});
SPEC_END
