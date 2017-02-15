//
//  ViewController.m
//  CoreData
//
//  Created by Sergey Guznin on 12.02.17.
//  Copyright © 2017 Sergey Guznin. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataService.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  CoreDataService *service = [[CoreDataService alloc] init];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
