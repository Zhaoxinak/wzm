//
//  NotesTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/24.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "NotesTableViewCell.h"
#import "CommonHeader.h"
@implementation NotesTableViewCell


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
    bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, NotesCell_Height-10*WIDTH_NIT, kScreen_Width, 10*WIDTH_NIT)];
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
    name.font = Font12;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //内容
    subName = [[UILabel alloc]init];
    subName.font = Font12;
    subName.textColor = NameColor;
    subName.text = @"音响改装吧";
    [self addSubview:subName];
    
    
    //时间
    time = [[UILabel alloc]init];
    time.font = Font12;
    time.textColor = NameColor;
    time.text = @"时间时间";
    [self addSubview:time];
    
    
    //我的回复
    myReply = [[UILabel alloc]init];
    myReply.font = Font12;
    myReply.textColor = NameColor;
    myReply.text = @"我的回复我的回复我的回";
    [self addSubview:myReply];
    
    
    //评论数
    commentBtn = [[UIButton alloc]init];
    [commentBtn setTitleColor:NameColor];
    [commentBtn setImage:@"猫狗2"];
    [commentBtn setTitle:@"11"];
    
    [self addSubview:commentBtn];
    
}



#pragma mark --- 对接数据
-(void)setModel:(NotesModel *)model setMode:(NotesCellMode)mode{
    
    _model = model;
    _mode = mode;
    
    picView.hidden = YES;
    name.hidden = YES;
    subName.hidden = YES;
    time.hidden = YES;
    myReply.hidden = YES;
    commentBtn.hidden = YES;
    topLine.hidden = YES;
    
    
    switch (mode) {
        case MainNoteCellMode:{
            
            picView.hidden = NO;
            name.hidden = NO;
            subName.hidden = NO;
            time.hidden = NO;
            
            picView.frame = CGRectMake(kScreen_Width-130*WIDTH_NIT, 10*WIDTH_NIT, 120*WIDTH_NIT, 90*WIDTH_NIT);
           
            name.frame =CGRectMake(10*WIDTH_NIT, 20*WIDTH_NIT, kScreen_Width-picView.width-20*WIDTH_NIT, 40*WIDTH_NIT);
            
            subName.frame = CGRectMake(10*WIDTH_NIT, name.bottom+20*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3, 20*WIDTH_NIT);
            
            time.frame = CGRectMake(subName.right + 5*WIDTH_NIT, name.bottom+20*WIDTH_NIT, (kScreen_Width-picView.width-15*WIDTH_NIT)/3*2-5*WIDTH_NIT, 20*WIDTH_NIT);
            
        }
            
            break;
       
        case FollowNoteCellMode:{
            
            name.hidden = NO;
            subName.hidden = NO;
            time.hidden = NO;
            myReply.hidden = NO;
            commentBtn.hidden = NO;
            topLine.hidden = NO;
            
            
            myReply.frame = CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width/3*2-10*WIDTH_NIT, 20*WIDTH_NIT);
            
            time.frame = CGRectMake(myReply.right + 5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width/3-10*WIDTH_NIT, 20*WIDTH_NIT);
            
            topLine.frame = CGRectMake(0, myReply.bottom, kScreen_Width, 1*WIDTH_NIT);
            
            name.frame =CGRectMake(10*WIDTH_NIT, topLine.bottom+5*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 40*WIDTH_NIT);
            
            subName.frame = CGRectMake(5*WIDTH_NIT, name.bottom+10*WIDTH_NIT, kScreen_Width/2, 20*WIDTH_NIT);
            
            commentBtn.frame = CGRectMake(kScreen_Width - 50*WIDTH_NIT, name.bottom+10*WIDTH_NIT, 40*WIDTH_NIT, 20*WIDTH_NIT);
            
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
