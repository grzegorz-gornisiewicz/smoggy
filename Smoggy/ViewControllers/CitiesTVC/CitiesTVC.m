//
//  CitiesTVC.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 10.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "CitiesTVC.h"

#import "GetStations.h"
#import "Station.h"

#import "CitySensorsTVC.h"

@interface CitiesTVC ()

@end

@implementation CitiesTVC

- (void)viewDidLoad {
    [super viewDidLoad];

    getStations = [[GetStations alloc] init];
    
    [getStations get:^(NSDictionary<NSString *, Station *> * _Nullable stations) {
        if (stations) {
            self->stations = [stations allValues];

            NSMutableDictionary<NSString *, City *> *cities = @{}.mutableCopy;
            for (Station *station in [stations allValues]) {
                [cities setObject:station.city forKey:station.city.name];
            }

            self->sorted = [[cities allValues] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                return [[(City *)obj1 name] caseInsensitiveCompare: [(City *)obj2 name]] == NSOrderedAscending ? NSOrderedAscending : NSOrderedDescending;
            }];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sorted count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityNameViewCell" forIndexPath:indexPath];

    City *city = [sorted objectAtIndex:indexPath.row];
    
    cell.textLabel.text = city.name;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    City *city = [sorted objectAtIndex:indexPath.row];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"city.name LIKE %@", city.name];
    
    NSArray<Station *> *stationsInCity = [stations filteredArrayUsingPredicate:predicate];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CitySensorsTVC *citySensorsTVC = [story instantiateViewControllerWithIdentifier:@"CitySensorsTVC"];
    citySensorsTVC.stations = stationsInCity;
    
    [self.navigationController pushViewController:citySensorsTVC animated:YES];
}
@end
