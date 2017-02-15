//
//  CoreDataService.m
//  CoreData
//
//  Created by Sergey Guznin on 12.02.17.
//  Copyright © 2017 Sergey Guznin. All rights reserved.
//

#import "CoreDataService.h"

@implementation CoreDataService
@synthesize fetchedResultsController = _fetchedResultsController;
- (id)init{
  AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

  self.context = appDelegate.persistentContainer.viewContext;
  return self;
}


- (void) save {
  NSError *error;
  @try {
    
    if ([self.context hasChanges] && ![self.context save:&error]) {
      NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
      abort();

    }
  }
  @catch (NSException *exception) {
    NSLog(@"%@", exception.reason);
  }
}
  - (NSFetchRequest*)loadTasks {
  
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:self.context];
    [fetchRequest setEntity:entity];
    return fetchRequest;
    31
  }

- (NSFetchedResultsController *)fetchedResultsController
{
  if (_fetchedResultsController != nil) {
    return _fetchedResultsController;
  }
  
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItem" inManagedObjectContext:self.context];
  [fetchRequest setEntity:entity];
  
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:YES];
  NSArray *sortDescriptors = @[sortDescriptor];
  [fetchRequest setSortDescriptors:sortDescriptors];
  
  _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:@"Master"];
  
  NSError *error = nil;
  if (![_fetchedResultsController performFetch:&error]) {
    NSLog(@"Unresolved error: %@, %@", error, [error userInfo]);
    abort();
  }
  
  return _fetchedResultsController;
}


//  func loadTasks() -> [Task] {
//    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//    var tasks: [Task]?
//    
//    do {
//      tasks = try context.fetch(fetchRequest)
//    } catch {
//      print("Error with request: \(error)")
//    }
//    
//    return tasks!
//  }

@end
