#import "ViewController.h"
#import "Kiwi.h"
#import "Nocilla.h"

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    it(@"should send a request to server and store token", ^{
//        stubRequest(@"GET", @"http://klaxpont.dev/api/dailymotion/token").
//        withHeader(@"Accept", @"application/json");
        
        ViewController *vc = ViewController.new;
        [vc viewDidLoad];
        
        [[vc.token should] equal:@"MnETBAxYXEFbTR0aFBYEVggSTRFcAQc"];
    });
});

SPEC_END
