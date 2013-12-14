//
//  ContactsViewController.h
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MFMessageComposeViewControllerDelegate>

@property(nonatomic,strong) NSDictionary *dictSelectedPlace;
@property(nonatomic,strong) NSString *strSelectedDateTime;

@end
