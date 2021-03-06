//
//  Item.m
//  Shop
//
//  Created by Anna on 3/21/17.
//  Copyright © 2017 Anna. All rights reserved.
//

#import "Item.h"
#define PRICE(cost, percent) cost * percent/100.0f

@implementation Item

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if( self = [super init] )
    {
        _title = dictionary[@"title"];
        _cost = dictionary[@"cost"];
        _availableNumber = dictionary[@"availableNumber"];
        _manufacturer = dictionary[@"manufacturer"];
        _dateOfManufacture = dictionary[@"DateOfManufacture"];
    }
    
    return self;
}
- (NSDateFormatter*)dateFormatter
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterShortStyle;
    return df;
}
- (NSString *)itemDescription {
    return [NSString stringWithFormat:@"Title - %@, cost - %@, available number - %@, manufacturer - %@, has discount -  %s, Date of manufacture - %@, DISCOUNT - %.2f",
            _title,
            _cost,
            _availableNumber,
            _manufacturer,
            (_hasDiscount == 1 ? "yes" : "no"),
            [[self dateFormatter] stringFromDate:_dateOfManufacture],
            PRICE([_cost intValue], 30)];
}

@end
