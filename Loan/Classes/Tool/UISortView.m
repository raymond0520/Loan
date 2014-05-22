//
//  UISortView.m
//  Lottery
//
//  Created by administrator on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UISortView.h"

#define  TAG_BUTTON_START  5
#define  TAG_SELECTED_START 100
#define  TAG_SORT_START_ACCESS  50
@implementation UISortView
@synthesize titlearray = _titlearray;
@synthesize selectedIndex = _selectedIndex;
@synthesize sortIndex = _sortIndex;
@synthesize delegate = _delegate;
@synthesize isNeedSort = _isNeedSort;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
          [self InitUI];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame element:(NSArray*)array
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titlearray = array;
           _isNeedSort = YES;
        [self InitUI];
        _selectedIndex = 1;
        _sortIndex = 0 ;
     
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame element:(NSArray*)array isNeedSort:(BOOL)issort
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titlearray = array;
        [self InitUI];
        _selectedIndex = 1;
        _sortIndex = 0 ;
        _isNeedSort = issort;
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
  /* UIImage * image = [UIImage imageNamed:@"Selectedbg.png"];//
	UIImage * strImg = [image stretchableImageWithLeftCapWidth:image.size.width/2  topCapHeight:image.size.height/2];
    
	[strImg drawInRect:rect];*/
}

-(void)InitUI
{
    //先放一个背景图
    self.backgroundColor = [UIColor clearColor];
    
    int count = 0 ;
    if(self.titlearray != nil)
    {
        count = [self.titlearray count];
    }
    int width = (self.frame.size.width) /count;
    for(int i = 0 ; i < count ; i ++)
    {
        //CGRect rect = CGRectMake(2 + i*width, 1, width-1, self.frame.size.height －2);
        CGRect rect =CGRectMake(i*(width), 0, width, self.frame.size.height);
        UIButton * button =  [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[self.titlearray objectAtIndex:i] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [button setTitleColor:RGBACOLOR(51, 51, 51, 1) forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];//(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
        // button.backgroundColor = [UIColor blackColor];
        UIImage * image;
     /*   if(i ==0 )
        {
            image = [UIImage imageNamed:@"menu_bg_left_normal.png"];
        }
        else if(i == count -1)
        {
            image = [UIImage imageNamed:@"menu_bg_right_normal.png"];
        }
        else 
        {
            image = [UIImage imageNamed:@"menu_bg_middle_normal.png"];
        }*/
        image = [UIImage imageNamed:@"tabmenu_nomal.png"];
        UIImage* image1= [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
        [button setBackgroundImage:image1 forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickbutton:) forControlEvents:UIControlEventTouchUpInside];
        button.frame= rect;
        button.tag = i +TAG_BUTTON_START ;
        [self addSubview:button];
        
        NSString * str = @"up2.png";
        if(i == 0 ) // 先默认以第一个按钮为选中按钮
        {
            button.tag = TAG_BUTTON_START + TAG_SELECTED_START;
            UIImage * imagepressed = [UIImage imageNamed:@"tabmenu_current.png"];
            UIImage * strimagepressed = [imagepressed stretchableImageWithLeftCapWidth:imagepressed.size.width/2 topCapHeight:imagepressed.size.height/2];
            [button setBackgroundImage:strimagepressed forState:UIControlStateNormal];
            [button setTitleColor:RGBACOLOR(197, 2, 1, 1) forState:UIControlStateNormal];
            str = @"up1.png";
        }
        
        //每个按钮上加一个小箭头图标
        UIImage  * upimage= [UIImage imageNamed:str];
         UIImageView * sortImage = [[UIImageView alloc] initWithImage:upimage];
        sortImage.tag = button.tag % TAG_SELECTED_START + TAG_SORT_START_ACCESS;
        sortImage.frame = CGRectMake( width -30,8, 10, 10);
        [button addSubview:sortImage];
        if(_isNeedSort == NO)
        {
            sortImage.hidden = YES;
        }
    }
}
-(void)clickbutton:(id)sender
{
    UIButton * button  = (UIButton *)sender;
    int index= button.tag;
    if(index > TAG_SELECTED_START) //此按钮已经被选中，需要将箭头反向
    {
      
        int tag = index %TAG_SELECTED_START + TAG_SORT_START_ACCESS;
        UIImageView * sortImage = (UIImageView *)[button viewWithTag:tag];
        if(_sortIndex == 0) //目前是升序列，调整为降序
        {
            UIImage  * downimage= [UIImage imageNamed:@"down1.png"];
            sortImage.image = downimage;
            _sortIndex =1;
        }else {
             UIImage  * upimage= [UIImage imageNamed:@"up1.png"];
            sortImage.image = upimage;
            _sortIndex =0;
        }
    }else { 
        
         //将原来选中的按钮设置为没有选中
        UIButton * button1 = (UIButton*)[self viewWithTag:(_selectedIndex -1) +TAG_BUTTON_START +TAG_SELECTED_START];
       
        UIImage * imageNormal= [UIImage imageNamed:@"tabmenu_nomal.png"];
        UIImage * strimageNormal = [imageNormal stretchableImageWithLeftCapWidth:imageNormal.size.width/2 topCapHeight:imageNormal.size.height/2];
        [button1 setBackgroundImage:strimageNormal forState:UIControlStateNormal];
        [button1 setTitleColor:RGBACOLOR(51, 51, 51, 1) forState:UIControlStateNormal];
        int tag1 = button1.tag %TAG_SELECTED_START + TAG_SORT_START_ACCESS;
        UIImageView * sortImage1 = (UIImageView *)[button1 viewWithTag:tag1];
        UIImage  * upimage1= [UIImage imageNamed:@"up2.png"];
        sortImage1.image = upimage1;
        button1.tag = (_selectedIndex -1) +TAG_BUTTON_START;
        //将此按钮设置为被选中
        UIImage * imagepressed = [UIImage imageNamed:@"tabmenu_current.png"];
        UIImage * strimagepressed = [imagepressed stretchableImageWithLeftCapWidth:imagepressed.size.width/2 topCapHeight:imagepressed.size.height/2];
        [button setBackgroundImage:strimagepressed forState:UIControlStateNormal];
        [button setTitleColor:RGBACOLOR(197, 2, 1, 1) forState:UIControlStateNormal];
        button.tag = index + TAG_SELECTED_START;
        _selectedIndex = index +1  -TAG_BUTTON_START ;
        
        int tag = button.tag %TAG_SELECTED_START + TAG_SORT_START_ACCESS;
        UIImageView * sortImage = (UIImageView *)[button viewWithTag:tag];
        UIImage  * upimage= [UIImage imageNamed:@"up1.png"];
        sortImage.image = upimage;
        _sortIndex = 0;
        
    }
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(SelectedButtonClick)])
    {
        [self.delegate SelectedButtonClick];
        return;
    }
}

-(void)setButtonName:(NSString*)name index:(int)index
{
    UIButton * button = (UIButton *)[self viewWithTag:index + TAG_BUTTON_START];
    [button setTitle:name forState:UIControlStateNormal];
}
@end
