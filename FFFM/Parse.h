//
//  Parse.h
//  FFFM
//
//  Created by Ilia on 12/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface Parse : AFHTTPRequestOperationManager

-(NSMutableArray *)idsFromInfoes:(NSDictionary *)infoes;

-(NSMutableDictionary *)geoFromId:(NSDictionary *)infoes;

@end
