//
//  InvitesViewController.h
//  HangOut
//
//  Created by Vikas Jain on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvitesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *arrInvites;

@end
