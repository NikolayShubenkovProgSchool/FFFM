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
#import "LocationOnMap.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize IDs, Locations;

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

-(void)p_parseIds:(NSDictionary *)dictionary{
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(backgroundQueue, ^{
        NSArray *parsedIds=[[Parse new] idsFromInfoes:dictionary];
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_async(mainQueue, ^{
            IDs=parsedIds;
            for (int i=0; i<[IDs count]/10; i++) {
                //NSLog(@"id number %d=%@",i,IDs[i]);
                [[LocationManager new] getGeoFromPhotoWithId:IDs[i] andComplition:^(id data, BOOL Success){
                    if (Success) {
                        NSLog(@"%@", data);
                        [self p_parseGeo:data];
                    }else{
                        [MBProgressHUD hideAllHUDsForView:self.view
                                                 animated:YES];
                        NSLog(@"recieved error when tried to get Geo:\n%@",data);
                    }
                }];
            }
        });
    });
}

-(void)p_parseGeo:(NSDictionary *)dictionary{
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(backgroundQueue, ^{
        //call method from parse.h
        LocationOnMap *loc=[[Parse new] geoFromId:dictionary];
        //[Locations addObject:loc];
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_async(mainQueue, ^{
            
        });
    });
}
@end
