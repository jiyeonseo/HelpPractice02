//
//  CLViewController.h
//  HelpPrac02
//
//  Created by Jiyeon Seo on 12. 9. 7..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *listTableView;
    NSInteger selectedIndex;
}
@property (nonatomic, strong) IBOutlet UITableView *listTableView;
@end
