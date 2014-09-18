//
//  Block+Example.h
//  CommonComponents
//
//  Created by Jason Chang on 9/18/14.
//  Copyright (c) 2014 JC. All rights reserved.
//

#ifndef CommonComponents_Block_Example_h
#define CommonComponents_Block_Example_h

// http://stackoverflow.com/questions/9201514/block-declaration-syntax-list

/*
 // blocks as variable
return_type (^blockName)(var_type) = ^return_type (var_type varName)
{
    // ...
};
*/

// anonymous block , its the same as block as variable just without assignment
//^return_type (var_type varName)
//{
//    //...
//};

// blocks as property
//@property (copy) return_type (^blockName) (var_type);

// blocks as method param

// - (void)yourMethod:(return_type (^)(var_type))blockName;

// blocks as argument

//[someObject doSomethingWithBlock: ^return_type (var_type varName)
//{
//    //...
//}];

// typedef block
//typedef return_type (^blockName)(var_type);

// return block
//- (return_type(^)(var_type))methodName
//{
//    // ...
//}

// recursive block , block calling itself recursivly
/*
__block return_type (^blockName)(var_type) = [^return_type (var_type varName)
{
    if (returnCondition)
    {
        blockName = nil;
        return;
    }
    
    // ...
} copy];
blockName(varValue);
*/


#endif
