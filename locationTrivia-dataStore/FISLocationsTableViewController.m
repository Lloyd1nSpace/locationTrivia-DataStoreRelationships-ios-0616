//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Lloyd W. Sykes on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocationsDataStore.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()

@property (strong, nonatomic) FISLocationsDataStore *store;
@property (strong, nonatomic) FISLocation *location;
@property (strong, nonatomic) FISTrivium *trivia;

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
    // Very important to initialize the datastore in the viewDidLoad of the main view controller. As this will be the dataStore the rest of the classes access & add to.
    
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.store.locations.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellInfo"];
    
    FISLocation *location = self.store.locations[indexPath.row];
    cell.textLabel.text = location.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", location.trivia.count];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"trivia"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FISTriviaTableViewController *triviaDetailDestination = (FISTriviaTableViewController *)segue.destinationViewController;
        FISLocation *triviaLocation = self.store.locations[indexPath.row];
        triviaDetailDestination.location = triviaLocation;
        
    }
    
}

@end
