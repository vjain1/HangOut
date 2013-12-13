//
//  HomeViewController.h
//  HangOut
//
//  Created by Vikas Jain on 12/13/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface HomeViewController : UIViewController <MFMessageComposeViewControllerDelegate>
- (IBAction)onSendMessage:(id)sender;

@end
