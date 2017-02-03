//
//  MyPartyTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/3.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "MyPartyTableViewCell.h"
#import "CommonHeader.h"

@implementation MyPartyTableViewCell

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
    
    //顶部分割线
    topLine = [[UIView alloc]init];
    topLine.backgroundColor = BGColor;
    [self addSubview:topLine];
    
    //底部分割线
    bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, MyPartyCell_Height-5*WIDTH_NIT, kScreen_Width, 5*WIDTH_NIT)];
    bottomLine.backgroundColor = BGColor;
    [self addSubview:bottomLine];
    
    
    //图片
    picView = [[UIImageView alloc]init];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    //标题
    name = [[UILabel alloc]init];
    name.numberOfLines = 2;
    name.font = TwoFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //时间
    time = [[UILabel alloc]init];
    time.font = ThreeFont;
    time.textColor = OneTextColor;
    time.text = @"时间时间";
    [self addSubview:time];
    
    
    //我的回复
    address = [[UILabel alloc]init];
    address.font = ThreeFont;
    address.textColor = OneTextColor;
    address.text = @"地址地址地址";
    [self addSubview:address];
    
    
    //参加费用
    money = [[UILabel alloc]init];
    money.font = ThreeFont;
    money.textColor = OneTextColor;
    money.text = @"180元／人";
    [self addSubview:money];
    
    //状态
    status = [[UILabel alloc]init];
    status.font = ThreeFont;
    status.textColor = OneTextColor;
    status.text = @"活动进行中";
    [self addSubview:status];
    
    //编辑
    editBtn = [[UIButton alloc]init];
    editBtn.tag = 0;
    editBtn.layer.borderWidth = 1;
    editBtn.layer.borderColor = [UIColor blackColor].CGColor;
    [editBtn setTitle:@"编辑"];
    [editBtn setTitleColor:OneTextColor];
    [editBtn addTarget:self action:@selector(editAct:)];
    [self addSubview:editBtn];
    
    //参与者
    memberBtn = [[UIButton alloc]init];
    memberBtn.tag = 1;
    memberBtn.layer.borderWidth = 1;
    memberBtn.layer.borderColor = [UIColor blackColor].CGColor;
    [memberBtn setTitle:@"报名者"];
    [memberBtn setTitleColor:OneTextColor];
    [memberBtn addTarget:self action:@selector(memberAct:)];
    [self addSubview:memberBtn];
}



#pragma mark --- 对接数据
-(void)setModel:(MyPartyModel *)model setMode:(MyPartyCellMode)mode{
    
    _model = model;
    _mode = mode;
    
    topLine.hidden = YES;
    picView.hidden = YES;
    name.hidden = YES;
    time.hidden = YES;
    address.hidden = YES;
    money.hidden = YES;
    status.hidden = YES;
    editBtn.hidden = YES;
    memberBtn.hidden = YES;
    
    
    switch (mode) {
        case JoinPartyCellMode:{
            
            picView.hidden = NO;
            name.hidden = NO;
            time.hidden = NO;
            address.hidden = NO;
            money.hidden = NO;
            status.hidden = NO;
            
            
            picView.frame = CGRectMake(kScreen_Width-MyPartyCell_Height, 5*WIDTH_NIT, MyPartyCell_Height-10*WIDTH_NIT, MyPartyCell_Height-10*WIDTH_NIT);
            
            name.frame =CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-picView.width-15*WIDTH_NIT, 40*WIDTH_NIT);
            
            
            time.frame = CGRectMake(5*WIDTH_NIT, name.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            address.frame =  CGRectMake(5*WIDTH_NIT, time.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            money.frame =  CGRectMake(address.right + 5*WIDTH_NIT, time.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3-10*WIDTH_NIT, 20*WIDTH_NIT);
            
            status.frame =  CGRectMake(5*WIDTH_NIT, money.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            
        }
            
            break;
            
        case OwnerPartyCellMode:{
            
            picView.hidden = NO;
            name.hidden = NO;
            time.hidden = NO;
            address.hidden = NO;
            money.hidden = NO;
            editBtn.hidden = NO;
            memberBtn.hidden = NO;
            
            
            picView.frame = CGRectMake(kScreen_Width-MyPartyCell_Height, 5*WIDTH_NIT, MyPartyCell_Height-10*WIDTH_NIT, MyPartyCell_Height-10*WIDTH_NIT);
            
            name.frame =CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-picView.width-15*WIDTH_NIT, 40*WIDTH_NIT);
            
            
            time.frame = CGRectMake(5*WIDTH_NIT, name.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            address.frame =  CGRectMake(5*WIDTH_NIT, time.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            money.frame =  CGRectMake(address.right + 5*WIDTH_NIT, time.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3-10*WIDTH_NIT, 20*WIDTH_NIT);
            
            editBtn.frame =  CGRectMake(20*WIDTH_NIT, money.bottom+5*WIDTH_NIT, 60*WIDTH_NIT, 20*WIDTH_NIT);
            
            memberBtn.frame =  CGRectMake(editBtn.right + 20*WIDTH_NIT, money.bottom+5*WIDTH_NIT, 60*WIDTH_NIT, 20*WIDTH_NIT);
            
        }
            
            break;
            
        default:
            break;
    }
    
    
    
}

#pragma mark --- 编辑
-(void)editAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(MyPartyCellSelect2go:)]) {
        [self.delegate MyPartyCellSelect2go:tag];
        NSLog(@"跳转 %ld",(long)tag);
    }
    
}

#pragma mark --- 报名者
-(void)memberAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(MyPartyCellSelect2go:)]) {
        [self.delegate MyPartyCellSelect2go:tag];
        NSLog(@"跳转 %ld",(long)tag);
    }
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
