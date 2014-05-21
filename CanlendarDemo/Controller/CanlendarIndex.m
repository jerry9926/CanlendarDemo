//
//  CanlendarIndex.m
//  CanlendarDemo
//
//  Created by ray on 5/12/14.
//  Copyright (c) 2014 kuler huang. All rights reserved.
//

#import "CanlendarIndex.h"
#import "NSDate+String.h"

@implementation CanlendarCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		[self setBackgroundColor:[[UIColor alloc] initWithRed:255/255 green:255/255 blue:255/255 alpha:1]];
    }
    return self;
}

@end

@interface CanlendarIndex ()
{
	int firstDayOfWeek;
	int lengthOfMonth;
}

@end

@implementation CanlendarIndex

- (void) viewDidLoad
{
	[super viewDidLoad];
	
	[self loadThisMonthData];
	NSLog(@"viewdidload");
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSLog(@"numberOfSectionsInCollectionView");
	return 1;
}

- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"cellForItemAtIndexPath");
	CanlendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CanlendarCell" forIndexPath:indexPath];
	if (indexPath.row >firstDayOfWeek) {
		cell.dayOfMonth.text = [[NSString alloc] initWithFormat:@"%d",indexPath.row - firstDayOfWeek];
	}
	
	return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	NSLog(@"numberOfItemsInSection");
	return 35;
}

# pragma mark - Pivate Function

- (void)loadThisMonthData
{
	firstDayOfWeek = [self dayOfWeek:[NSDate convertDateFromString:@"2014-05"]];
	lengthOfMonth = [self monthLength:[ NSDate date]];
}

- (NSInteger)dayOfWeek:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:date];
    NSUInteger dayOfWeek = range.length;
    return dayOfWeek;
}

- (NSInteger)monthLength:(NSDate *)date
{
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	return [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
}

@end
