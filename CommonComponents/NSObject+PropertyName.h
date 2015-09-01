//
//  NSObject+PropertyName.h
//  CommonComponents
//
//  Created by Jason on 9/1/15.
//  Copyright (c) 2015 JC. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Get property name for the class (C string or NSSting). */
#define keypathForClass(Klass, PropertyName) \
(((void)(NO && ((void)[Klass _nullObject].PropertyName, NO)), # PropertyName))

#define keypathStringForClass(Klass, PropertyName) \
@keypathForClass(Klass, PropertyName)

/* Get property name for the protocol (C string or NSSting). */
#define keypathForProtocol(Protocol, PropertyName) \
(((void)(NO && ((void)((NSObject<Protocol> *)[NSObject _nullObject]).PropertyName, NO)), # PropertyName))

#define keypathStringForProtocol(Protocol, PropertyName) \
@keypathForProtocol(Protocol, PropertyName)

@interface NSObject (PropertyName)
+ (instancetype)_nullObject;
@end
