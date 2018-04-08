//
//  MasterViewController.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "MasterViewController.h"
#import "CakeCell.h"
#import "CLCake.h"
#import "UIImage+ImageCache.h"

#import "constant.h"

@interface MasterViewController ()
@property (strong, nonatomic) NSMutableArray* cakeList;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cakeList = [NSMutableArray array];
    
    [self getData];
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cakeList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CakeCell *cell = (CakeCell*)[tableView dequeueReusableCellWithIdentifier:@"CakeCell"];
    
    CLCake *t_cake = self.cakeList[indexPath.row];
    
    cell.titleLabel.text = t_cake.title;
    cell.descriptionLabel.text = t_cake.desc;
 
    // lazy loading:
    UIImage* img = [UIImage cachedImageByURLStr:t_cake.imageStr];
    if(img){
        cell.cakeImageView.image = img;
    }else {
        // async download the image and store it in cache, update the UI in the main thread.
    }
    
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
                                   CLCake* cakeObj = [CLCake createWithTitle:cake[@"title"]
                                                                 Description:cake[@"desc"]
                                                                    andImage:cake[@"image"]];
                                   [_cakeList addObject:cakeObj];
                               }
                               
                               // update the table view
                               [self.tableView reloadData];
                           }];
    
}

@end
