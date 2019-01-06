//
//  CitiesTVC.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 10.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GetStations;
@class City;
@class Station;

@interface CitiesTVC : UITableViewController {
    GetStations *getStations;
    NSArray<City *> *sorted;
    NSArray<Station *> *stations;
}

@end
