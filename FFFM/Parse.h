//
//  Parse.h
//  FFFM
//
//  Created by Ilia on 12/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
@class LocationOnMap;
@interface Parse : AFHTTPRequestOperationManager

-(NSMutableArray *)idsFromInfoes:(NSDictionary *)infoes;

-(LocationOnMap *)geoFromId:(NSDictionary *)infoes;

@end
