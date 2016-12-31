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
    double resultNb_;
    UIColor* btnActualColor_;
    UIFont* actualLblFont_;
    Boolean isOpExecuted_;
    Boolean isOpButtonWasPressed_;
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
@property (weak, nonatomic) IBOutlet UILabel *lblOperationHistory;

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
- (IBAction)btnNegate_Click:(UIButton *)sender;
- (IBAction)btnComa_Click:(UIButton *)sender;
- (IBAction)btnC_Click:(UIButton *)sender;
- (IBAction)btnCE_Click:(UIButton *)sender;
- (IBAction)btnErase_Click:(UIButton *)sender;
- (IBAction)btnEqual_Click:(UIButton *)sender;
- (IBAction)btnMinus_Click:(UIButton *)sender;
- (IBAction)btnPlus_Click:(UIButton *)sender;
- (IBAction)btnMultiplier:(UIButton *)sender;
- (IBAction)btnDivide_Click:(UIButton *)sender;

/// Property
@property (nonatomic, assign) unichar opChar;
@property (nonatomic, assign) double resultNb;
@property (nonatomic, strong) UIColor* btnActualColor;
@property (nonatomic, strong) UIFont* actualLblFont;
@property (nonatomic, assign) Boolean isOpExecuted;
@property (nonatomic, assign) Boolean isOpButtonWasPressed;

/// METHOD
/// Reset les données de la calculatrice
- (void) resetCalculator;

/// Change l'Etat actif des bouton d'operation (+,-,/,*)
- (void) changeOpBtnToggleEnableStateWithBool:(BOOL) state;

/// Modifie le label principal d'affichage
/// avec un int passer en paramètre
- (void) printInScreenLabelWithInt:(int) nb;

/// Modifie le label principal d'affichage
/// avec un unichar passer en paramètre
- (void) printInScrenLabelWithUnichar:(unichar) car;

/// Modifie le label de l'historique des operation et ajoute
/// le nombre courrant avec le caractère de l'operateur choisi
- (void) printCurrentNumberInHistoryLabelWithOpUnichar:(unichar) op;

/// Execute le calcule selon le l'operateur (self.opChar)
/// choisi par l'utilisateur
- (void) executeOperation;

/// Execute les traitements préliminaire avec l'execution
/// de l'operation
- (void) preExecuteOperationWithUnichar:(unichar) op;

/// Retourn vrai si le caractère est present dans la
/// chaine de caractère
- (Boolean) isCharactereIsPresentInNSString:(NSString*) str andWithNSString:(NSString*) car;

@end
