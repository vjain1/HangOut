//
//  HomeViewController.m
//  HangOut
//
//  Created by Vikas Jain on 12/13/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSendMessage:(id)sender {
    NSString *strMessage = @"This is a test message";
    
    // Create network packet to be sent to all clients
    NSDictionary* packet = [NSDictionary dictionaryWithObjectsAndKeys:strMessage, @"message", @"Vikas", @"from", nil];
    
    // Send it out
//    [connection sendNetworkPacket:packet];
    
}
@end
