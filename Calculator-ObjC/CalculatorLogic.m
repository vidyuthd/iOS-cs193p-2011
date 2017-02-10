//
//  CalculatorLogic.m
//  Calculator-ObjC
//
//  Created by Vidyuth Dandu on 09/02/17.
//  Copyright © 2017 Vidyuth Dandu. All rights reserved.
//

#import "CalculatorLogic.h"

@interface CalculatorLogic()
@property(nonatomic, strong) NSMutableArray* operandStack;
@end

@implementation CalculatorLogic

@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack {
    if(_operandStack == nil){
        _operandStack =  [[NSMutableArray alloc] init];
    }
    return _operandStack;
}


- (void) pushOperand: (double) operand{
    NSNumber* result = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject: result];
}

- (double) performOperation: (NSString *) operation {
    double result  = 0;
    
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }
    return result;
}

- (double) popOperand {
    NSNumber*  operandObject = [self.operandStack lastObject];
    [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

@end
