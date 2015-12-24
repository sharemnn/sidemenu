//
//  RightViewController.m
//  MNSideMenu
//
//  Created by mnn on 15/12/24.
//  Copyright © 2015年 mnn. All rights reserved.
//

#import "RightViewController.h"
#import "AppDelegate.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    [self.view setBackgroundColor:[UIColor clearColor]];
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(130, 0, 240, 300) style:UITableViewStylePlain];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    tableview.delegate   = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == Nil) {
        cell = [[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"test%ld",indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIViewController *controller1 = [[UIViewController alloc]init];
        [controller1.view setBackgroundColor:[UIColor redColor]];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller1];
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        //在主界面上进行跳转
        [delegate.menuViewController pushToNewViewController:controller1 animation:NO];
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];//取消cell的选中效果
    }else if(indexPath.row == 1){
        UIViewController *controller2 = [[UIViewController alloc]init];
        [controller2.view setBackgroundColor:[UIColor blueColor]];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller2];
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        //更换主界面
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }else{
        UIViewController *controller3 = [[UIViewController alloc]init];
        [controller3.view setBackgroundColor:[UIColor magentaColor]];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller3];
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.menuViewController setNewRootViewController:nav animation:YES];
    }
}

@end
