//
//  HomeViewController.m
//  iCalculette
//
//  Created by Jeyaksan RAJARATNAM on 13/12/2016.
//  Copyright © 2016 Jeyaksan RAJARATNAM. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

@synthesize opChar = opChar_;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.opChar = ' ';
    self.lblNumberPrinter.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// UIStatusBar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


/// EVENT METHOD

- (IBAction)btn7_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:7];
}

- (IBAction)btn1_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:1];
}

- (IBAction)btn2_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:2];
}

- (IBAction)btn3_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:3];
}

- (IBAction)btn0_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:0];
}

- (IBAction)btnC_Click:(UIButton *)sender {
    [self resetCalculator];
}

- (IBAction)btnEqual_Click:(UIButton *)sender {
    double nb1 = 0, nb2 = 0;
    switch (self.opChar) {
        case '+':
            nb1 = [[self.lblNumberPrinter.text componentsSeparatedByString:@"+"][0] doubleValue];
            nb2 = [[self.lblNumberPrinter.text componentsSeparatedByString:@"+"][1] doubleValue];
            [self resetCalculator];
            [self printInScreenLabelWithInt:(nb1+nb2)];
            break;
        case '-':
            nb1 = [[self.lblNumberPrinter.text componentsSeparatedByString:@"-"][0] doubleValue];
            nb2 = [[self.lblNumberPrinter.text componentsSeparatedByString:@"-"][1] doubleValue];
            [self resetCalculator];
            [self printInScreenLabelWithInt:(nb1-nb2)];
            break;
        case '/':
            nb1 = [[self.lblNumberPrinter.text componentsSeparatedByString:@"/"][0] doubleValue];
            nb2 = [[self.lblNumberPrinter.text componentsSeparatedByString:@"/"][1] doubleValue];
            [self resetCalculator];
            [self printInScreenLabelWithInt:(nb1/nb2)];
            break;
        case '*':
            nb1 = [[self.lblNumberPrinter.text componentsSeparatedByString:@"x"][0] doubleValue];
            nb2 = [[self.lblNumberPrinter.text componentsSeparatedByString:@"x"][1] doubleValue];
            [self resetCalculator];
            [self printInScreenLabelWithInt:(nb1*nb2)];
            break;
        default:
            break;
    }
}

- (IBAction)btnMinus_Click:(UIButton *)sender {
    if(self.opChar == ' ' && (![self.lblNumberPrinter.text isEqualToString:@"0"])){
        [self printInScrenLabelWithUnichar:'-'];
        [self changeOpBtnToggleEnableStateWithBool:NO];
        self.opChar = '-';
    }
}

- (IBAction)btnPlus_Click:(UIButton *)sender {
    if(self.opChar == ' ' && (![self.lblNumberPrinter.text isEqualToString:@"0"])){
        [self printInScrenLabelWithUnichar:'+'];
        [self changeOpBtnToggleEnableStateWithBool:NO];
        self.opChar = '+';
    }
}

- (IBAction)btnMultiplier:(UIButton *)sender {
    if(self.opChar == ' ' && (![self.lblNumberPrinter.text isEqualToString:@"0"])){
        [self printInScrenLabelWithUnichar:'x'];
        [self changeOpBtnToggleEnableStateWithBool:NO];
        self.opChar = '*';
    }
}

- (IBAction)btnDivide_Click:(UIButton *)sender {
    if(self.opChar == ' ' && (![self.lblNumberPrinter.text isEqualToString:@"0"])){
        [self printInScrenLabelWithUnichar:'/'];
        [self changeOpBtnToggleEnableStateWithBool:NO];
        self.opChar = '/';
    }
}

- (IBAction)btn8_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:8];
}

- (IBAction)btn9_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:9];
}

- (IBAction)btn4_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:4];
}

- (IBAction)btn5_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:5];
}

- (IBAction)btn6_Click:(UIButton *)sender {
    [self printInScreenLabelWithInt:6];
}

// METHOD

- (void) resetCalculator{
    self.opChar = ' ';
    self.lblNumberPrinter.text = @"0";
    [self changeOpBtnToggleEnableStateWithBool:YES];
}

- (void) changeOpBtnToggleEnableStateWithBool:(BOOL) state{
    self.btnPlus.enabled = state;
    self.btnMinus.enabled = state;
    self.btnDivide.enabled = state;
    self.btnMultiplier.enabled = state;
    if(state){
        self.btnPlus.backgroundColor = [UIColor whiteColor];
        self.btnMinus.backgroundColor = [UIColor whiteColor];
        self.btnDivide.backgroundColor = [UIColor whiteColor];
        self.btnMultiplier.backgroundColor = [UIColor whiteColor];
    }else{
        self.btnPlus.backgroundColor = [UIColor lightGrayColor];
        self.btnMinus.backgroundColor = [UIColor lightGrayColor];
        self.btnDivide.backgroundColor = [UIColor lightGrayColor];
        self.btnMultiplier.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void) printInScreenLabelWithInt:(int) nb{
    if([self.lblNumberPrinter.text isEqualToString:@"0"]){
        self.lblNumberPrinter.text = [NSString stringWithFormat:@"%d", nb];
    }else{
        self.lblNumberPrinter.text = [NSString stringWithFormat:@"%@%d", self.lblNumberPrinter.text , nb];
    }
}

- (void) printInScrenLabelWithUnichar:(unichar) car{
    if(![self.lblNumberPrinter.text isEqualToString:@"0"]){
    self.lblNumberPrinter.text = [NSString stringWithFormat:@"%@%c", self.lblNumberPrinter.text , car];
    }
}

@end
