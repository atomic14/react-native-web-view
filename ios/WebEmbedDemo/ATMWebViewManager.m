//
//  ATMWebViewManager.m
//  WebEmbedDemo
//
//  Created by Chris Greening on 08/06/2020.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
#import "WebEmbedDemo-Swift.h"

@interface ATMWebViewManager : RCTViewManager

@end

@implementation ATMWebViewManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(uri, NSString)
RCT_EXPORT_VIEW_PROPERTY(onLoaded, RCTDirectEventBlock)

- (UIView *) view
{
  return [[WebView alloc] init];
}

@end
