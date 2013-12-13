//
//  PlacesViewController.m
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/13/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "PlacesViewController.h"
#import "EventViewController.h"

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
    
    NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"places" ofType:@"plist"];
    _arrPlaces = [[NSArray alloc] initWithContentsOfFile:pListPath];
    NSLog(@"_arrPlaces %d",_arrPlaces.count);
    [self.tableCafes reloadData];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PlaceIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *dictPlace = [self.arrPlaces objectAtIndex:indexPath.row];
    cell.textLabel.text = [dictPlace valueForKey:@"CafeName"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrPlaces.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dictPlace = [self.arrPlaces objectAtIndex:indexPath.row];
    EventViewController *objEventVC = [[EventViewController alloc] initWithNibName:@"EventViewController" bundle:nil];
    objEventVC.dictSelectedPlace = dictPlace;
    [self.navigationController pushViewController:objEventVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
