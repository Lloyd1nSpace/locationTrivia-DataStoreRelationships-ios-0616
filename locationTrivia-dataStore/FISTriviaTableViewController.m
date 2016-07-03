//
//  FISTriviaTableViewController.m
//
//
//  Created by Lloyd W. Sykes on 7/1/16.
//
//

#import "FISTriviaTableViewController.h"
#import "FISLocationsDataStore.h"

@interface FISTriviaTableViewController ()

@property (strong, nonatomic) FISLocationsDataStore *store;

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Trivia Table";
    self.tableView.accessibilityIdentifier = @"Trivia Table";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    // Have to remember to utilize this reloadData method is super important to ensure information is getting updated in your view. Also I much prefer viewWillAppear method as opposed to viewDidAppear which actually will cause the user to see the information update in front of them as opposed to before the view loads (much smoother).
    
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
    
    return self.location.trivia.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"triviaTable"];
    
    FISTrivium *trivia = self.location.trivia[indexPath.row];
    cell.textLabel.text = trivia.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", trivia.likes];
    
    return cell;
}

@end
