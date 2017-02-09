//
//  UnderstandingPayTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/18.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "UnderstandingPayTableViewCell.h"
#import "CommonHeader.h"

@implementation UnderstandingPayTableViewCell

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
    
    //打赏提示
    UILabel *alertTitile = [[UILabel alloc]initWithFrame:CGRectMake(0, 26*WIDTH_NIT, kScreen_Width, 20*WIDTH_NIT)];
    alertTitile.font = Font14;
    alertTitile.textColor = LessNameColor;
    alertTitile.textAlignment = NSTextAlignmentCenter;
    alertTitile.text = @"您的打赏，对我们是最大的鼓励";
    [self addSubview:alertTitile];
    
    
    
    //打赏按钮
    payBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/2-58*WIDTH_NIT, alertTitile.bottom+20*WIDTH_NIT, 115*WIDTH_NIT, 35*WIDTH_NIT)];
    [payBtn setBackgroundColor:MainGoldColor];
    [payBtn setTitleColor:[UIColor whiteColor]];
    payBtn.titleLabel.font = Font15;
    [payBtn setTitle:@"打赏"];
    [payBtn addTarget:self action:@selector(payAct:)];
    [self addSubview:payBtn];
    
    
    
    //打赏人数
    paynum = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, payBtn.bottom+25*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    paynum.font = Font14;
    paynum.textColor = LessNameColor;
    paynum.textAlignment = NSTextAlignmentCenter;
    paynum.text = @"18人打赏过";
    [self addSubview:paynum];
    
    
    
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(UnderstandingInfoModel *)model{
    
    
    
    NSArray *btnNames= [NSArray arrayWithObjects:@"", nil];
    NSArray *btnImages = [NSArray arrayWithObjects:@"wo", @"wo",@"wo",@"wo",@"wo",@"wo",@"wo",@"wo",@"wo",@"wo",@"wo",@"wo",@"wo",@"wo",@"wo",nil];
    
    //定义总列数、每个九宫格的宽高
    NSInteger totalColumns=7;
    CGFloat appW=44*WIDTH_NIT;
    CGFloat appH=44*WIDTH_NIT;
    CGFloat marinW = (kScreen_Width-totalColumns*appW)/(totalColumns+1);
    //根据arr1中数据数量来初始化并加载一个一个的UIVIew
    for (int index=0; index<15; index++) {
        //计算这个app在几行几列
        int row=index/totalColumns;
        int col=index%totalColumns;
        
        //创建UIView
        UIView *appView=[[UIView alloc]init];
        //根据一些计算，确定不同UIView的位置
        appView.frame=CGRectMake(marinW + col*(marinW+appW), paynum.bottom+15*WIDTH_NIT +row*appH, appW, appH);
        appView.backgroundColor= [UIColor whiteColor];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, appView.width-10*WIDTH_NIT, appView.height-10*WIDTH_NIT)];
        btn.tag = index;
        btn.backgroundColor = [UIColor whiteColor];
        btn.clipsToBounds = YES;
        btn.titleLabel.font = Font8;
        btn.titleColor = NameColor;
        btn.title = [NSString stringWithFormat:@"头像%d", index];
        [btn setImage:btnImages[index]];
        [UIButton ImageUptoLabelDown:btn margin:1*WIDTH_NIT];
        btn.imageView.layer.cornerRadius = btn.size.width/2;
        
        [btn addTarget:self action:@selector(btnAct:)];
        [appView addSubview:btn];
        
        [self addSubview:appView];
    }


    
    
}



#pragma mark ---打赏按钮
-(void)payAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(understandingPaySelect2go:)]) {
        [self.delegate understandingPaySelect2go:tag];
        NSLog(@"打赏");
    }
    
}


#pragma mark --- 点击头像实现
-(void)btnAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(understandingPayMemberSelect2go:)]) {
        [self.delegate understandingPayMemberSelect2go:tag];
        NSLog(@"点击头像");
    }
    
}



#pragma mark - 计算cell高度
+ (CGFloat)caculateUnderstandingPayCellHeightWithPerson:(UnderstandingInfoModel *)model{
    
    NSInteger picNum = 15;
    CGFloat picWidth = 34*WIDTH_NIT;
    return MAX (((picNum / 7 + 1) * (picWidth + 15) + 160*WIDTH_NIT), 240*WIDTH_NIT);
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
