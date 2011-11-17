//
//  ViewController.m
//  Autoline
//
//  Created by 澎 贾 on 11-11-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize userName;
@synthesize password;
@synthesize dateLabel;
@synthesize autoLogin;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self dateLabel].text = [self getCurDate];
}

- (void)viewDidUnload
{
    [self setUserName:nil];
    [self setPassword:nil];
    [self setDateLabel:nil];
    [self setAutoLogin:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)login:(id)sender {
    //添加后台验证代码
    //保存登录成功信息到本地数据库
    UserDAO *userDao = [[UserDAO alloc] init];
    if ([userDao getUserByUserId:userName.text] == NULL) {
        NSNumber *a =[[NSNumber alloc] initWithBool:autoLogin.selected];
        [userDao insert:userName.text :password.text :@"shmg" :a];
        NSLog(@"insert User success!");
    }
    
}

- (NSString *)getCurDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSDate *now = [NSDate date];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy.MM.dd"];
    NSMutableString *curDate = [[NSMutableString alloc] initWithString:[formater stringFromDate:now]];
    //待优化
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:now];
    int week = [comps weekday];
    switch (week) {
        case 1:
            [curDate appendString:@" 星期日"];
            break;
        case 2:
            [curDate appendString:@" 星期一"];
            break;
        case 3:
            [curDate appendString:@" 星期二"];
            break;
        case 4:
            [curDate appendString:@" 星期三"];
            break;
        case 5:
            [curDate appendString:@" 星期四"];
            break;
        case 6:
            [curDate appendString:@" 星期五"];
            break;
        case 7:
            [curDate appendString:@" 星期六"];
            break;
        default:
            break;
    }
    return curDate;
}

@end
