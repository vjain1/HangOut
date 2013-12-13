//
//  InvitesViewCell.h
//  HangOut
//
//  Created by Vikas Jain on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvitesViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *friendsName;
@property (strong, nonatomic) IBOutlet UILabel *addressLine1;
@property (strong, nonatomic) IBOutlet UILabel *addressLine2;
@property (strong, nonatomic) IBOutlet UILabel *dateTime;

@end
