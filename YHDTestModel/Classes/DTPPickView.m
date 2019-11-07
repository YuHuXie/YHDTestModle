//
//  DTPPickView.m
//  DTPClient
//
//  Created by yuhu.xie1 on 2018/11/26.
//  Copyright © 2018 fan.luo. All rights reserved.
//

#import "DTPPickView.h"

@interface DTPPickView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIPickerView *pickView;
@property (nonatomic,strong) UIView *containView;
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,assign) NSInteger currentRow;
@property (nonatomic,strong) NSArray<NSString *> *dataSourceArr;

@end

@implementation DTPPickView


- (instancetype)initWithDataSource:(id)dataSource{
    self.dataSource = dataSource;
    return [super init];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addControls];
    }
    return self;
}

- (void)addControls{
    self.backgroundColor = [UIColor clearColor];
    _containView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _containView.backgroundColor = [UIColor clearColor];
    self.dataSourceArr = [self.dataSource pickViewLoadDataSource];
    [self addTapGesture];
    [self addSubview:_containView];
    [self addSubview:self.topView];
    [self addSubview:self.pickView];
}

- (void)addTapGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidden)];
    [_containView addGestureRecognizer:tap];
}

-(UIPickerView *)pickView{
    if (!_pickView) {
        _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, kScreenHeight-200, kScreenWidth, 200)];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.backgroundColor = [UIColor whiteColor];
    }
    return _pickView;
}

-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-250, kScreenWidth, 50)];
        _topView.backgroundColor = [UIColor whiteColor];
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.tag = 0;
        [cancelBtn addTarget:self action:@selector(cancelOrConfirmButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setTitleColor:UIColorHex(0xA9AEB5) forState:UIControlStateNormal];
        [_topView addSubview:cancelBtn];
        
        UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        confirmBtn.tag = 1;
        [confirmBtn addTarget:self action:@selector(cancelOrConfirmButtonClick:) forControlEvents:UIControlEventTouchUpInside];
         [confirmBtn setTitleColor:UIColorHex(0x333333) forState:UIControlStateNormal];
        [_topView addSubview:confirmBtn];
        
        UIView *sepline = [[UIView alloc]init];
        sepline.backgroundColor = UIColorHex(0x999999);
        [_topView addSubview:sepline];
        
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        
        [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
        
        [sepline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _topView;
}

#pragma  mark - UIPickViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataSourceArr.count;
}

#pragma  mark - UIPickViewDelegate
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.dataSourceArr[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.currentRow = row;
}

#pragma mark - touchEvents
- (void)cancelOrConfirmButtonClick:(UIButton *)sender{
    if (sender.tag && self.callback) {
        self.callback(self.currentRow);
    }
    [self hidden];
}

- (void)hidden{
    _containView.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.containView.backgroundColor = [UIColor lightGrayColor];
        self.containView.alpha = 0.8;
    } completion:^(BOOL finished) {
        
    }];
}

@end
