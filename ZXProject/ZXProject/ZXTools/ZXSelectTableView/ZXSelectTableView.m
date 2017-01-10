//
//  ZXSelectTableView.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/10.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ZXSelectTableView.h"
#import "CommonHeader.h"

#pragma mark - model
@implementation ZXSelectTableViewItem

+ (instancetype)selectTableViewItemWithImage:(UIImage *)image title:(NSString *)title {
    return [[ZXSelectTableViewItem alloc] initWithImage:image title:title];
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title {
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
        self.titleColor = OneTextColor;
        self.titleFont = TwoFont;
    }
    return self;
}

@end


#pragma mark - cell
@interface CCNavigationBarMenuTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView             *itemImageView;
@property (nonatomic, strong) UILabel                 *itemTitleLabel;

@property (nonatomic, strong) ZXSelectTableViewItem *model;

@end

@implementation CCNavigationBarMenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initSubviews];
    }
    return self;
}

- (void)_initSubviews {
    self.itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10*WIDTH_NIT, 0, self.contentView.height, self.contentView.height)];
    self.itemImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.itemImageView];
   
    
    self.itemTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.itemImageView.right, 0, self.contentView.width-self.itemImageView.right*2, self.contentView.height)];
    self.itemTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.itemTitleLabel.font = TwoFont;
    self.itemTitleLabel.textColor = OneTextColor;
    [self.contentView addSubview:self.itemTitleLabel];
  
}

#pragma mark - setter
- (void)setModel:(ZXSelectTableViewItem *)model {
    self.itemImageView.image = model.image;
    self.itemTitleLabel.text = model.title;
    self.itemTitleLabel.font = model.titleFont;
    self.itemTitleLabel.textColor = model.titleColor;
}

@end


@interface ZXSelectTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGPoint     origin;
@property (nonatomic, assign) CGFloat     width;

// 遮罩
@property (nonatomic, strong) UIView      *maskView;

// 内容
@property (nonatomic, strong) UIView      *contentView;
@property (nonatomic, strong) UITableView *tableView;

@end


@implementation ZXSelectTableView

- (instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width {
    self = [super init];
    if (self) {
        _items = [NSArray array];
//        _separatorColor = [UIColor lightGrayColor];
        _rowHeight = 44*WIDTH_NIT;
       
        // 背景
        self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        self.maskView.backgroundColor = [UIColor blackColor];
        self.maskView.alpha = .2f;
        [self.maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
        
        // 内容
        self.origin = origin;
        self.width = width;
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, width, self.rowHeight * self.items.count)];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        // item
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 5, width, self.rowHeight * self.items.count) style:UITableViewStylePlain];
        [self.tableView registerClass:[CCNavigationBarMenuTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCNavigationBarMenuTableViewCell class])];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.bounces = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
//        self.tableView.separatorColor = self.separatorColor;
        self.tableView.layer.cornerRadius = 2;
        self.tableView.tableFooterView = [[UIView alloc] init];
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
        }
        if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 10)];
        }
        [self.contentView addSubview:self.tableView];
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCNavigationBarMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCNavigationBarMenuTableViewCell class])];
    cell.model = self.items[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.rowHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        cell.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 10);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self dismiss];
    if (self.didSelectMenuItem) {
        self.didSelectMenuItem(self, self.items[indexPath.row]);
    }
}



#pragma mark - setter
- (void)setItems:(NSArray *)items {
    _items = items;
    self.contentView.height = self.rowHeight * self.items.count + 5;
    self.tableView.height = self.rowHeight * self.items.count;
    [self.tableView reloadData];
}


- (void)setSeparatorColor:(UIColor *)separatorColor {
//    _separatorColor = separatorColor;
//    self.tableView.separatorColor = separatorColor;
}

- (void)setRowHeight:(CGFloat)rowHeight {
    _rowHeight = rowHeight;
    self.contentView.height = self.rowHeight * self.items.count + 5;
    self.tableView.height = self.rowHeight * self.items.count;
    [self.tableView reloadData];
}

#pragma mark - public
- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.maskView];
    [window addSubview:self.contentView];
    //    self.contentView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    self.contentView.alpha = 0.0f;
    self.maskView.alpha = .0f;
    [UIView animateWithDuration:.35 animations:^{
        self.contentView.alpha = 1.0;
        //        self.contentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.maskView.alpha = .2f;
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:.15 animations:^{
        //        self.contentView.transform = CGAffineTransformMakeScale(.5f, .5f);
        self.contentView.alpha = 0.0f;
        self.maskView.alpha = .0f;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.maskView removeFromSuperview];
            [self.contentView removeFromSuperview];
        }
    }];
}


@end
