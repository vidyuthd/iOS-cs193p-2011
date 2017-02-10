//
//  ViewController.m
//  Calculator-ObjC
//
//  Created by Vidyuth Dandu on 08/02/17.
//  Copyright © 2017 Vidyuth Dandu. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorLogic.h"

@interface ViewController ()
@property (nonatomic) BOOL userIsInMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorLogic* calculatorLogic;
@end

@implementation ViewController
@synthesize calculatorLogic= _calculatorLogic;
@synthesize displayText = _displayText;

-(CalculatorLogic *) calculatorLogic{
    if(!_calculatorLogic) {
        _calculatorLogic = [[CalculatorLogic alloc] init];
    }
    return _calculatorLogic;
}

- (IBAction)digitPressed:(UIButton *)sender {
    if(self.userIsInMiddleOfEnteringANumber){
        self.displayText.text = [self.displayText.text stringByAppendingString:[sender currentTitle]];
    } else {
        self.displayText.text = [sender currentTitle];
        self.userIsInMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)operandPressed:(id)sender {
    if(self.userIsInMiddleOfEnteringANumber) [self enterPressed];
    double result = [self.calculatorLogic performOperation: [sender currentTitle]];
    self.displayText.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)enterPressed {
    [self.calculatorLogic pushOperand: [self.displayText.text doubleValue]];
    self.userIsInMiddleOfEnteringANumber = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"loaded view controller");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
