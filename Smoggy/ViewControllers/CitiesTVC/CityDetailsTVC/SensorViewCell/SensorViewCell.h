//
//  SensorViewCell.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 11.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SensorViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@property (weak, nonatomic) NSNumber *pm10Value;
@property (weak, nonatomic) NSNumber *pm2_5Value;

@end
