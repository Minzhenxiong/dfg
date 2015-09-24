//
//  ViewController.m
//  Map
//
//  Created by mzx on 15/9/23.
//  Copyright (c) 2015年 mzx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView=[[MKMapView alloc] initWithFrame:self.view.frame];
    
    self.mapView.mapType=MKMapTypeStandard;
//    self.mapView.mapType=MKMapTypeHybrid;
//    self.mapView.mapType=MKMapTypeSatellite;
    self.mapView.delegate=self;
    CLLocationCoordinate2D center=CLLocationCoordinate2DMake(32.462856, 119.940759);
    MKCoordinateSpan span=MKCoordinateSpanMake(0.06, 0.06);
    
    self.mapView.zoomEnabled=YES;
    //范围
    MKCoordinateRegion regin=MKCoordinateRegionMake(center, span);
    [self.mapView setRegion:regin animated:YES];
    
    [self.view addSubview:self.mapView];
    
    [self performSelector:@selector(showAnnotation) withObject:nil afterDelay:0.5];
}

-(void)showAnnotation
{
    MKPointAnnotation *annotation=[[MKPointAnnotation alloc] init];
    annotation.coordinate=CLLocationCoordinate2DMake(32.462856, 119.940759);
    annotation.title=@"泰州科技学院";
    annotation.subtitle=@"尚承实验室";
    [self.mapView addAnnotation:annotation];
    [self.mapView selectAnnotation:annotation animated:YES];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *identity=@"annotation";
    MKPinAnnotationView *annotationView=(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identity];
    
    if (annotationView==nil) {
        annotationView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identity];
    }
    annotationView.annotation=annotation;
    annotationView.canShowCallout=YES;
    annotationView.animatesDrop=YES;
    return annotationView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
