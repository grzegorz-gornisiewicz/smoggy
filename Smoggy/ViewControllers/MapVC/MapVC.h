//
//  MapVC.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class GetStations;

@interface MapVC : UIViewController <MKMapViewDelegate> {
    GetStations *getStations;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

