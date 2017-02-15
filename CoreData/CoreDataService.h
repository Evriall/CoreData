//
//  CoreDataService.h
//  CoreData
//
//  Created by Sergey Guznin on 12.02.17.
//  Copyright © 2017 Sergey Guznin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CoreDataService : NSObject
@property (nonatomic,strong) NSManagedObjectContext *context;
@property (readonly, strong, nonatomic) NSFetchedResultsController * fetchedResultsController;
@end
