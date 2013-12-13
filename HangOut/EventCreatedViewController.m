//
//  EventCreatedViewController.m
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "EventCreatedViewController.h"
#import "ContactsViewController.h"

@interface EventCreatedViewController ()
@property(nonatomic,weak)IBOutlet UILabel *lblCafeName;
@property(nonatomic,weak)IBOutlet UILabel *lblCafeAddress;


@property(nonatomic,weak)IBOutlet UILabel *lblEventDate;
@property(nonatomic,weak)IBOutlet UIButton *btnInviteFriends;

@end

@implementation EventCreatedViewController

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
    [_btnInviteFriends addTarget:self action:@selector(onInviteFriends) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
    _lblCafeName.text = [_dictSelectedPlace objectForKey:@"CafeName"];
    _lblCafeAddress.text = [_dictSelectedPlace objectForKey:@"CafeAddress"];
    _lblEventDate.text = _strSelectedDateTime;
}

-(void)onInviteFriends {
    ContactsViewController *contactVC = [[ContactsViewController alloc] initWithNibName:@"ContactsViewController" bundle:nil];
    [self.navigationController pushViewController:contactVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
