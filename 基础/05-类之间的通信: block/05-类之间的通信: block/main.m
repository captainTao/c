//
//  main.m
//  05-类之间的通信: block
//
//  Created by captain on 2018/2/11.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aclass.h"
#import "Bclass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // block通信
        
        Aclass *a = [[Aclass alloc]init];
        [a testBlock];
        
    }
    return 0;
}
