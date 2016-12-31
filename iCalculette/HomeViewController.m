//
//  HomeViewController.m
//  iCalculette
//
//  Created by Jeyaksan RAJARATNAM on 13/12/2016.
//  Copyright © 2016 Jeyaksan RAJARATNAM. All rights reserved.
//

#import "HomeViewController.h"
#define iCALC_ERROR ((NSString*) @"Erreur :/")

@implementation HomeViewController

@synthesize opChar = opChar_;
@synthesize resultNb = resultNb_;
@synthesize btnActualColor = btnActualColor_;
@synthesize actualLblFont = actualLblFont_;
@synthesize isOpExecuted = isOpExecuted_;
@synthesize isOpButtonWasPressed = isOpButtonWasPressed_;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.opChar = ' ';
    self.lblNumberPrinter.text = @"0";
    self.btnActualColor = self.btnPlus.backgroundColor;
    self.actualLblFont = self.lblNumberPrinter.font;
    self.isOpExecuted = YES;
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

- (IBAction)btnNegate_Click:(UIButton *)sender {
    if(![self.lblNumberPrinter.text isEqualToString:@"0"]){
        if([self isCharactereIsPresentInNSString:self.lblNumberPrinter.text andWithNSString:@"-"]){
            self.lblNumberPrinter.text = [self.lblNumberPrinter.text substringFromIndex:1];
        }else{
            self.lblNumberPrinter.text = [NSString stringWithFormat:@"%c%@", '-', self.lblNumberPrinter.text];
        }
    }
}

- (IBAction)btnComma_Click:(UIButton *)sender {
    [self printInScreenLabelWithUnichar:'.'];
}

- (IBAction)btnC_Click:(UIButton *)sender {
    self.lblOperationHistory.text = @"";
    self.lblNumberPrinter.text = @"0";
    self.opChar = ' ';
    self.lblNumberPrinter.text = @"0";
    self.resultNb = 0;
    self.isOpExecuted = YES;
}

- (IBAction)btnCE_Click:(UIButton *)sender {
    self.lblNumberPrinter.text = @"0";
    self.opChar = ' ';
    self.lblNumberPrinter.text = @"0";
}

- (IBAction)btnErase_Click:(UIButton *)sender {
    if(![self.lblNumberPrinter.text isEqualToString:@"inf"]){
        if ([self.lblNumberPrinter.text length] > 1) {
            self.lblNumberPrinter.text = [self.lblNumberPrinter.text substringToIndex:[self.lblNumberPrinter.text length] - 1];
        } else {
            self.lblNumberPrinter.text = @"0";
        }
    }else{
        self.lblNumberPrinter.text = @"0";
    }
}

- (IBAction)btnEqual_Click:(UIButton *)sender {
    [self executeOperation];
    self.lblOperationHistory.text = @"";
    self.opChar = ' ';
}

- (IBAction)btnMinus_Click:(UIButton *)sender {
    [self preExecuteOperationWithUnichar:'-'];
}

- (IBAction)btnPlus_Click:(UIButton *)sender {
    [self preExecuteOperationWithUnichar:'+'];
}

- (IBAction)btnMultiplier:(UIButton *)sender {
    [self preExecuteOperationWithUnichar:'*'];
}

- (IBAction)btnDivide_Click:(UIButton *)sender {
    [self preExecuteOperationWithUnichar:'/'];
}

// METHOD

