//
//  AppDelegate.h
//  StockApp
//
//  Created by Edmel John Ricahuerta on 2018-08-09.
//  Copyright © 2018 seneca.map. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

