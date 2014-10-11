//
//  Parse.m
//  FFFM
//
//  Created by Ilia on 12/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import "Parse.h"

@implementation Parse

-(NSMutableArray *)idsFromInfoes:(NSArray *)infoes{
    NSMutableArray *array=[NSMutableArray new];
    for(NSDictionary *info in infoes){
        NSString *ID=[NSString stringWithFormat:@"%d",[info[@"id"]integerValue]];
        [array addObject:ID];
    }
    return array;
}

@end
