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
    
    
    //活动类型
    typeName = [[UILabel alloc]init];
    typeName.textAlignment = NSTextAlignmentCenter;
    typeName.font = Font12;
    typeName.textColor = MainWhiteColor;
    typeName.text = @"比赛";
    [picView addSubview:typeName];
    
    
    
    
    //标题
    name = [[UILabel alloc]init];
    name.numberOfLines = 2;
    name.font = Font13;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //时间
    time = [[UILabel alloc]init];
    time.font = Font12;
    time.textColor = NameColor;
    time.text = @"时间时间时间时间时间时间";
    [self addSubview:time];
    
    
    //地址
    address = [[UILabel alloc]init];
    address.font = Font12;
    address.textColor = NameColor;
    address.text = @"地址地址地址地址地址地址地址地址地址地址地址地址";
    [self addSubview:address];
    
    
    //参加费用
    money = [[UILabel alloc]init];
    money.font = Font16;
    money.textColor = MainGoldColor;
    money.text = @"180元/人";
    money.adjustsFontSizeToFitWidth = YES;
    [self addSubview:money];
    
    //状态
    status = [[UILabel alloc]init];
    status.font = Font13;
    status.textColor = RGBColor(122, 186, 58, 1);
    status.text = @"活动进行中";
    [self addSubview:status];
    
    //编辑
    editBtn = [[UIButton alloc]init];
    editBtn.tag = 0;
    editBtn.layer.borderWidth = 0.5;
    editBtn.layer.borderColor = RGBColor(125, 129, 225, 1).CGColor;
    editBtn.layer.cornerRadius = 3;
    editBtn.titleLabel.font = Font12;
    [editBtn setTitle:@"编辑"];
    [editBtn setTitleColor:RGBColor(125, 129, 225, 1)];
    [editBtn addTarget:self action:@selector(editAct:)];
    [self addSubview:editBtn];
    
    //参与者
    memberBtn = [[UIButton alloc]init];
    memberBtn.tag = 1;
    memberBtn.layer.borderWidth = 0.5;
    memberBtn.layer.borderColor = RGBColor(122, 186, 58, 1).CGColor;
    memberBtn.layer.cornerRadius = 3;
    memberBtn.titleLabel.font = Font12;
    [memberBtn setTitle:@"报名清单"];
    [memberBtn setTitleColor:RGBColor(122, 186, 58, 1)];
    [memberBtn addTarget:self action:@selector(memberAct:)];
    [self addSubview:memberBtn];
    
}



#pragma mark --- 对接数据
-(void)setModel:(MyPartyModel *)model setMode:(MyPartyCellMode)mode{
    
    _model = model;
    _mode = mode;
    
    topLine.hidden = YES;
    picView.hidden = YES;
    typeName.hidden = YES;
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
            typeName.hidden = NO;
            name.hidden = NO;
            time.hidden = NO;
            address.hidden = NO;
            money.hidden = NO;
            status.hidden = NO;
            
            
            picView.frame = CGRectMake(kScreen_Width-130*WIDTH_NIT, 13*WIDTH_NIT, 115*WIDTH_NIT, 90*WIDTH_NIT);
            
            typeName.frame =CGRectMake(picView.width-35*WIDTH_NIT, 0, 35*WIDTH_NIT, 20*WIDTH_NIT);
            
            
            name.frame = CGRectMake(15*WIDTH_NIT, 15*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 40*WIDTH_NIT);
            
            
            time.frame = CGRectMake(15*WIDTH_NIT, name.bottom+15*WIDTH_NIT, (kScreen_Width-picView.width-30*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            address.frame =  CGRectMake(15*WIDTH_NIT, time.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-30*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            money.frame =  CGRectMake(address.right + 0*WIDTH_NIT, time.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3-10*WIDTH_NIT, 20*WIDTH_NIT);
            
            status.frame =  CGRectMake(15*WIDTH_NIT, money.bottom+15*WIDTH_NIT, (kScreen_Width-picView.width-30*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            
        }
            
            break;
            
        case OwnerPartyCellMode:{
            
            picView.hidden = NO;
            typeName.hidden = NO;
            name.hidden = NO;
            time.hidden = NO;
            address.hidden = NO;
            money.hidden = NO;
            status.hidden = NO;
            editBtn.hidden = NO;
            memberBtn.hidden = NO;
            
            
            picView.frame = CGRectMake(kScreen_Width-130*WIDTH_NIT, 13*WIDTH_NIT, 115*WIDTH_NIT, 90*WIDTH_NIT);
            
            typeName.frame =CGRectMake(picView.width-35*WIDTH_NIT, 0, 35*WIDTH_NIT, 20*WIDTH_NIT);
            
            name.frame = CGRectMake(15*WIDTH_NIT, 15*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 40*WIDTH_NIT);
            
            
            time.frame = CGRectMake(15*WIDTH_NIT, name.bottom+15*WIDTH_NIT, (kScreen_Width-picView.width-30*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            address.frame =  CGRectMake(15*WIDTH_NIT, time.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-30*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            money.frame =  CGRectMake(address.right + 0*WIDTH_NIT, time.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3-10*WIDTH_NIT, 20*WIDTH_NIT);
            
            status.frame =  CGRectMake(15*WIDTH_NIT, money.bottom+15*WIDTH_NIT, (kScreen_Width-picView.width-30*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
            
            editBtn.frame =  CGRectMake(kScreen_Width/2 + 10*WIDTH_NIT, money.bottom+7*WIDTH_NIT, 72*WIDTH_NIT, 28*WIDTH_NIT);
            
            memberBtn.frame =  CGRectMake(editBtn.right + 10*WIDTH_NIT, money.bottom+7*WIDTH_NIT, 72*WIDTH_NIT, 28*WIDTH_NIT);
            
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
