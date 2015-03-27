//
//  ViewController.m
//  unZip
//
//  Created by MAC on 15/1/15.
//  Copyright (c) 2015年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "ZipArchive.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *zipFile = @"/users/mac/Desktop/Download.zip";
    NSString *unzipFile = @"/users/mac/Desktop/";
    ZipArchive *zipArchive = [[ZipArchive alloc]init];
    
    if ([zipArchive UnzipOpenFile:zipFile]){
        NSLog(@"打开压缩文件成功！");
        if ([zipArchive UnzipFileTo:unzipFile overWrite:YES]){
            NSLog(@"解压成功！");
            if ([zipArchive UnzipCloseFile])
                NSLog(@"关闭压缩文件成功！");
            else NSLog(@"关闭压缩文件失败！");
        }
        else NSLog(@"解压失败！");
    }
    else NSLog(@"打开压缩文件失败！");
    
    _zipFileList = [NSMutableArray new];
    _zipFileList = [zipArchive getList];
    NSLog(@"已为您解压文件：\n%@",_zipFileList);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
