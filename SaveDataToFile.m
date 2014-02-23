//
//  GUOSaveDataToFile.m
//  iTips
//
//  Created by guo on 13-4-28.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "SaveDataToFile.h"

@implementation SaveDataToFile

-(void)saveGameData:(NSMutableDictionary *)data saveFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//获取文件路径
    NSString *documentsDirectory = [paths objectAtIndex:0];//搜索目标文件路径
    if (!documentsDirectory) {//目标文件路径为空
        NSLog(@"Documents directory not found!");
    }
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:fileName];//fileName为存储的文件名，获取文件的完整路径名
    [data writeToFile:appFile atomically:YES];//将数据写入文件
}

-(NSMutableDictionary *)loadGameData:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSMutableDictionary *myData = [[NSMutableDictionary alloc] initWithContentsOfFile:appFile];
    return myData;
}

-(void)saveGameData2:(NSMutableArray *)data saveFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//获取文件路径
    NSString *documentsDirectory = [paths objectAtIndex:0];//搜索目标文件路径
    if (!documentsDirectory) {//目标文件路径为空
        NSLog(@"Documents directory not found!");
    }
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:fileName];//fileName为存储的文件名，获取文件的完整路径名
    [data writeToFile:appFile atomically:YES];//将数据写入文件
}

-(NSMutableArray *)loadGameData2:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSMutableArray *myData = [[NSMutableArray alloc] initWithContentsOfFile:appFile];
    return myData;
}


@end