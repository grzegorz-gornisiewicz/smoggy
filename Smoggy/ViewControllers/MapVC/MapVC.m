//
//  FirstViewController.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "MapVC.h"
#import "GetStations.h"

@interface MapVC ()

@property(nonatomic, readwrite, nullable) NSDictionary<NSString *, Station *> *stations;

@end

@implementation MapVC

- (void)viewDidLoad {
    [super viewDidLoad];

    //_mapView.delegate = self;
    getStations = [[GetStations alloc] init];
    [getStations get:^(NSDictionary<NSString *, Station *> * _Nullable stations) {
        self.stations = stations;
    }];
}

- (void)setStations:(NSDictionary<NSString *, Station *> * _Nullable)stations {
    _stations = stations;

    dispatch_async(dispatch_get_main_queue(), ^{
        for (Station *station in [self->_stations allValues]) {
            MKPointAnnotation *anotation = [[MKPointAnnotation alloc] init];
            anotation.title = station.city.name;
            anotation.subtitle = station.addressStreet ? station.addressStreet : @"";
            anotation.coordinate = CLLocationCoordinate2DMake(station.gegrLat.doubleValue, station.gegrLon.doubleValue);
            [self->_mapView addAnnotation:anotation];
            
//            MKCircle *stationCircle = [MKCircle circleWithCenterCoordinate:anotation.coordinate radius:1000.0];
//            [self->_mapView addOverlay:stationCircle level:MKOverlayLevelAboveRoads];
        }
    });
}

//- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id)overlay
//{
//    if ([overlay isKindOfClass:[MKCircle class]]) {
//        MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
//
//        [renderer setFillColor:[UIColor greenColor]];
//        [renderer setStrokeColor:[UIColor greenColor]];
//        [renderer setLineWidth:15.0];
//
//        return renderer;
//    }
//
//    return nil;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
