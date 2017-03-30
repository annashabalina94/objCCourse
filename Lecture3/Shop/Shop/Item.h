//
//  Item.h
//  Shop
//
//  Created by Anna on 3/21/17.
//  Copyright © 2017 Anna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property(nonatomic, strong)NSString *title;
@property(nonatomic, assign)NSNumber *cost;
@property(nonatomic, assign)NSNumber *availableNumber;
@property(nonatomic, strong)NSString *manufacturer;
@property(nonatomic, assign)NSNumber *hasDiscount;
@property(nonatomic, assign)NSDate *date;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSString *)itemDescription;

+(Item*)defaultItem;

@end
