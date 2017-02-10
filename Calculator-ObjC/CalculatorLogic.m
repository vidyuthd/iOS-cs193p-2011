//
//  CalculatorLogic.m
//  Calculator-ObjC
//
//  Created by Vidyuth Dandu on 09/02/17.
//  Copyright © 2017 Vidyuth Dandu. All rights reserved.
//

#import "CalculatorLogic.h"

@interface CalculatorLogic()
@property(readonly) NSMutableArray* programStack;
@end

@implementation CalculatorLogic

@synthesize programStack = _programStack;

-(NSMutableArray *)programStack {
    if(_programStack == nil){
        _programStack =  [[NSMutableArray alloc] init];
    }
    return _programStack;
}


- (void) pushOperand: (double) operand{
    NSNumber* result = [NSNumber numberWithDouble:operand];
    [self.programStack addObject: result];
}

- (double) performOperation: (NSString *) operation {
    [self.programStack addObject: operation];
    return [CalculatorLogic runProgram: self.program];
}

-(id) program {
    return [self.programStack copy];
}

+ (double) popOperandOffStack: (NSMutableArray *) stack {
    double result = 0;
    id lastObject = [stack lastObject];
    
    if(lastObject) {
        [stack removeLastObject];
    }
    
    if([lastObject isKindOfClass:[NSString class]]){
        NSString* topOfStack = lastObject;
        if([topOfStack isEqualToString:@"+"]) {
            result = [self popOperandOffStack: stack] + [self popOperandOffStack: stack];
        }
    } else if([lastObject isKindOfClass:[NSNumber class]]) {
        return [lastObject doubleValue];
    }
    
    return result;
}

+ (double) runProgram:(id)program{
    NSMutableArray* stack;
    
    if([program isKindOfClass:[NSArray class]]){
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack: stack];
}

+ (NSString *) descriptionOfProgram:(id)program {
    return @"TODO";
}

@end
