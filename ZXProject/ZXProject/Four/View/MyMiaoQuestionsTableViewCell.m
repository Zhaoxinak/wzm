//
//  MyMiaoQuestionsTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/3.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "MyMiaoQuestionsTableViewCell.h"
#import "CommonHeader.h"


@implementation MyMiaoQuestionsTableViewCell

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
    bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, MyMiaoQuestionsCell_Height-5*WIDTH_NIT, kScreen_Width, 5*WIDTH_NIT)];
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
    myReply = [[UILabel alloc]init];
    myReply.font = ThreeFont;
    myReply.textColor = OneTextColor;
    myReply.text = @"我的回复我的回复我的回";
    [self addSubview:myReply];
    

}



#pragma mark --- 对接数据
-(void)setModel:(MyMiaoQuestionsModel *)model setMode:(MyMiaoQuestionsCellMode)mode{
    
    _model = model;
    _mode = mode;
    
    picView.hidden = YES;
    name.hidden = YES;
    time.hidden = YES;
    myReply.hidden = YES;
    topLine.hidden = YES;
    
    
    switch (mode) {
        case AskCellMode:{
            
            picView.hidden = NO;
            name.hidden = NO;
            time.hidden = NO;
            
            picView.frame = CGRectMake(kScreen_Width-MyMiaoQuestionsCell_Height, 5*WIDTH_NIT, MyMiaoQuestionsCell_Height-10*WIDTH_NIT, MyMiaoQuestionsCell_Height-10*WIDTH_NIT);
            
            name.frame =CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-picView.width-15*WIDTH_NIT, 40*WIDTH_NIT);
            
         
            time.frame = CGRectMake(5*WIDTH_NIT, name.bottom+5*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
        }
            
            break;
            
        case AnswerCellMode:{
            
            name.hidden = NO;
            time.hidden = NO;
            myReply.hidden = NO;
            topLine.hidden = NO;
            
            
            myReply.frame = CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width/3*2-10*WIDTH_NIT, 20*WIDTH_NIT);
            
            time.frame = CGRectMake(myReply.right + 5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width/3-10*WIDTH_NIT, 20*WIDTH_NIT);
            
            topLine.frame = CGRectMake(0, myReply.bottom, kScreen_Width, 1*WIDTH_NIT);
            
            name.frame =CGRectMake(10*WIDTH_NIT, topLine.bottom+5*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 40*WIDTH_NIT);
         
        }
            
            break;
            
        default:
            break;
    }
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
