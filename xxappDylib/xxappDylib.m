//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  xxappDylib.m
//  xxappDylib
//
//  Created by iOSleep on 2022/7/29.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

#import "xxappDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <MDCycriptManager.h>
#import <UICKeyChainStore/UICKeyChainStore.h>

CHConstructor{
    printf(INSERT_SUCCESS_WELCOME);
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
//#ifndef __OPTIMIZE__
//        CYListenServer(6666);
//
//        MDCycriptManager* manager = [MDCycriptManager sharedInstance];
//        [manager loadCycript:NO];
//
//        NSError* error;
//        NSString* result = [manager evaluateCycript:@"UIApp" error:&error];
//        NSLog(@"result: %@", result);
//        if(error.code != 0){
//            NSLog(@"error: %@", error.localizedDescription);
//        }
//        [[MDMethodTrace sharedInstance] addClassTrace:@"BookShelfViewController"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSArray *arr = [UICKeyChainStore allItemsWithItemClass:UICKeyChainStoreItemClassGenericPassword];
            NSLog(@"%@\n---------------------------", arr);
            if (arr.count) {
                NSDictionary *one = arr.firstObject;
                NSString *key = one[@"key"];
                NSString *service = one[@"service"];
                NSString *accessGroup = one[@"accessGroup"];
                
                [UICKeyChainStore removeItemForKey:key service:service accessGroup:accessGroup];
            }
            
            arr = [UICKeyChainStore allItemsWithItemClass:UICKeyChainStoreItemClassGenericPassword];
            NSLog(@"%@", arr);
        });
//#endif
        
    }];
}
//
//@interface AboutUsViewController : UIViewController
//
//@end

//CHDeclareClass(BookShelfViewController)
//
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wstrict-prototypes"
//
////add new method
//CHDeclareMethod1(void, BookShelfViewController, newMethod, NSString*, output){
//    NSLog(@"This is a new method : %@", output);
//}
//
//#pragma clang diagnostic pop
//
//CHOptimizedClassMethod0(self, void, BookShelfViewController, classMethod){
//    NSLog(@"hook class method");
//    CHSuper0(BookShelfViewController, classMethod);
//}
//
//CHOptimizedMethod0(self, NSString*, BookShelfViewController, getMyName){
//    //get origin value
//    NSString* originName = CHSuper(0, BookShelfViewController, getMyName);
//
//    NSLog(@"origin name is:%@",originName);
//
//    //get property
//    NSString* password = CHIvar(self,_password,__strong NSString*);
//
//    NSLog(@"password is %@",password);
//
//    [self newMethod:@"output"];
//
//    //set new property
//    self.newProperty = @"newProperty";
//
//    NSLog(@"newProperty : %@", self.newProperty);
//
//    //change the value
//    return @"iOSleep";
//
//}
//
////add new property
//CHPropertyRetainNonatomic(BookShelfViewController, NSString*, newProperty, setNewProperty);
//
//CHConstructor{
//    CHLoadLateClass(BookShelfViewController);
//    CHClassHook0(BookShelfViewController, getMyName);
//    CHClassHook0(BookShelfViewController, classMethod);
//
//    CHHook0(BookShelfViewController, newProperty);
//    CHHook1(BookShelfViewController, setNewProperty);
//}
//
