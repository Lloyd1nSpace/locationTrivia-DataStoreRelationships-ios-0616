//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Lloyd W. Sykes on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsDataStore.h"

@interface FISAddLocationViewController ()

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameField.accessibilityIdentifier = @"nameField";
    self.nameField.accessibilityLabel = @"nameField";
    self.latitudeField.accessibilityIdentifier = @"latitudeField";
    self.latitudeField.accessibilityLabel = @"latitudeField";
    self.longitudeField.accessibilityIdentifier = @"longitudeField";
    self.longitudeField.accessibilityLabel = @"longitudeField";
    self.saveButton.accessibilityIdentifier = @"saveButton";
    self.saveButton.accessibilityLabel = @"saveButton";
    self.cancelButton.accessibilityIdentifier = @"cancelButton";
    self.cancelButton.accessibilityLabel = @"cancelButton";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)saveButtonTapped:(id)sender {
    
    FISLocationsDataStore *newData = [FISLocationsDataStore sharedLocationsDataStore];
    // Calling the sharedLocationsDataStore method ensures we're constantly accessing the same information accross all classes.
    
    FISLocation *newLocation = [[FISLocation alloc] initWithName:self.nameField.text latitude:[self.latitudeField.text floatValue] longitude:[self.longitudeField.text floatValue]];
    
    [newData.locations addObject:newLocation];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
