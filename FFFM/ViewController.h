//
//  ViewController.h
//  FFFM
//
//  Created by Ilia on 11/10/14.
//  Copyright (c) 2014 Ilia Stukalov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) NSMutableArray *IDs;
@property (weak, nonatomic) IBOutlet MKMapView *Map;

- (IBAction)ShowLocations:(id)sender;

@end

