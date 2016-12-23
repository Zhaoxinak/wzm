//
//  TwoHotNoteTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/21.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "TwoHotNoteTableViewCell.h"

@implementation TwoHotNoteTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

- (void)initSubViews {
    
    self.titleNameLabel = [UILabel new];
    self.titleNameLabel.textColor = OneTextColor;
    self.titleNameLabel.font = ThreeFont;
    
    self.headImageView = [UIImageView new];
    self.headImageView.clipsToBounds = YES;
    
    self.userNameLabel = [UILabel new];
    self.userNameLabel.textColor = OneTextColor;
    self.userNameLabel.font = ThreeFont;
    
    self.levelLabel = [UILabel new];
    self.levelLabel.textColor = OneTextColor;
    self.levelLabel.font = ThreeFont;
    
    self.sexImageView = [UIImageView new];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.textColor = OneTextColor;
    self.timeLabel.font = ThreeFont;
    
    self.commentBtn = [UIButton new];
    [self.commentBtn setImage:[UIImage imageNamed:@"list_icon_speech"] forState:UIControlStateNormal];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    self.headImageView.userInteractionEnabled = YES;
    [self.headImageView addGestureRecognizer:tap];
    
    
    [self.contentView addSubview:self.titleNameLabel];
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.levelLabel];
    [self.contentView addSubview:self.sexImageView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.commentBtn];
}

- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setFrameModel:(TwoHotNoteFrameModel *)frameModel {
    
    [self removeAllImages];
    _frameModel = frameModel;
    
    self.titleNameLabel.text = @"阿斯顿发送到发送到发送到发送到发抖上发呆发呆舒服的沙发多少发多少发多少分";
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    self.userId = @"111";
    
    self.userNameLabel.text = @"打发打发";
   
    self.levelLabel.text = @"12";
    
    [self.sexImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    
    self.timeLabel.text = [self TimeStamp:@""];
    
    NSArray *picImages = _frameModel.model.pics[@"pics"];
    NSInteger i = 0;
    for (NSDictionary *dic in picImages) {
        
        UIImageView *cellimageView = nil;
        
        cellimageView = [UIImageView new];//110*WIDTH_NIT, 87*WIDTH_NIT
        
        cellimageView.frame = CGRectMake(110*WIDTH_NIT * i + 14*WIDTH_NIT * i + 14*WIDTH_NIT, _frameModel.imageArrayFrame.origin.y, 110*WIDTH_NIT, 87*WIDTH_NIT);
        cellimageView.tag = 100+i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        cellimageView.userInteractionEnabled = YES;
        [cellimageView addGestureRecognizer:tap];
        NSString *url = dic[@"url"];
        if ([url isKindOfClass:[NSNull class]]) {
            url = @"";
        }
       
        [cellimageView setImageWithURL:[NSURL URLWithString:url] placeholder:[UIImage imageNamed:@"餐厅占位"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
            image = [image imageByResizeToSize:CGSizeMake(100*WIDTH_NIT * 3, 100*WIDTH_NIT * 3) contentMode:UIViewContentModeScaleAspectFill];
            return image;
        } completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
            
        }];
        //[cellimageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"餐厅占位"]];
        
        
        
        
        [self.contentView addSubview:cellimageView];
        [self.imageArray addObject:cellimageView];
        
        if (picImages.count > 3 && i == 2) {
            UILabel *countLabel = [UILabel new];
            countLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
            countLabel.font = [UIFont systemFontOfSize:14*WIDTH_NIT];
            countLabel.textColor = [UIColor whiteColor];
            countLabel.textAlignment = NSTextAlignmentCenter;
            countLabel.frame = CGRectMake(cellimageView.bounds.size.width - 30, cellimageView.bounds.size.height - 30, 30, 30);
            countLabel.text = [NSString stringWithFormat:@"%ld", (unsigned long)picImages.count];
            [cellimageView addSubview:countLabel];
        }
        
        i++;
    }
    
    
    self.titleNameLabel.frame = _frameModel.titleNameLabelFrame;
    self.headImageView.frame = _frameModel.headImageViewFrame;
    self.userNameLabel.frame = _frameModel.userNameLabelFrame;
    self.levelLabel.frame = _frameModel.levelLabelFrame;
    self.sexImageView.frame = _frameModel.sexImageViewFrame;
    self.timeLabel.frame = _frameModel.timeLabelFrame;
    self.commentBtn.frame = _frameModel.commentBtnFrame;
    
    self.headImageView.layer.cornerRadius = _frameModel.headImageViewFrame.size.width / 2;
    
   
}




