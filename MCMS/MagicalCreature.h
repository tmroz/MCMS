//
//  MagicalCreature.h
//  MCMS
//
//  Created by Thomas M. Mroz on 5/20/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *description;
@property UIImage *image;

-(MagicalCreature *) initWithName: (NSString *) name description: (NSString *) description;

-(MagicalCreature *) initWithName: (NSString *) name;

-(MagicalCreature *) initWithName: (NSString *) name description: (NSString *) description image:(UIImage *) image;



@end
