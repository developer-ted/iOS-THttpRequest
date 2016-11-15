//
//  ViewController.m
//  THttpRequest
//
//  Created by Ted on 2016. 11. 14..
//  Copyright © 2016년 tedkim. All rights reserved.
//

#import "ViewController.h"
#import "TokenManager.h"
#import "TAPIManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"" forKey:@"email"];
    [dic setObject:@"" forKey:@"passwd"];
    [dic setObject:[TokenManager getSID] forKey:@"sid"];
    
    NSString *url = [NSString stringWithFormat:@"%@", AUTH];
    [[TAPIManager getInstance] requestNotTokenPostMethod:[APIUtils getAPIRequestUrl:url]
                                                 Params:dic
                                                 Target:self
                                                Success:@selector(requestSuccess:)
                                                Failure:@selector(requestFailure:)];
}

- (void)requestSuccess:(id) response {
    NSLog(@"success : %@", response);
}

- (void)requestFailure:(id) response {
    NSLog(@"fail : %@", response);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
