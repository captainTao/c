//
//  main.m
//  hellom
//
//  Created by captain on 2018/1/27.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aclass.h"
#import "Bclass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Aclass *a = [[Aclass alloc]init];
        [a testBlock];
    }
    return 0;
}
