//
//  LocationOnMap.h
//  FFFM
//
//  Created by Ilia on 16/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface LocationOnMap : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate id:(NSString *)ID;

//-(NSString *)description;
@end
