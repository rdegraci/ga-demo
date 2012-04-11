//
//  SecondViewController.h
//  ga-demo
//
//  Created by Rodney Degracia on 4/11/12.
//  Copyright (c) 2012 Venture Intellectual LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *contentTableView;
@property (retain, nonatomic) NSMutableArray* nameArray;
@end