- (void) changeOpBtnToggleEnableStateWithBool:(BOOL) state{
    self.btnPlus.enabled = state;
    self.btnMinus.enabled = state;
    self.btnDivide.enabled = state;
    self.btnMultiplier.enabled = state;
    if(state){
        self.btnPlus.backgroundColor = self.btnActualColor;
        self.btnMinus.backgroundColor = self.btnActualColor;
        self.btnDivide.backgroundColor = self.btnActualColor;
        self.btnMultiplier.backgroundColor = self.btnActualColor;
    }else{
        self.btnPlus.backgroundColor = [UIColor lightGrayColor];
        self.btnMinus.backgroundColor = [UIColor lightGrayColor];
        self.btnDivide.backgroundColor = [UIColor lightGrayColor];
        self.btnMultiplier.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void) printInScreenLabelWithInt:(int) nb{
    
    if(nb != -2147483648){
        if([self.lblNumberPrinter.text isEqualToString:@"0"] || [self.lblNumberPrinter.text isEqualToString:iCALC_ERROR] || self.isOpButtonWasPressed == YES){
            self.lblNumberPrinter.text = [NSString stringWithFormat:@"%d", nb];
            self.isOpButtonWasPressed = NO;
        }else{
            self.lblNumberPrinter.text = [NSString stringWithFormat:@"%@%d", self.lblNumberPrinter.text , nb];
        }
    }else{
        self.lblNumberPrinter.text = iCALC_ERROR;
    }
}

- (void) printInScreenLabelWithDouble:(double) nb{
    NSNumber *nsNb = [NSNumber numberWithDouble:nb];
    if(nb != -2147483648){
        if([self.lblNumberPrinter.text isEqualToString:@"0"] || [self.lblNumberPrinter.text isEqualToString:iCALC_ERROR] || self.isOpButtonWasPressed == YES || self.isOpExecuted == YES){
            self.lblNumberPrinter.text = [NSString stringWithFormat:@"%@", [nsNb stringValue]];
            self.isOpButtonWasPressed = NO;
            self.isOpExecuted = NO;
        }else{
            self.lblNumberPrinter.text = [NSString stringWithFormat:@"%@%@", self.lblNumberPrinter.text , [nsNb stringValue]];
        }
    }else{
        self.lblNumberPrinter.text = iCALC_ERROR;
    }
}

- (void) printInScreenLabelWithUnichar:(unichar) car{
    if(car == '.' && ([self isCharactereIsPresentInNSString:self.lblNumberPrinter.text andWithNSString:@"."] != YES)){
        self.lblNumberPrinter.text = [NSString stringWithFormat:@"%@%c", self.lblNumberPrinter.text , car];
    }else{
        if(![self.lblNumberPrinter.text isEqualToString:@"0"] && car != '.'){
            self.lblNumberPrinter.text = [NSString stringWithFormat:@"%@%c", self.lblNumberPrinter.text , car];
        }
    }
}

- (void) printCurrentNumberInHistoryLabelWithOpUnichar:(unichar) op{
    self.lblOperationHistory.text = [NSString stringWithFormat:@"%@%@%c", self.lblOperationHistory.text, self.lblNumberPrinter.text, op];
}

- (void) executeOperation{
    if(![self.lblNumberPrinter.text isEqualToString:@"inf"]){
        switch (self.opChar) {
            case '+':
                self.resultNb += [self.lblNumberPrinter.text doubleValue];
                break;
            case '-':
                self.resultNb -= [self.lblNumberPrinter.text doubleValue];
                break;
            case '/':
                self.resultNb /= [self.lblNumberPrinter.text doubleValue];
                break;
            case '*':
                self.resultNb *= [self.lblNumberPrinter.text doubleValue];
                break;
            default:
                
                break;
        }
        if(self.opChar != ' ' || self.isOpExecuted){
            [self printInScreenLabelWithDouble:self.resultNb];
        }
        self.isOpExecuted = YES;
    }
}

- (void) preExecuteOperationWithUnichar:(unichar) op{
    if(![self.lblNumberPrinter.text isEqualToString:@"inf"]){
        [self printCurrentNumberInHistoryLabelWithOpUnichar:op];
        if((self.opChar != ' ' && ![self.lblNumberPrinter.text isEqualToString:@"0"])){
            [self executeOperation];
        }else{
            self.resultNb = [self.lblNumberPrinter.text doubleValue];
        }
        if(![self.lblNumberPrinter.text isEqualToString:@"0"]){
            self.opChar = op;
        }
        self.isOpButtonWasPressed = YES;
    }
}

- (Boolean) isCharactereIsPresentInNSString:(NSString*) str andWithNSString:(NSString*) car{
    NSRange range = [str rangeOfString:car];
    if (range.location != NSNotFound)
    {
        return YES;
    }
    return NO;
}

@end
