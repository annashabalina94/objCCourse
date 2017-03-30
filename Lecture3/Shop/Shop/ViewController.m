//
//  ViewController.m
//  Shop
//
//  Created by Anna on 3/17/17.
//  Copyright © 2017 Anna. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// объявляем свойсво класса для хранения информации о наших товарах
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property(nonatomic, strong) NSArray *shop;
@end
#define PRICE(cost, percent) cost * percent/100.0f
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //здесь будет выполняться основная логика

    //вначале читаем данные в массив
    [self readData];
    
    //затем отображаем эти данные
    [self showData];
}

//Объявляем метод для чтения данных из плист файла
-(void)readData
{
    //получим путь к этому файлу
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"Items"withExtension:@"plist"];
    
    // далее мы может создать массив используя данные из плист файла
    self.shop = [NSArray arrayWithContentsOfURL:fileURL];
}
// объявим метод для отображения данных
-(void)showData
{
   // для начала проверим структуру данных в нашем массиве
    NSLog(@"Data array%@", self.shop);
    
    //далее напишем логику для получения текстовый представлений каждого товара
    NSMutableArray *textRepresentation = [NSMutableArray array];
  
    for (NSDictionary *item in self.shop)
    {
        BOOL hasDiscount = [[item objectForKey:@"hasDiscount"] boolValue];

        if (hasDiscount == YES)
        {
        NSString *title = [item objectForKey:@"title"];
        NSNumber *cost = [item objectForKey:@"cost"];
        NSNumber *availableNumber = [item objectForKey: @"availableNumber"];
        NSString *manufacturer = [item objectForKey:@"manufacturer"];
        
       
       
            NSString *result = [NSString stringWithFormat:@"Title - %@, cost - %@, available number - %@, manufacturer - %@", title, cost, availableNumber, manufacturer];
            [textRepresentation addObject:result];
    
    
            //формируем результрующую строку
            NSString *resultString = [textRepresentation componentsJoinedByString:@"\n"];
            //выводим получившийся результут визуально
            self.resultLabel.text = resultString;
        
        }
    }
}

@end


