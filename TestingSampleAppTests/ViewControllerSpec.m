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
    
    ViewController *vc = [ViewController new];
    stubRequest(@"GET", @"http://klaxpont.dev/api/dailymotion/token");

    
    [vc viewDidLoad];
    
    [[(vc.token) shouldEventually] beNonNil] ;//]equal:@"MnETBAxYXEFbTR0aFBYEVggSTRFcAQc"];
    [[(vc.token) shouldEventually] equal:@"MnETBAxYXEFbTR0aFBYEVggSTRFcAQc"];
});



SPEC_END
