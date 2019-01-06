//
//  CitySensorsTVC.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 10.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GetSensors;
@class GetRecords;
@class Station;
@class Sensor;

@interface CitySensorsTVC : UITableViewController {
    NSMutableDictionary<NSString *, Sensor *> *records;
    NSMutableDictionary<NSString *, GetSensors *> *sensorsDownloaders;
    NSMutableDictionary<NSString *, GetRecords *> *recordsDownloaders;
    NSMutableArray *recordsDownloaded;
}

@property (nonatomic, readwrite) NSArray<Station *> *stations;

@end
