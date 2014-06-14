//
//  ViewController.m
//  Plists
//
//  Created by Ricardo Reyes on 6/14/14.
//  Copyright (c) 2014 Ricardo Reyes. All rights reserved.
//

#import "ViewController.h"
#import "Alumnus.h"
#import "EditViewController.h"

NSString *const kAlumniCellIdentifier = @"AlumniCell";
NSString *const kPlistName = @"alumni.plist";
NSString *const kEditSegue = @"EditAlumnusSegue";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, EditViewControllerDelegate>
            
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *plist;
@property (strong, nonatomic) NSMutableArray *alumni;

@property (strong, nonatomic) NSString *path;

@end

@implementation ViewController

- (NSString *)path
{
    if (!_path)
    {
        NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        _path = [documents stringByAppendingPathComponent:kPlistName];
    }
    
    return _path;
}


- (NSMutableArray *)plist
{
    if (!_plist)
    {
        if ([[NSFileManager defaultManager] fileExistsAtPath:self.path])
        {
            _plist = [[NSMutableArray alloc] initWithContentsOfFile:self.path];
        }
        else
        {
            _plist = [NSMutableArray new];
        }
    }
    
    return _plist;
}

- (NSMutableArray *)alumni
{
    if (!_alumni) _alumni = [NSMutableArray new];
    return _alumni;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.plist enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        [self createAlumnus:obj];
    }];
}

- (void)createAlumnus:(NSString *)name
{
    Alumnus *alumnus = [[Alumnus alloc] initWithName:name];
    
    [self.alumni addObject:alumnus];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kEditSegue])
    {
        EditViewController *editVC = segue.destinationViewController;
        editVC.delegate = self;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.alumni count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Alumnus *alumnus = self.alumni[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAlumniCellIdentifier];
    cell.textLabel.text = alumnus.name;
    return cell;
}

- (void)saveName:(NSString *)name
{
    [self.plist addObject:name];
    [self.plist writeToFile:self.path atomically:YES];
    
    [self createAlumnus:name];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
