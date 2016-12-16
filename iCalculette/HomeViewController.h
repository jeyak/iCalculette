//
//  HomeViewController.h
//  iCalculette
//
//  Created by Jeyaksan RAJARATNAM on 13/12/2016.
//  Copyright © 2016 Jeyaksan RAJARATNAM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController{
    @private
    unichar opChar_;
}

// UIElement PROPERTY
@property (weak, nonatomic) IBOutlet UIView *subViewPageHeader;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btnPlus;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btnEqual;
@property (weak, nonatomic) IBOutlet UIButton *btnMinus;
@property (weak, nonatomic) IBOutlet UIButton *btnMultiplier;
@property (weak, nonatomic) IBOutlet UIButton *btnDivide;
@property (weak, nonatomic) IBOutlet UIButton *btnEraseAll;
@property (weak, nonatomic) IBOutlet UILabel *lblNumberPrinter;

/// UIElement EVENT
- (IBAction)btn7_Click:(UIButton *)sender;
- (IBAction)btn8_Click:(UIButton *)sender;
- (IBAction)btn9_Click:(UIButton *)sender;
- (IBAction)btn4_Click:(UIButton *)sender;
- (IBAction)btn5_Click:(UIButton *)sender;
- (IBAction)btn6_Click:(UIButton *)sender;
- (IBAction)btn1_Click:(UIButton *)sender;
- (IBAction)btn2_Click:(UIButton *)sender;
- (IBAction)btn3_Click:(UIButton *)sender;
- (IBAction)btn0_Click:(UIButton *)sender;
- (IBAction)btnC_Click:(UIButton *)sender;
- (IBAction)btnEqual_Click:(UIButton *)sender;
- (IBAction)btnMinus_Click:(UIButton *)sender;
- (IBAction)btnPlus_Click:(UIButton *)sender;
- (IBAction)btnMultiplier:(UIButton *)sender;
- (IBAction)btnDivide_Click:(UIButton *)sender;

/// Property
@property (nonatomic, assign) unichar opChar;

/// METHOD
- (void) resetCalculator;
- (void) changeOpBtnToggleEnableStateWithBool:(BOOL) state;
- (void) printInScrenLabelWithInt:(int) nb;
- (void) printInScrenLabelWithUnichar:(unichar) car;

@end