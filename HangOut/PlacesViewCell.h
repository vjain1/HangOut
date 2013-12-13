//
//  PlacesViewCell.h
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *cafeName;
@property (strong, nonatomic) IBOutlet UILabel *cafeAddress;
@property (strong, nonatomic) IBOutlet UILabel *cafeDistance;

@end
