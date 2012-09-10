//
//  CLViewController.m
//  HelpPrac02
//
//  Created by Jiyeon Seo on 12. 9. 7..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import "CLViewController.h"
#import "CLDetailViewCell.h"

@interface CLViewController ()
{
    NSArray *titleArray;
    NSArray *detailArray;
}
@end

@implementation CLViewController
@synthesize listTableView;

- (void)viewWillAppear:(BOOL)animated { //1. 
    [super viewWillAppear:animated];
    selectedIndex=-1;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // sync 방식으로 나중엔 바궛!
    titleArray =[ [NSArray alloc] initWithObjects:@"title1",@"title2", @"title3",@"title4",@"title5",@"title6",@"title7",@"title8",@"title9",@"title10",nil ];
    detailArray = [[NSArray alloc]initWithObjects:@"detail1",@"detail2", @"detail3",@"detail4",@"detail5",@"detail6",@"detail7",@"detail8",@"detail9",@"detail10",nil ];
    listTableView.rowHeight = 40.0;

}

- (void)viewDidUnload
{
 
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - TableView Delegate 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"numberofrowinsection = %d",[titleArray count]);
//    return [titleArray count];
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//	
//    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.section];

    CLDetailViewCell *cell = (CLDetailViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if(cell==nil){
    
        NSArray *topLevelObject = [[NSBundle mainBundle]loadNibNamed:@"CLDetailViewCell" owner:nil options:nil];
        for(id currentObject in topLevelObject){
                if([currentObject isKindOfClass:[UITableViewCell class]]){
                    cell = (CLDetailViewCell *)currentObject;
                    break;
                }
            }
    }
    cell.titleLabel.text = [titleArray objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text = [detailArray objectAtIndex:[indexPath row]];

    
    
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	selectedIndex = indexPath.section;
    
    
	[tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
//    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
//	[tableView reloadData];
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return (indexPath.section==selectedIndex)? 150   : 40;
}


//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"cellForRowAtIndexPath");
//
//    static NSString *CellIdentifier = @"Cell";
////    UITableViewCell *cell = [listTableView]
//    CLDetailViewCell *cell = (CLDetailViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    CLDetailViewCell *cell1 = [[CLDetailViewCell alloc]init];
////    if(cell==nil){
//        
//        NSArray *topLevelObject = [[NSBundle mainBundle]loadNibNamed:@"CLDetailViewCell" owner:nil options:nil];
//        for(id currentObject in topLevelObject){
//            if([currentObject isKindOfClass:[UITableViewCell class]]){
//                cell = (CLDetailViewCell *)currentObject;
//                break;
//            }
//        }
//        
////    }
//    
//    
//    
//    cell.titleLabel.text = [titleArray objectAtIndex:[indexPath row]];
//    cell.detailTextLabel.text = [detailArray objectAtIndex:[indexPath row]];
//    
//    return cell;
//
//}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
	
//	[listTableView reloadData];
//}ㄴ
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	if (nOnOffCell) {
//		if (nIndex == indexPath.row)
//			return 100.0;
//	} else {
//		
//	}
//
//    CLDetailViewCell *viewCell = [[CLDetailViewCell alloc]init];
    
//    CGSize viewHeight =[viewCell g];
    
//    CGSize size = [text sizeWithFont:cell.contentTextview.font constrainedToSize:CGSizeMake(310, 2000) lineBreakMode:UILineBreakModeWordWrap];

    //cell의 크기를 가져오자! 


//    CGPoint offset = [[self tableView] contentOffset];
//    NSIndexPath* indexPath = [[self tableView] indexPathForRowAtPoint:CGPointMake(0,offset.y)];
//    CGFloat preCellOffset = [[[self tableView] cellForRowAtIndexPath:indexPath] origin].y;
    
//	return 40.0;
//}
@end
