//
//  ViewController.m
//  FFFM
//
//  Created by Ilia on 11/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "LocationManager.h"
#import "Parse.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize IDs;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ShowLocations:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view
                         animated:YES];
    [[LocationManager new] getPhotosIdsWithcomplition:^(id data, BOOL success){
        if (success) {
            [self p_parseIds:data];
        }else{
            [MBProgressHUD hideAllHUDsForView:self.view
                                     animated:YES];
            NSLog(@"recieved error when tried to get locations:\n%@",data);
        }
    }];
}

-(void)p_parseIds:(NSArray *)array{
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(backgroundQueue, ^{
        NSArray *parsedIds=[[Parse new] idsFromInfoes:array];
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_async(mainQueue, ^{
            IDs=parsedIds;
        });
    });
}
@end
