//
//  Parse.m
//  FFFM
//
//  Created by Ilia on 12/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import "Parse.h"
#import "LocationOnMap.h"

@implementation Parse

-(NSMutableArray *)idsFromInfoes:(NSDictionary *)infoes{
    NSMutableArray *array=[NSMutableArray new];
    NSMutableDictionary *PhotosFromParse=[[NSMutableDictionary alloc] init];
    [PhotosFromParse addEntriesFromDictionary:[infoes objectForKey:@"photos"]];
    NSMutableArray *PFP=[[NSMutableArray alloc]init];
    PFP=[PhotosFromParse objectForKey:@"photo"];
    for (int i=0; i<[PFP count]; i++) {
        NSMutableDictionary *FLD=[[NSMutableDictionary alloc] init];
        [FLD addEntriesFromDictionary:PFP[i]];
        NSString *ID=[FLD valueForKey:@"id"];
        [array addObject:ID];
    }
    return array;
}

-(LocationOnMap *)geoFromId:(NSDictionary *)infoes{
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude=[[infoes objectForKey:@"latitude"] doubleValue];
    coordinate.longitude=[[infoes objectForKey:@"longitude"] doubleValue];
    LocationOnMap *location=[[LocationOnMap alloc] initWithCoordinate:coordinate id:[infoes objectForKey:@"id"]];
    return location;
}
@end
