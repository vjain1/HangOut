//
//  HomeViewController.m
//  HangOut
//
//  Created by Vikas Jain on 12/13/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "HomeViewController.h"
#import <MessageUI/MessageUI.h>
#import "PlacesViewController.h"
#import "InvitesViewController.h"

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
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"app_bg1.jpg"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)onSendMessage:(id)sender {
//    
////    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
////    if([MFMessageComposeViewController canSendText])
////    {
////        controller.body = @"This is a test message from Vikas";
////        controller.recipients = [NSArray arrayWithObjects:@"9810582226", nil];
////        controller.messageComposeDelegate = self;
////        [self presentViewController:controller animated:YES completion:^(void){
////            [self dismissViewControllerAnimated:YES completion:nil];
////        }];
////    }
//    
//    
//    
//}

- (IBAction)onGamingSelect:(id)sender {
}

- (IBAction)onCoffeeSelect:(id)sender {
    PlacesViewController *objPlaces = [[PlacesViewController alloc] initWithNibName:@"PlacesViewController" bundle:nil];
    [self.navigationController pushViewController:objPlaces animated:YES];
}

- (IBAction)onMovieSelect:(id)sender {
}

- (IBAction)onMealSelect:(id)sender {
}

- (IBAction)onInvitesSelect:(id)sender {
    InvitesViewController *invitesVC = [[InvitesViewController alloc] initWithNibName:@"InvitesViewController" bundle:nil];
    [self.navigationController pushViewController:invitesVC animated:YES];
}

- (void)showSMS:(NSString*)message {
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    NSArray *recipents = @[@"vikas_jain2012@yahoo.com"];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
