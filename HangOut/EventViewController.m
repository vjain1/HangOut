//
//  EventViewController.m
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "EventViewController.h"
#import "EventCreatedViewController.h"

@interface EventViewController ()
@property(nonatomic,weak)IBOutlet UILabel *lblCafeName;
@property(nonatomic,weak)IBOutlet UILabel *lblCafePhone;
@property(nonatomic,weak)IBOutlet UILabel *lblCafeWebsite;
@property(nonatomic,weak)IBOutlet UILabel *lblCafeAddress;

@property(nonatomic,weak)IBOutlet UIDatePicker *datePicker;
@property(nonatomic,weak)IBOutlet UIButton *btnCreateEvent;
@end

@implementation EventViewController

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
            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"app_bg1.jpg"]]];
    [_btnCreateEvent addTarget:self action:@selector(onCreateEventTap) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
    _lblCafeName.text = [_dictSelectedPlace objectForKey:@"CafeName"];
    _lblCafePhone.text = [_dictSelectedPlace objectForKey:@"CafePhone"];
    _lblCafeWebsite.text = [_dictSelectedPlace objectForKey:@"CafeWebsite"];
    _lblCafeAddress.text = [_dictSelectedPlace objectForKey:@"CafeAddress"];
}

-(void)onCreateEventTap {
    NSLocale *usLocale = [[NSLocale alloc]
                          initWithLocaleIdentifier:@"en_US"];
    
    NSDate *pickerDate = [_datePicker date];
    NSString *selectionString = [[NSString alloc]
                                 initWithFormat:@"%@",
                                 [pickerDate descriptionWithLocale:usLocale]];
    
    EventCreatedViewController *objEventCreatedVC = [[EventCreatedViewController alloc] initWithNibName:@"EventCreatedViewController" bundle:nil];
    objEventCreatedVC.strSelectedDateTime = selectionString;
    objEventCreatedVC.dictSelectedPlace = _dictSelectedPlace;
    [self.navigationController pushViewController:objEventCreatedVC animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
