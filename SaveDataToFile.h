//
//  GUOSaveDataToFile.h
//  iTips
//
//  Created by guo on 13-4-28.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveDataToFile : NSObject
-(void)saveGameData:(NSMutableDictionary *)data saveFileName:(NSString *)fileName;
-(NSMutableDictionary *)loadGameData:(NSString *)fileName;
-(void)saveGameData2:(NSMutableArray *)data saveFileName:(NSString *)fileName;
-(NSMutableArray *)loadGameData2:(NSString *)fileName;
@end
