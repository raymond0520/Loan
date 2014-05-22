//
//  QQModel.h
//  QQMSFContact
//
//  Created by sugarchen on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QQModel : NSObject <NSCoding> {

}

- (void)encodeWithCoder:(NSCoder *)encoder ; 
- (id)initWithCoder:(NSCoder *)decoder ;

@end
