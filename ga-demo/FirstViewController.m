//
//  FirstViewController.m
//  ga-demo
//
//  Created by Rodney Degracia on 4/11/12.
//  Copyright (c) 2012 Venture Intellectual LLC. All rights reserved.
//

#import "FirstViewController.h"

#import "GANTracker.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSError* error;
    if (![[GANTracker sharedTracker] trackPageview:@"/FirstViewController"
                                         withError:&error]) {
        NSLog(@"GANTracker FirstViewController page view Error!");
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)touchGenerateAnEvent:(id)sender {
    
    NSError* error;
    if (![[GANTracker sharedTracker] trackEvent:@"Event Generated"
                                         action:@"Event button pressed"
                                          label:@"Generate Event"
                                          value:-1
                                      withError:&error]) {
        NSLog(@"GANTracker Event Error!");
    }
}
@end
