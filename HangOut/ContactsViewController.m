//
//  ContactsViewController.m
//  HangOut
//
//  Created by Sarabjeet Gaba on 12/14/13.
//  Copyright (c) 2013 sapient. All rights reserved.
//

#import "ContactsViewController.h"

#import <AddressBook/AddressBook.h>
#import "Person.h"

@interface ContactsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableContacts;
@property (nonatomic, strong) NSMutableArray *tableData;
@end

@implementation ContactsViewController

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
    
    self.tableData = [[NSMutableArray alloc] init];
    
    // Request authorization to Address Book
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            if (granted) {
                // First time access has been granted, add the contact
                [self getPersonOutOfAddressBook];
            } else {
                // User denied access
                // Display an alert telling user the contact could not be added
            }
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        // The user has previously given access, add the contact
        [self getPersonOutOfAddressBook];
    }

}

- (void)getPersonOutOfAddressBook
{
    //1
    CFErrorRef error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    
    if (addressBook != nil) {
        NSLog(@"Succesful.");
        
        //2
        NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
        NSLog(@"allContacts %@",allContacts);
        
        
        //3
        NSUInteger i = 0; for (i = 0; i < [allContacts count]; i++)
        {
            Person *person = [[Person alloc] init];
            ABRecordRef contactPerson = (__bridge ABRecordRef)allContacts[i];
            
            //4
            NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson,
                                                                                  kABPersonFirstNameProperty);
            NSString *lastName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonLastNameProperty);
            NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
            
            person.firstName = firstName; person.lastName = lastName;
            person.fullName = fullName;
            
            //email
            //5
            ABMultiValueRef emails = ABRecordCopyValue(contactPerson, kABPersonEmailProperty);
            
            //6
            NSUInteger j = 0;
            for (j = 0; j < ABMultiValueGetCount(emails); j++) {
                NSString *email = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emails, j);
                if (j == 0) {
                    person.homeEmail = email;
                    NSLog(@"person.homeEmail = %@ ", person.homeEmail);
                }
                else if (j==1) person.workEmail = email;
            }
            
            //7
            [self.tableData addObject:person];
        }
        [self.tableContacts reloadData];
        //8
        CFRelease(addressBook);
    } else {
        //9
        NSLog(@"Error reading Address Book");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ContactIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Person *person = [self.tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = person.fullName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
