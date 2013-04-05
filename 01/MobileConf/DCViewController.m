//
//  DCViewController.m
//  MobileConf
//
//  Created by Diego Chohfi on 4/4/13.
//  Copyright (c) 2013 Diego Chohfi. All rights reserved.
//

#import "DCViewController.h"
@implementation DCViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                   reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row numero %i", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Section numero %i", indexPath.section];
    return cell;
}
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"%i", section];
}
@end
