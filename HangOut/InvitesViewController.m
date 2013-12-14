//
//  InvitesViewController.m
//  HangOut
//
//  Created by Vikas Jain on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "InvitesViewController.h"
#import "InvitesViewCell.h"


#define RECEIVED_INVITE @"Received"
#define SENT_INVITE @"Sent"

@interface InvitesViewController ()

@end

@implementation InvitesViewController

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

        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"app_bg1.jpg"]]];
    
    NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"Invites" ofType:@"plist"];
    _arrInvites = [[NSArray alloc] initWithContentsOfFile:pListPath];
    NSLog(@"_arrPlaces %lu",(unsigned long)[_arrInvites count]);

    _inviteType = RECEIVED_INVITE;
    [self loadTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arrSelectedInvites count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    InvitesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (nil == cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"InvitesViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSDictionary *dictInvites = [self.arrSelectedInvites objectAtIndex:indexPath.row];

    //if([_inviteType isEqualToString:[dictInvites valueForKey:@"InviteType"]]){
        cell.friendsName.text = [dictInvites valueForKey:@"InviteeName"];
        cell.addressLine1.text = [dictInvites valueForKey:@"AddressLine1"];
        cell.addressLine2.text = [dictInvites valueForKey:@"AddressLine2"];
        cell.dateTime.text = [dictInvites valueForKey:@"Datetime"];
        
        return cell;
//    }else{
//        return nil;
//    }
//    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)loadTable {
    _arrSelectedInvites = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictItem in _arrInvites) {
        if([_inviteType isEqualToString:[dictItem valueForKey:@"InviteType"]])
        {
            [_arrSelectedInvites addObject:dictItem];
        }
    }
    
    [self.tableInvites reloadData];
}

- (IBAction)onSegmentChange:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        //toggle the correct view to be visible
        self.inviteType = RECEIVED_INVITE;
//        [self.tableInvites reloadData];
    }
    else{
        //toggle the correct view to be visible
        self.inviteType = SENT_INVITE;
    }
    
    [self loadTable];
}
@end
