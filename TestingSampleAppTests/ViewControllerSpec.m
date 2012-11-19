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


it(@"should send a request to server and store token", ^{
    
    stubRequest(@"GET", @"http://klaxpont.dev/api/dailymotion/token").andReturn(200).
    withHeaders(@{@"Content-Type": @"application/json"}).
    withBody(@"{\"response\":{\"access_token\":\"toto\"}}");;
    ViewController *vc = [ViewController new];


    // NOTE: why does the request not caught if performed during viewDidLoad
    [vc performSelector:@selector(sendRequest)];
    [[theValue(vc.token) shouldEventually] beNonNil];
    [[(vc.token) shouldEventually] equal:@"toto"];
});



SPEC_END
