//
//  PartyJoinedMemberTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/16.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PartyJoinedMemberTableViewCell.h"
#import "CommonHeader.h"

@implementation PartyJoinedMemberTableViewCell

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
 
    
    
}


-(void)setModel:(PartyDetailInfoModel *)model{
    
    
    NSArray *btnNames= [NSArray arrayWithObjects:@"", nil];
    NSArray *btnImages = [NSArray arrayWithObjects:@"我的火喵2", @"我的火喵2",@"我的火喵2",@"我的火喵2",@"我的火喵2",@"我的火喵2",@"我的火喵2",nil];
    
    
    
    //定义总列数、每个九宫格的宽高
    NSInteger totalColumns=7;
    CGFloat appW=kScreen_Width/7;
    CGFloat appH=PartyJoinedMemberCell_Height;
    
    //根据arr1中数据数量来初始化并加载一个一个的UIVIew
    for (int index=0; index<7; index++) {
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
        btn.clipsToBounds = YES;
        btn.titleLabel.font = Font13;
        btn.titleColor = OneTextColor;
        btn.title = [NSString stringWithFormat:@"头像%d", index];
        [btn setImage:btnImages[index]];
        [UIButton ImageUptoLabelDown:btn margin:1*WIDTH_NIT];
        btn.imageView.layer.cornerRadius = btn.size.width/2;
        
        [btn addTarget:self action:@selector(btnAct:)];
        [appView addSubview:btn];
        
        [self addSubview:appView];
    }
    
}

#pragma mark --- 加入按钮点击实现
-(void)btnAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(partyJoinedMemberCellSelect2go:)]) {
        [self.delegate partyJoinedMemberCellSelect2go:tag];
        NSLog(@"点击头像");
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
