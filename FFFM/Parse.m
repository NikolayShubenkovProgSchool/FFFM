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
    for(NSDictionary *info in infoes[@"photos"][@"photo"]){
        NSString *ID=info[@"id"];
        [array addObject:ID];
    }
    return array;
}

-(LocationOnMap *)geoFromId:(NSDictionary *)infoes{
#warning называйте переменные осмысленно и не сокращайте никогда. 
#warning это признак плохого тона. По названию переменное должно быть понятно ее назначение
    NSDictionary *gFP=[infoes objectForKey:@"photo"];
    NSDictionary *lFP=[gFP objectForKey:@"location"];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude=[[lFP objectForKey:@"latitude"] doubleValue];
    //NSLog(@"lat = %@", [lFP objectForKey:@"latitude"]);
    //NSLog(@"lat = %f", coordinate.latitude);
    coordinate.longitude=[[lFP objectForKey:@"longitude"] doubleValue];
    //NSLog(@"long= %@", [lFP objectForKey:@"longitude"]);
    //NSLog(@"long= %f", coordinate.longitude);
#warning добавьте парсинг заголовка, для аннотации title
    LocationOnMap *location=[[LocationOnMap alloc] initWithCoordinate:coordinate id:[gFP objectForKey:@"id"]];
    return location;
}
@end
