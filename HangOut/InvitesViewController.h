//
//  InvitesViewController.h
//  HangOut
//
//  Created by Vikas Jain on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvitesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableInvites;
@property (nonatomic, strong) NSArray *arrInvites;
@property (nonatomic, strong) NSMutableArray *arrSelectedInvites;

@property (nonatomic, strong) NSString *inviteType;
- (IBAction)onSegmentChange:(id)sender;

@end
