//
//  FISAddTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Lloyd W. Sykes on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaTableViewController.h"
#import "FISLocationsDataStore.h"
#import "FISLocationsTableViewController.h"

@interface FISAddTriviaTableViewController ()

@property (strong, nonatomic) FISLocation *location;
@property (strong, nonatomic) FISLocationsTableViewController *locationSelected;

@end

@implementation FISAddTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.triviumTextField.accessibilityIdentifier = @"Trivium TextField";
    self.triviumTextField.accessibilityLabel = @"Trivium TextField";
    self.cancelButton.accessibilityIdentifier = @"Cancel Button";
    self.cancelButton.accessibilityLabel = @"Cancel Button";
    self.saveButton.accessibilityIdentifier = @"Save Button";
    self.saveButton.accessibilityLabel = @"Save Button";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    // Utilized dismissViewControllerAnimated: completion: method since this particular view controller doesn't have a navigration controller associated with it.
    
}

- (IBAction)saveButtonTapped:(id)sender {
    //When the submit button is tapped, add use the text field to create a new FISTrivium object with zero likes. Add the this new trivium to the relevant FISLocation object that was passed to the FISTriviaTableViewController. Then dismiss the view controller
    
    FISLocationsDataStore *dataStore = [FISLocationsDataStore sharedLocationsDataStore];
    
    NSIndexPath *indexPath = [self.locationSelected.tableView indexPathForSelectedRow];
    // In order to figure out which row was selected, I had to refer to the FISLocationsTableViewController and define an index path.
    
    FISTrivium *newTrivia = [[FISTrivium alloc] initWithContent:self.triviumTextField.text likes:0];
    FISLocation *location = dataStore.locations[indexPath.row];
    
    [location.trivia addObject:newTrivia];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
