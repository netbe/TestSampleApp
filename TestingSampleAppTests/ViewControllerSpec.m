#import "ViewController.h"
#import "Kiwi.h"
#import "Nocilla.h"

SPEC_BEGIN(ViewControllerSpec)

beforeAll(^{
    [[LSNocilla sharedInstance] start];

});
afterAll(^{
    [[LSNocilla sharedInstance] stop];
});
afterEach(^{
    [[LSNocilla sharedInstance] clearStubs];
        
});

describe(@"test", ^{
    it(@"should send a request to server and store token", ^{
        
        stubRequest(@"GET", @"http://klaxpont.dev/api/dailymotion/token").andReturn(200).
        withHeaders(@{@"Content-Type": @"application/json"}).
        withBody(@"{\"response\":{\"access_token\":\"toto\"}}");;
        ViewController *vc = [ViewController new];
        [vc viewDidLoad];
        
        // NOTE: why does the request not caught if performed during viewDidLoad
        
        [[theValue(vc.token) shouldEventually] beNonNil];
        [[(vc.token) shouldEventually] equal:@"toto"];
    });

});



SPEC_END
