//
//  SecondViewController.m
//  ga-demo
//
//  Created by Rodney Degracia on 4/11/12.
//  Copyright (c) 2012 Venture Intellectual LLC. All rights reserved.
//

#import "SecondViewController.h"

#import "GANTracker.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize contentTableView;
@synthesize nameArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    self.nameArray = [NSMutableArray arrayWithObjects:@"Apple", @"Android", @"Rim", nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    NSError* error;
    if (![[GANTracker sharedTracker] trackPageview:@"/SecondViewController"
                                         withError:&error]) {
        NSLog(@"GANTracker FirstViewController page view Error!");
    }
}

- (void)viewDidUnload
{
    [self setNameArray:nil];
    [self setContentTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [nameArray release];
    [contentTableView release];
    [super dealloc];
}

#pragma mark - UITableViewDelegate Protocol


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    NSString* rowName = [nameArray objectAtIndex:[indexPath row]];
    NSString* path = [NSString stringWithFormat:@"/SecondViewController/contentTableView/%@", rowName];
                      
    NSLog(@"path = %@", path);
    NSError* error;
    if (![[GANTracker sharedTracker] trackPageview:path
                                         withError:&error]) {
        NSLog(@"GANTracker FirstViewController page view Error!");
    }
}



#pragma mark - UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"UITableViewCellStyleValue1";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [nameArray objectAtIndex:[indexPath row]];
    
    return cell; 
}
@end
