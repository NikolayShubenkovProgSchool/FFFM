//
//  LocationManager.m
//  FFFM
//
//  Created by Ilia on 12/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:@"https://api.flickr.com/services/rest/"]];
    if (self){
        self.requestSerializer  = [AFHTTPRequestSerializer new];
        self.responseSerializer = [AFJSONResponseSerializer new];
    }
    return self;
}

-(void)getPhotosIdsWithcomplition:(LocationComplition)complitionBlock{
    LocationComplition copiedComplitionBlock = [complitionBlock copy];
    NSDictionary *parameters = @{@"method" :@"flickr.photos.search",
                                 @"api_key":@"8eb901e0e7bdd1a637abac52c87d1a87",
                                 @"lat":@(55),
                                 @"lon":@(37),
                                 @"radius":@(15),
                                 @"format":@"json",
                                 @"nojsoncallback":@"1"};
    [self GET:@""
   parameters:parameters
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          copiedComplitionBlock(responseObject, YES);
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          copiedComplitionBlock(error, NO);
      }];
}

@end
