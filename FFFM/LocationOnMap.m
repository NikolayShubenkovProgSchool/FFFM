//
//  LocationOnMap.m
//  FFFM
//
//  Created by Ilia on 16/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import "LocationOnMap.h"

@interface LocationOnMap()

@property (nonatomic) CLLocationCoordinate2D internalCoordinate;

@end

@implementation LocationOnMap

- (NSString *)title
{
    return self.ID;
}

- (CLLocationCoordinate2D)coordinate
{
    return self.internalCoordinate;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate id:(NSString *)ID{
    self=[super init];
    if (self) {
        _internalCoordinate=coordinate;
        _ID=ID;
    }
    return self;
}

//-(NSString *)description{
//    NSDictionary *description=@{@"cooddinate" : @{@"long":@(self.coordinate.longitude),
//                                                  @"lat" :@(self.coordinate.latitude)},
//                                @"ID":self.ID
//                                };
//    return [NSString stringWithFormat:@"%@\n%@",[super description],description];
//}
@end
