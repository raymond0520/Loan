//
//  QQModel.m
//  QQMSFContact
//
//  Created by sugarchen on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QQModel.h"
#include <objc/runtime.h>

@implementation QQModel


- (void)encodeWithCoder:(NSCoder *)encoder {
	Class cls = [self class];
	while (cls != [NSObject class]) {
		unsigned int numberOfIvars = 0;
		Ivar* ivars = class_copyIvarList(cls, &numberOfIvars);
		for(const Ivar* p = ivars; p < ivars+numberOfIvars; p++)
		{
			Ivar const ivar = *p;
			const char *type = ivar_getTypeEncoding(ivar);
			NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
			if([key isEqualToString:@"_delegate"])
			{
				continue;
			}
			id value = [self valueForKey:key];
			if (value) {
				switch (type[0]) {
					case _C_STRUCT_B: {
						NSUInteger ivarSize = 0;
						NSUInteger ivarAlignment = 0;
						NSGetSizeAndAlignment(type, &ivarSize, &ivarAlignment);				
						NSData *data = [NSData dataWithBytes:(const char *)self + ivar_getOffset(ivar)
													  length:ivarSize];
						[encoder encodeObject:data forKey:key];
					}
						break;
					default:
						
						if ([value conformsToProtocol:@protocol(NSCoding)]) 
						{
							[encoder encodeObject:value forKey:key];
						}else {
							//assert(0); // crash for debug
						}

						break;
				}						
			}
		}	
		if (ivars) {
			free(ivars);
		}
		
		cls = class_getSuperclass(cls);
	}
}

- (id)initWithCoder:(NSCoder *)decoder {
	
	self = [super init];
	
	if (self) {
		Class cls = [self class];
		while (cls != [NSObject class]) {
			unsigned int numberOfIvars = 0;
			Ivar* ivars = class_copyIvarList(cls, &numberOfIvars);
			
			for(const Ivar* p = ivars; p < ivars+numberOfIvars; p++)
			{
				Ivar const ivar = *p;
				const char *type = ivar_getTypeEncoding(ivar);
				const char *name = ivar_getName(ivar);
				NSString *key = [NSString stringWithUTF8String:name];
				id value = [decoder decodeObjectForKey:key];
				if (value) {
					switch (type[0]) {
						case _C_STRUCT_B: {
							NSUInteger ivarSize = 0;
							NSUInteger ivarAlignment = 0;
							NSGetSizeAndAlignment(type, &ivarSize, &ivarAlignment);				
							NSData *data = [decoder decodeObjectForKey:key];
							char *sourceIvarLocation = (char*)self+ ivar_getOffset(ivar);								 
							[data getBytes:sourceIvarLocation length:ivarSize];
							memcpy((char *)self + ivar_getOffset(ivar), sourceIvarLocation, ivarSize);
						}
							break;
						default:
							[self setValue:value forKey:key];
									
							break;
					}
				}	
			}
			
			if (ivars) {
				free(ivars);
			}
			cls = class_getSuperclass(cls);
		}
	}

	return self;
}


@end
