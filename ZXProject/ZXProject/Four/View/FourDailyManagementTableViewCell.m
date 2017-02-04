//
//  FourDailyManagementTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "FourDailyManagementTableViewCell.h"
#import "CommonHeader.h"


@implementation FourDailyManagementTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupView];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupView{

    NSArray *btnIamge = [NSArray arrayWithObjects:@"猫狗2", @"猫狗2", @"猫狗2", @"猫狗2", @"猫狗2", @"猫狗2",nil];
    NSArray *btnNames = [NSArray arrayWithObjects:@"收藏", @"认证", @"活动", @"喵问", @"帖子", @"心得",nil];
    
    
    //定义总列数、每个九宫格的宽高
    NSInteger totalColumns=3;
    CGFloat appW=kScreen_Width/3;
    CGFloat appH=FourDailyManagementCell_Height/2;
    
    //根据arr1中数据数量来初始化并加载一个一个的UIVIew
    for (int index=0; index<6; index++) {
        //计算这个app在几行几列
        int row=index/totalColumns;
        int col=index%totalColumns;
        //创建UIView
        UIView *appView=[[UIView alloc]init];
        //根据一些计算，确定不同UIView的位置
        appView.frame=CGRectMake(col*+appW, row*appH, appW, appH);
        appView.backgroundColor= [UIColor whiteColor];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, appView.width-10*WIDTH_NIT, appView.height-10*WIDTH_NIT)];
        btn.tag = index;
        btn.backgroundColor = [UIColor whiteColor];
        btn.titleLabel.font = ThreeFont;
        btn.titleColor = OneTextColor;
        btn.title = btnNames[index];
        btn.image = btnIamge[index];
        [UIButton ImageUptoLabelDown:btn margin:20*WIDTH_NIT];
        
        [btn addTarget:self action:@selector(buttonAct:)];
        [appView addSubview:btn];
        
        [self addSubview:appView];
    }

    
    
    

}






#pragma mark -- 012345分别为"收藏", @"认证", @"活动", @"问题", @"帖子", @"心得"
-(void)buttonAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(fourDailyManagementCellSelect2go:)]) {
        [self.delegate fourDailyManagementCellSelect2go:tag];
        NSLog(@"跳转 %ld",(long)tag);
    }
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
