//
//  SensorViewself.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 11.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "SensorViewCell.h"

@implementation SensorViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setPm10Value:(NSNumber *)pm10Value {
    /*
     PM10
     0 - 21 µg/m3 Bardzo dobry
     21 - 61 µg/m3 Dobry
     61 - 101 µg/m3 Umiarkowany
     101 - 141 µg/m3 Dostateczny
     141 - 201 µg/m3 Zły
     > 201 µg/m3 Bardzo zły
     */
    if ([pm10Value isEqual:[NSNull null]]) {
        self.valueLabel.text = @"brak danych";
        self.valueLabel.textColor = [UIColor blackColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.dateLabel.textColor = [UIColor blackColor];
    } else if (pm10Value.floatValue <= 21) {
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Bardzo dobry", pm10Value.stringValue];
        //#57b108
        self.contentView.backgroundColor = [UIColor colorWithRed:0x57 / 255.0 green:0xb1 / 255.0 blue:0x08 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor whiteColor];
    } else if (pm10Value.floatValue <= 61) {
        self.valueLabel.textColor = [UIColor blackColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Dobry", pm10Value.stringValue];
        //#b0dd10
        self.contentView.backgroundColor = [UIColor colorWithRed:0xb0 / 255.0 green:0xdd / 255.0 blue:0x10 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor blackColor];
    } else if (pm10Value.floatValue <= 101) {
        self.valueLabel.textColor = [UIColor blackColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Umiarkowany", pm10Value.stringValue];
        //#ffd911
        self.contentView.backgroundColor = [UIColor colorWithRed:0xff / 255.0 green:0xd9 / 255.0 blue:0x11 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor blackColor];
    } else if (pm10Value.floatValue <= 141) {
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Dostateczny", pm10Value.stringValue];
        //#e58100
        self.contentView.backgroundColor = [UIColor colorWithRed:0xe5 / 255.0 green:0xb81 / 255.0 blue:0x00 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor whiteColor];
    } else if (pm10Value.floatValue <= 201) {
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Zły", pm10Value.stringValue];
        //#e50000
        self.contentView.backgroundColor = [UIColor colorWithRed:0xe5 / 255.0 green:0x00 / 255.0 blue:0x00 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor whiteColor];
    } else {
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Bardzo zły", pm10Value.stringValue];
        //#990000
        self.contentView.backgroundColor = [UIColor colorWithRed:0x99 / 255.0 green:0x00 / 255.0 blue:0x00 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor whiteColor];
    }
    
    self.valueLabel.hidden = NO;
}

- (void)setPm2_5Value:(NSNumber *)pm2_5Value {
    /*
     PM2.5
     0 - 13 µg/m3 Bardzo dobry
     13 - 37 µg/m3 Dobry
     37 - 61 µg/m3 Umiarkowany
     61 - 85 µg/m3 Dostateczny
     85 - 121 µg/m3 Zły
     > 121 µg/m3
     */
    if ([pm2_5Value isEqual:[NSNull null]]) {
        self.valueLabel.text = @"brak danych";
        self.valueLabel.textColor = [UIColor blackColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.dateLabel.textColor = [UIColor blackColor];
    } else if (pm2_5Value.floatValue <= 13) {
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Bardzo dobry", pm2_5Value.stringValue];
        //#57b108
        self.contentView.backgroundColor = [UIColor colorWithRed:0x57 / 255.0 green:0xb1 / 255.0 blue:0x08 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor whiteColor];
    } else if (pm2_5Value.floatValue <= 37) {
        self.valueLabel.textColor = [UIColor blackColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Dobry", pm2_5Value.stringValue];
        //#b0dd10
        self.contentView.backgroundColor = [UIColor colorWithRed:0xb0 / 255.0 green:0xdd / 255.0 blue:0x10 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor blackColor];
    } else if (pm2_5Value.floatValue <= 61) {
        self.valueLabel.textColor = [UIColor blackColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Umiarkowany", pm2_5Value.stringValue];
        //#ffd911
        self.contentView.backgroundColor = [UIColor colorWithRed:0xff / 255.0 green:0xd9 / 255.0 blue:0x11 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor blackColor];
    } else if (pm2_5Value.floatValue <= 85) {
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Dostateczny", pm2_5Value.stringValue];
        //#e58100
        self.contentView.backgroundColor = [UIColor colorWithRed:0xe5 / 255.0 green:0xb81 / 255.0 blue:0x00 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor whiteColor];
    } else if (pm2_5Value.floatValue <= 121) {
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Zły", pm2_5Value.stringValue];
        //#e50000
        self.contentView.backgroundColor = [UIColor colorWithRed:0xe5 / 255.0 green:0x00 / 255.0 blue:0x00 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor whiteColor];
    } else {
        self.valueLabel.textColor = [UIColor whiteColor];
        self.valueLabel.text = [NSString stringWithFormat:@"%@ µg/m3 - Bardzo zły", pm2_5Value.stringValue];
        //#990000
        self.contentView.backgroundColor = [UIColor colorWithRed:0x99 / 255.0 green:0x00 / 255.0 blue:0x00 / 255.0 alpha:1.0];
        self.dateLabel.textColor = [UIColor whiteColor];
    }
    
    self.valueLabel.hidden = NO;
}

@end
