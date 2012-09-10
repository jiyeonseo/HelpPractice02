//
//  CLDetailViewCell.h
//  HelpPrac02
//
//  Created by Jiyeon Seo on 12. 9. 7..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLDetailViewCell : UITableViewCell
{
    UILabel *titleLabel;
    UITextView *detailTextView;
}
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UITextView *detailTextView;
@end
