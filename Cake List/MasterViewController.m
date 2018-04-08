//
//  MasterViewController.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "MasterViewController.h"
#import "CakeCell.h"

#import "constant.h"

@interface MasterViewController ()
@property (strong, nonatomic) NSArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CakeCell *cell = (CakeCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSDictionary *object = self.objects[indexPath.row];
    cell.titleLabel.text = object[@"title"];
    cell.descriptionLabel.text = object[@"desc"];
 
    
    NSURL *aURL = [NSURL URLWithString:object[@"image"]];
    NSData *data = [NSData dataWithContentsOfURL:aURL];
    UIImage *image = [UIImage imageWithData:data];
    [cell.cakeImageView setImage:image];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)getData{
    
    NSURL *url = [NSURL URLWithString:kCakeListURL];
    
    NSURLRequest* fetchRequest = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:fetchRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
                               NSError* parseError = nil;
                               NSArray* rawList = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                               
                               for (NSDictionary* cake in rawList) {
                                   //TODO: put the cake data into a contianer.
                               }
                               
                               // update the table view
                               [self.tableView reloadData];
                           }];
    
}

@end
