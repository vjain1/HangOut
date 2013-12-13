//
//  EventViewController.m
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()
@property(nonatomic,weak)IBOutlet UILabel *lblCafeName;
@property(nonatomic,weak)IBOutlet UILabel *lblCafePhone;
@property(nonatomic,weak)IBOutlet UILabel *lblCafeWebsite;
@property(nonatomic,weak)IBOutlet UILabel *lblCafeAddress;
@end

@implementation EventViewController

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

-(void)viewWillAppear:(BOOL)animated {
    _lblCafeName.text = [_dictSelectedPlace objectForKey:@"CafeName"];
    _lblCafePhone.text = [_dictSelectedPlace objectForKey:@"CafePhone"];
    _lblCafeWebsite.text = [_dictSelectedPlace objectForKey:@"CafeWebsite"];
    _lblCafeAddress.text = [_dictSelectedPlace objectForKey:@"CafeAddress"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
