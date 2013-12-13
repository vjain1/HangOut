//
//  InvitesViewController.m
//  HangOut
//
//  Created by Vikas Jain on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "InvitesViewController.h"
#import "InvitesViewCell.h"

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
}

-(void) createInvitesArray
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arrInvites count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    InvitesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (nil == cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"InvitesViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
//    MenuCategory *objCategory = [_arrCategory objectAtIndex:indexPath.row];
//    
//    //    cell.Label.text = objCategory.name;
//    cell.Label.font = (__bridge UIFont *)((__bridge CGFontRef)[Theme getFontForHeadline]);
//    
//    //    cell.Label.font = [Theme getFontForHeadline];
//    cell.Label.textColor = [Theme getColorForSelectedTabs];
//    
//    if ([objCategory.name isEqualToString:@"You Pick Two"]) {
//        //        NSString *cubedSymbol = @"\u00AE";//@"\u00B3";
//        NSString *categoryName = [NSString stringWithFormat:@"%@ ®", objCategory.name];
//        cell.Label.text = categoryName;
//        
//        
//        
//        // Commented as this block is crashing on iOS 5.
//        /*        [cell.Label setText:categoryName afterInheritingLabelAttributesAndConfiguringWithBlock: ^(NSMutableAttributedString *mutableAttributedString) {
//         NSRange range = [categoryName rangeOfString:@"®"];
//         //            [mutableAttributedString addAttribute:(__bridge id ) kCTSuperscriptAttributeName value:(id)[NSNumber numberWithInt:1] range:range];
//         UIFont *smallFont = [UIFont fontWithName:@"Sina-Medium" size:12.0];
//         [mutableAttributedString addAttribute:(__bridge NSString *)kCTFontAttributeName value:smallFont range:range];
//         
//         return mutableAttributedString;
//         }]; */
//        
//        
//    } else {
//        cell.Label.text = objCategory.name;
//    }
//    
//    
//    NSURL *urlString = [[ImageUtility sharedInstance] getIconURLwithImageName:objCategory.iconImage];
//    
//    [cell setupSpinner];
//    [cell setItemImageByURL:urlString];
//    
//    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    CafeManager *cafeMgr = [[CafeManager alloc] init];
//    Cafe *objCafe = [cafeMgr getCafeWithId:[[OrderManager sharedManager] strCurrentCafeId]];
//    if ([objCategory.schedules count] > 0) {
//        BOOL show = NO;
//        MenuSchedule *currentSchedule = nil;
//        for (MenuSchedule *schedule in objCategory.schedules) {
//            if ([Utility checkAvailabilityOfCategorySchedule:schedule forCafe:objCafe]) {
//                DLog(@"will show");
//                show = YES;
//                currentSchedule = schedule;
//                break;
//            }
//        }
//        
//        if (show) {
//            cell.DetailLabel.font = [Theme getFontForFootnotes];
//            cell.DetailLabel.textColor = [Theme getColorForFootnotes];
//            
//            NSString *start = [Utility getScheduleDisplayTime:currentSchedule.startTime];
//            NSString *end = [Utility getScheduleDisplayTime:currentSchedule.endTime];
//            
//            start = [self getStartTimeForCategory:start ForCafe:objCafe];
//            
//            cell.DetailLabel.text = [NSString stringWithFormat:@"Available %@ - %@",start,end];
//            cell.menuTiming = [NSString stringWithFormat:@"%@ is available from %@ - %@",objCategory.name,start,end];
//        }
//    }
//    
//    if (indexPath.row == [_arrCategory count] - 1)
//        cell.ImageSeparator.hidden = YES;
//    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
