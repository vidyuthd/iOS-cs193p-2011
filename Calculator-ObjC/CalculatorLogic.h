//
//  CalculatorLogic.h
//  Calculator-ObjC
//
//  Created by Vidyuth Dandu on 09/02/17.
//  Copyright © 2017 Vidyuth Dandu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorLogic : NSObject

- (void) pushOperand: (double) operand;
- (double) performOperation: (NSString *) operation;

@property (readonly) id program;

+ (double) runProgram: (id) program;
+ (NSString *) descriptionOfProgram: (id) program;
@end
