//
//  DetailEntity+CoreDataProperties.h
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/16/16.
//  Copyright © 2016 NoName. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DetailEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *ident;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
