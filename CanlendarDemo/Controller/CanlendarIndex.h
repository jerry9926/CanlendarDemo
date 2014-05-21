//
//  CanlendarIndex.h
//  CanlendarDemo
//
//  Created by ray on 5/12/14.
//  Copyright (c) 2014 kuler huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanlendarCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayOfMonth;


@end

@interface CanlendarIndex : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end
