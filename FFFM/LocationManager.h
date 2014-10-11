//
//  LocationManager.h
//  FFFM
//
//  Created by Ilia on 12/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

typedef void(^LocationComplition)(id data, BOOL success);

@interface LocationManager : AFHTTPRequestOperationManager

-(void)getPhotosIdsWithcomplition:(LocationComplition)complitionBlock;

@end
