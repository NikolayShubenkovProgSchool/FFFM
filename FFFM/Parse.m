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
    NSDictionary *gFP=[infoes objectForKey:@"photo"];
    NSDictionary *lFP=[gFP objectForKey:@"location"];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude=[[lFP objectForKey:@"latitude"] doubleValue];
    //NSLog(@"lat = %@", [lFP objectForKey:@"latitude"]);
    //NSLog(@"lat = %f", coordinate.latitude);
    coordinate.longitude=[[lFP objectForKey:@"longitude"] doubleValue];
    //NSLog(@"long= %@", [lFP objectForKey:@"longitude"]);
    //NSLog(@"long= %f", coordinate.longitude);
    LocationOnMap *location=[[LocationOnMap alloc] initWithCoordinate:coordinate id:[gFP objectForKey:@"id"]];
    return location;
}
@end
