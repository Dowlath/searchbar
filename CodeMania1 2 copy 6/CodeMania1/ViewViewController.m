///Users/BSAUniv3/Desktop/CodeMania1 2 copy 4/CodeMania1/ViewViewController.h
//  ViewViewController.m
//  CodeMania1
//
//  Created by BSA univ 1 on 18/03/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//

#import "ViewViewController.h"
#import "M13Checkbox.h"
@interface ViewViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL check;
    M13Checkbox *customFrame1 ;
}
@property (nonatomic,strong) NSString * answer;

@end

@implementation ViewViewController

@synthesize qn,complixity,caste,buttonsArray,rootOfPlist,celltext,itsToDoChecked,current,answer
;

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
    
    _plistobj = [[PlistManager alloc]init];
    
    NSLog(@"question %@",qn);
     NSLog(@"complixity %@",complixity);
    NSLog(@"level %@",caste);
    buttonsArray=[[NSMutableArray alloc]init];
    buttonsArray=[_plistobj AppPlistWeekone:qn:complixity:caste];
    check=NO;
    NSLog(@"%@",[buttonsArray description]);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [buttonsArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [buttonsArray objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    M13Checkbox *allDefaults = [[M13Checkbox alloc] init];
    M13Checkbox *customFrame1 = [[M13Checkbox alloc] initWithFrame:CGRectMake(260,10,30,30)];
    [cell addSubview:customFrame1];
    [customFrame1 addTarget:self action:@selector(Comparethevalues:) forControlEvents:UIControlEventValueChanged];
    if(indexPath.row==0)
    {
        [customFrame1 setHidden:YES];
    }
    
    //[self.view addSubview:customFrame1];

    
//    BOOL checked =  [[buttonsArray objectAtIndex:indexPath.row] boolValue];
//    
//    UIImage *image = (checked) ? [UIImage imageNamed:@"checkmark copy.png"] : [UIImage imageNamed:@"check copy.png"];
//   
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    CGRect frame = CGRectMake(0.0, 0.0,20,20);
//    button.frame = frame;   // match the button's size with the image size
//    button.tag = indexPath.row;
//    [button setBackgroundImage:image forState:UIControlStateNormal];
//    
//    if(indexPath.row==0)
//    {
//        [button setHidden:YES];
//    }
//    // set the button's target to this table view controller so we can interpret touch events and map that to a NSIndexSet
//    
//    [button addTarget:self action:@selector(checkButton) forControlEvents:UIControlEventTouchUpInside];
//    cell.accessoryView = button;
    
    return cell;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [buttonsArray objectAtIndex:customFrame1.tag];
//    NSLog(@"%@",[buttonsArray objectAtIndex:customFrame1.tag]);
//    //NSLog(@"%d", indexPath.row); // you can see selected row number in your console;
//}


-(void) checkButton

{
    M13Checkbox *allDefaults = [[M13Checkbox alloc] init];
    M13Checkbox *customFrame1 = [[M13Checkbox alloc] initWithFrame:CGRectMake(260,80,30,30)];
    [self.view addSubview:customFrame1];
    
    
}
-(void)Comparethevalues:(id)sender
{
    NSIndexPath *indexPath = [self.tableview indexPathForCell:(UITableViewCell *)[[sender superview] superview]];
    
    answer=[NSString stringWithFormat:@"%ld",(long)indexPath.row];

    NSLog(@"xxxxxx %d",indexPath.row);
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    //[tableView reloadData];


//- (void) checkButtonTapped: (UIControl *) button withevent: (UIEvent *) event
//{


    BOOL checked = [[buttonsArray objectAtIndex:indexPath.row] boolValue];
    [buttonsArray removeObjectAtIndex:indexPath.row];
     [buttonsArray insertObject:(checked) ? @"False":@"True" atIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIButton *button = (UIButton *)cell.accessoryView;
    
    
    UIImage *newImage = (checked) ? [UIImage imageNamed:@"check.jpg"] : [UIImage imageNamed:@"checkmark.jpg"];
    [button setBackgroundImage:newImage forState:UIControlStateNormal];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                   style:UIBarButtonItemStylePlain target:self action:@selector(saveChecklist)];
    self.navigationItem.rightBarButtonItem = backButton;
   // [backButton release];
    
}

-(void)saveChecklist
{
    
}
- (IBAction)backButon:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)Submit:(id)sender {
    NSLog(@"result= %@",answer);
}
@end
