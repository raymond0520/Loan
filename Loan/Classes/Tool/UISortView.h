//
//  UISortView.h
//  Lottery
//
//  Created by administrator on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UISortViewdelegate <NSObject>
-(void)SelectedButtonClick;
@end

@interface UISortView : UIView
{
    NSArray  *    _titlearray; 
    int           _selectedIndex;
    int           _sortIndex;
    __weak id<UISortViewdelegate>  _delegate;
    BOOL          _isNeedSort; //是否需要排序
}
@property(nonatomic, retain)NSArray   *  titlearray;
@property(nonatomic, assign)int          selectedIndex;
@property(nonatomic, assign)int          sortIndex;
@property(nonatomic, weak)id<UISortViewdelegate> delegate;
@property(nonatomic, assign)BOOL         isNeedSort;

-(id)initWithFrame:(CGRect)frame element:(NSArray*)array;
-(id)initWithFrame:(CGRect)frame element:(NSArray*)array isNeedSort:(BOOL)issort;
@end
