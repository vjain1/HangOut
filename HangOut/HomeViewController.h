//
//  HomeViewController.h
//  HangOut
//
//  Created by Vikas Jain on 12/13/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"

@interface HomeViewController : UIViewController
{
  Connection* connection;    
}
- (IBAction)onSendMessage:(id)sender;


@end
