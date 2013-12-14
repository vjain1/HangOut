//
//  PlacesViewController.m
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/13/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "PlacesViewController.h"
#import "EventViewController.h"
#import "PlacesViewCell.h"

@interface PlacesViewController ()

@property(nonatomic,strong) NSArray *arrPlaces;
@end

@implementation PlacesViewController {
}

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
    
    [_objSegmentedControl addTarget:self
                   action:@selector(onSGChange:)
         forControlEvents:UIControlEventValueChanged];
    
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"app_bg1.jpg"]]];
    
    NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"places" ofType:@"plist"];
    _arrPlaces = [[NSArray alloc] initWithContentsOfFile:pListPath];
    NSLog(@"_arrPlaces %d",_arrPlaces.count);
    [self.tableCafes reloadData];
    
}

- (void)onSGChange:(id)sender {
    [_tableCafes reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PlaceIdentifier";
    
    PlacesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (nil == cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PlacesViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSDictionary *dictPlace = [self.arrPlaces objectAtIndex:indexPath.row];
    cell.cafeName.text = [dictPlace valueForKey:@"CafeName"];
    cell.cafeAddress.text = [dictPlace valueForKey:@"CafeAddress"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_objSegmentedControl.selectedSegmentIndex == 0) {
        return _arrPlaces.count;
    }
    else {
        return 0;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dictPlace = [self.arrPlaces objectAtIndex:indexPath.row];
    EventViewController *objEventVC = [[EventViewController alloc] initWithNibName:@"EventViewController" bundle:nil];
    objEventVC.dictSelectedPlace = dictPlace;
    [self.navigationController pushViewController:objEventVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 96.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
