//
//  tableViewController.h
//  searchbar
//
//  Created by BSA Univ3 on 15/03/14.
//  Copyright (c) 2014 BSA Univ3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *SearchBar;

@end
