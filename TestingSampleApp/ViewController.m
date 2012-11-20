//
//  ViewController.m
//  TestingSampleApp
//
//  Created by François Benaiteau on 11/16/12.
//  Copyright (c) 2012 Klax. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // NOTE: why does the request not caught if performed during viewDidLoad
    [self sendRequest];
}

-(void)sendRequest
{
    NSURLRequest *request =  [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"http://klaxpont.dev/api/dailymotion/token"]];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connection) {
        [connection start];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSError* error;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if(error){
        // handle parsing error
        NSLog(@"error data from klaxpont %@",error );
    }else{
        
        NSLog(@"didReceiveData: json parsed %@", result);
        NSDictionary *response = [result objectForKey:@"response"];
        NSDictionary *error = [result objectForKey:@"error"];
        if (response) {
            _token = [response objectForKey:@"access_token"];
        }
        if (error) {
            NSLog(@"error data from klaxpont %@",error );
        }
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSString *url = [connection.originalRequest.URL absoluteString];
    NSLog(@"Error %@ : %@",url, error );
    [connection cancel];
}
@end
