//
//  ViewController.h
//  Autoline
//
//  Created by 澎 贾 on 11-11-8.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDAO.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UISwitch *autoLogin;
- (IBAction)login:(id)sender;
- (NSString *)getCurDate;

@end
