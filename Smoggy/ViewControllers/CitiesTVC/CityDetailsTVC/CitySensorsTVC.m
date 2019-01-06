//
//  CitySensorsTVC.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 10.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "CitySensorsTVC.h"

#import "GetSensors.h"
#import "GetRecords.h"
#import "Station.h"

#import "SensorViewCell.h"

@interface CitySensorsTVC ()

@end

@implementation CitySensorsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Pył zawieszony";
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor lightGrayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(refreshData:)
                  forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentOffset.y - self.refreshControl.frame.size.height) animated:YES];
    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)refreshData:(UIRefreshControl *)sender {
    [sensorsDownloaders removeAllObjects];
    [recordsDownloaders removeAllObjects];
    [recordsDownloaded removeAllObjects];

    sensorsDownloaders = @{}.mutableCopy;
    recordsDownloaders = @{}.mutableCopy;
    recordsDownloaded = @[].mutableCopy;
    
    NSRange range = NSMakeRange(0, [_stations count]);
    NSIndexSet *sectionsSet = [NSIndexSet indexSetWithIndexesInRange:range];
    [self.tableView beginUpdates];
    [self.tableView reloadSections:sectionsSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (void)setStations:(NSArray<Station *> *)stations {
    _stations = stations;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60.0;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_stations count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (recordsDownloaders) {
        //Station *station = [_stations objectAtIndex:section];
        GetRecords *downloadedRecords = [recordsDownloaders objectForKey:@(section).stringValue];
        if (downloadedRecords) {
            if ([downloadedRecords.records count] > 0) {
                Data *data = [[downloadedRecords.records allValues] objectAtIndex:0];
                
                if (data) {
                    return data.values.count;
                }
            }
        }
        
//        if ([self->recordsDownloaders count] == [self->recordsDownloaded count]) {
//            return 1;
//        }
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SensorViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SensorViewCell" forIndexPath:indexPath];

    //Station *station = [_stations objectAtIndex:indexPath.section];
    GetRecords *downloadedRecords = [recordsDownloaders objectForKey:@(indexPath.section).stringValue];
    if ([downloadedRecords.records count] > 0) {
        Data *data = [[downloadedRecords.records allValues] objectAtIndex:0];
        Value *record = [data.values objectAtIndex:indexPath.row];
        cell.dateLabel.text = record.date;
        cell.dateLabel.hidden = NO;
        
        if ([[[downloadedRecords.records allKeys] objectAtIndex:0] isEqualToString:@"PM10"]) {
            cell.pm10Value = record.value;
        } else {
            cell.pm2_5Value = record.value;
        }
    } else {
        cell.dateLabel.text = @"Brak sensora PM na tej stacji";
        cell.dateLabel.hidden = self.refreshControl.refreshing;
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Station *station = [_stations objectAtIndex:section];
    GetSensors *getSensors = [sensorsDownloaders objectForKey:@(section).stringValue];
    if (!getSensors) {
        getSensors = [[GetSensors alloc] init];
        [getSensors get:station.id completion:^(NSDictionary<NSString *, Sensor *> * _Nullable sensors) {
            for (Sensor *sensor in [sensors allValues]) {
                if ([sensor.param.paramCode containsString:@"PM"]) {
                    GetRecords *getRecords = [[GetRecords alloc] init];
                    [getRecords get:sensor.id completion:^(NSDictionary<NSString *, Data *> * _Nullable records) {
                        NSLog(@"section:%@", @(section).stringValue);
                        NSLog(@"station:%@", station.id.stringValue);
                        NSLog(@"sensor:%@", sensor.id.stringValue);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self->recordsDownloaded addObject:@(section).stringValue];
                            if ([self->recordsDownloaders count] == [self->recordsDownloaded count]) {
                                [self.refreshControl endRefreshing];
                                NSRange range = NSMakeRange(0, [self->_stations count]);
                                NSIndexSet *sectionsSet = [NSIndexSet indexSetWithIndexesInRange:range];
                                [self.tableView beginUpdates];
                                [self.tableView reloadSections:sectionsSet withRowAnimation:UITableViewRowAnimationAutomatic];
                                [self.tableView endUpdates];
                            }
                        });
                    }];

                    [self->recordsDownloaders setObject:getRecords forKey:@(section).stringValue];
                    NSLog(@"recordsDownloaders:%@:%@", station.id.stringValue, @(self->recordsDownloaders.count));
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([self->recordsDownloaders count] == 0) {
                    [self.refreshControl endRefreshing];
                    NSRange range = NSMakeRange(section, 1);
                    NSIndexSet *sectionsSet = [NSIndexSet indexSetWithIndexesInRange:range];
                    [self.tableView beginUpdates];
                    [self.tableView reloadSections:sectionsSet withRowAnimation:UITableViewRowAnimationAutomatic];
                    [self.tableView endUpdates];
                }
            });
        }];
        
        [sensorsDownloaders setObject:getSensors forKey:@(section).stringValue];
    }
    
    return station.stationName;
}

@end
