//
//  PlacesViewController.h
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/13/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableCafes;
@property (weak, nonatomic) IBOutlet UISegmentedControl *objSegmentedControl;

@end
