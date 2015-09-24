//
//  ViewController.h
//  Map
//
//  Created by mzx on 15/9/23.
//  Copyright (c) 2015年 mzx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController<MKMapViewDelegate>

@property(strong,nonatomic) MKMapView *mapView;
@end