- (NSString *)TimeStamp:(NSString *)strTime {
    
    //    //实例化一个NSDateFormatter对象
    //    //1482235852000
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //
    //    //设定时间格式,这里可以设置成自己需要的格式
    //
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //
    //    //用[NSDate date]可以获取系统当前时间
    //
    //    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //
    //    //输出格式为：2010-10-27 10:22:13
    //
    //    NSLog(@"%@",currentDateStr);
    //
    //
    //    return currentDateStr;
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[strTime doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

- (void)removeAllImages {
    for (NSInteger i = 0; i < self.imageArray.count; i++) {
        UIImageView *imageView = self.imageArray[i];
        [imageView removeFromSuperview];
        imageView = nil;
    }
}

- (void)tapImageView:(UITapGestureRecognizer *)recognizer
{
    [[UIResponder currentFirstResponder] resignFirstResponder];
    //添加遮盖
    UIView *cover = [[UIView alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor clearColor];
    [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCover:)]];
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    self.coverView = cover;
    UIImageView *tapImage = (UIImageView *)recognizer.view;
    
    self.tapIndex = tapImage.tag - 100;
    self.showIndex = self.tapIndex;
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(kScreen_Width * self.imageArray.count, kScreen_Height);
    [scroll addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCover:)]];
    scroll.delegate = self;
    [cover addSubview:scroll];
    self.bgScroll = scroll;
    
    for (UIImageView *tmp1 in self.xl_imageArray) {
        [tmp1 removeFromSuperview];
    }
    [self.xl_imageArray removeAllObjects];
    NSInteger i = 0;
    for (UIImageView *tmpImageView in self.imageArray) {
        UIImageView *tmp_imageView = [[UIImageView alloc] initWithImage:tmpImageView.image];
        CGRect tmpFrame = [cover convertRect:tmpImageView.frame fromView:self];
        tmpFrame.origin.x += kScreen_Width * i++;
        tmp_imageView.frame = tmpFrame;
        [self.xl_imageArray addObject:tmp_imageView];
    }
    
    
    self.imagView = self.xl_imageArray[self.showIndex];
    if (self.showIndex > 2) {
        UIImageView *tmpV = self.xl_imageArray[2];
        self.lastFrame = tmpV.frame;
    } else {
        self.lastFrame = self.imagView.frame;
    }
    [self.bgScroll addSubview:self.imagView];
    
    //添加图片到遮盖上
    //    UIImageView *imageView = [[UIImageView alloc] initWithImage:tapImage.image];
    //    imageView.frame = [cover convertRect:recognizer.view.frame fromView:self];
    //    self.lastFrame = imageView.frame;
    //    [cover addSubview:imageView];
    //    self.imagView = imageView;
    //    NSMutableArray *xl_images = [self.xl_imageArray mutableCopy];
    for (NSInteger j = 0; j < self.xl_imageArray.count; j++) {
        
        UIImageView *tmpImage = self.xl_imageArray[j];
        CGRect frame = tmpImage.frame;
        frame.size.width = cover.frame.size.width;
        frame.size.height = cover.frame.size.width * (tmpImage.image.size.height / tmpImage.image.size.width);
        frame.origin.x = kScreen_Width * j;
        frame.origin.y = (cover.frame.size.height - frame.size.height) * 0.5;
        
        if (j != self.tapIndex) {
            tmpImage.frame = frame;
            [self.bgScroll addSubview:tmpImage];
        }
    }
    [self.bgScroll setContentOffset:CGPointMake(kScreen_Width * self.tapIndex, 0)];
    NSLog(@"--%f", self.bgScroll.contentOffset.x);
    //放大
    [UIView animateWithDuration:0.3f animations:^{
        cover.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
        CGRect frame = self.imagView.frame;
        frame.size.width = cover.frame.size.width;
        frame.size.height = cover.frame.size.width * (self.imagView.image.size.height / self.imagView.image.size.width);
        frame.origin.x = kScreen_Width * self.tapIndex;
        frame.origin.y = (cover.frame.size.height - frame.size.height) * 0.5;
        self.imagView.frame = frame;
    } completion:^(BOOL finished) {
        [self.bgScroll setContentOffset:CGPointMake(kScreen_Width * self.tapIndex, 0)];
    }];
}

- (void)tapCover:(UITapGestureRecognizer *)recognizer
{
    
    NSLog(@"++%f", self.bgScroll.contentOffset.x);
    if (self.showIndex != self.tapIndex) {
        self.imagView = self.xl_imageArray[self.showIndex];
        if (self.showIndex > 2) {
            self.showIndex = 2;
        }
        UIImageView *IMG = self.imageArray[self.showIndex];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:IMG.image];
        CGRect tmpFrame = [self.coverView convertRect:IMG.frame fromView:self];
        tmpFrame.origin.x += self.showIndex * kScreen_Width;
        imageView.frame = tmpFrame;
        self.lastFrame = imageView.frame;
    }
    
    [UIView animateWithDuration:0.3f animations:^{
        self.coverView.backgroundColor = [UIColor clearColor];
        self.imagView.frame = self.lastFrame;
        
    }completion:^(BOOL finished) {
        self.imagView = nil;
        [self.coverView removeFromSuperview];
        self.coverView = nil;
        
        [self.bgScroll removeFromSuperview];
        self.bgScroll = nil;
    }];
}

- (NSMutableArray *)xl_imageArray {
    if (_xl_imageArray == nil) {
        _xl_imageArray = [NSMutableArray array];
    }
    return _xl_imageArray;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.x;
    if (offset / kScreen_Width == 0) {
        
        self.showIndex = 0;
    } else if (offset / kScreen_Width == 1) {
        
        self.showIndex = 1;
    } else if (offset / kScreen_Width == 2)  {
        
        self.showIndex = 2;
    }else if (offset / kScreen_Width >= 3)  {
        self.showIndex = 3;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
