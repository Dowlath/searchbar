//
//  tableViewController.m
//  searchbar
//
//  Created by BSA Univ3 on 15/03/14.
//  Copyright (c) 2014 BSA Univ3. All rights reserved.
//

#import "tableViewController.h"

@interface tableViewController ()
@property (nonatomic,copy)NSDictionary *names;
@property (nonatomic,copy)NSArray *keys;
@property (nonatomic,copy)NSMutableArray *filterednames;
@property (nonatomic,strong)UISearchDisplayController *searchcontroller;

@end

@implementation tableViewController
@synthesize names,keys,filterednames,searchcontroller;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableview=(id)[self.view viewWithTag:1];
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    filterednames=[[NSMutableArray alloc]init];
    searchcontroller=[[UISearchDisplayController alloc]init];
    searchcontroller.searchResultsDataSource=self;
    NSString *path=[[NSBundle mainBundle]pathForResource:@"names" ofType:@"plist"];
    names =[NSDictionary dictionaryWithContentsOfFile:path];
    keys =[[names allKeys]sortedArrayUsingSelector:@selector(compare:)];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag==1) {
        
         return [keys count];
    }else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==1) {
        NSString *key=keys[section];
        NSArray *keyvalues=names[key];
        return [keyvalues count];
    }
    else
    {
        return [filterednames count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (tableView.tag==1) {
        NSString *key = keys[indexPath.section];
        NSArray *keyvalues=names[key];
        cell.textLabel.text=keyvalues[indexPath.row];

    }
else
{
    cell.textLabel.text=filterednames[indexPath.row];
}
    return cell;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView.tag==1) {
    return keys;
    }else
    {
        return nil;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView.tag==1) {
        return keys[section];
    }
    else
    {
        return nil;
    }
}
#pragma mark Search Display Delegate Methods

-(void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [filterednames removeAllObjects];
    if (searchString.length > 0) {
        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF contains [search] %@",self.SearchBar.text];
        for (NSString *key in keys) {
            NSArray *matches =[names[key]filteredArrayUsingPredicate:predicate];
            [filterednames addObjectsFromArray:matches];
        }
    }
    return YES;
}

@end
