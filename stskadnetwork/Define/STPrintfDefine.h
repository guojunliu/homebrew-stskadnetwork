//
//  STPrintfDefine.h
//  stskadnetwork
//
//  Created by steve on 2021/7/14.
//

#import <Foundation/Foundation.h>
#import "STColorDefine.h"

//**************************************************************************************
//*    ____ _____   ____  _  __    _       _ _   _      _ __        __         _       *
//*   / ___|_   _| / ___|| |/ /   / \   __| | \ | | ___| |\ \      / /__  _ __| | __   *
//*   \___ \ | |   \___ \| ' /   / _ \ / _` |  \| |/ _ \ __\ \ /\ / / _ \| '__| |/ /   *
//*    ___) || |    ___) | . \  / ___ \ (_| | |\  |  __/ |_ \ V  V / (_) | |  |   <    *
//*   |____/ |_|   |____/|_|\_\/_/   \_\__,_|_| \_|\___|\__| \_/\_/ \___/|_|  |_|\_\   *
//*                                                                                    *
//**************************************************************************************

// 上边的字符画
#define flowersCode ([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCgogX19fXyBfX19fXyAgIF9fX18gIF8gIF9fICAgIF8gICAgICAgXyBfICAgXyAgICAgIF8gX18gICAgICAgIF9fICAgICAgICAgXyAgICAgCi8gX19ffF8gICBffCAvIF9fX3x8IHwvIC8gICAvIFwgICBfX3wgfCBcIHwgfCBfX198IHxcIFwgICAgICAvIC9fXyAgXyBfX3wgfCBfXyAKXF9fXyBcIHwgfCAgIFxfX18gXHwgJyAvICAgLyBfIFwgLyBfYCB8ICBcfCB8LyBfIFwgX19cIFwgL1wgLyAvIF8gXHwgJ19ffCB8LyAvIAogX19fKSB8fCB8ICAgIF9fXykgfCAuIFwgIC8gX19fIFwgKF98IHwgfFwgIHwgIF9fLyB8XyBcIFYgIFYgLyAoXykgfCB8ICB8ICAgPCAgCnxfX19fLyB8X3wgICB8X19fXy98X3xcX1wvXy8gICBcX1xfXyxffF98IFxffFxfX198XF9ffCBcXy9cXy8gXF9fXy98X3wgIHxffFxfXCAKCgogICAgICAgICAgICAgICAgICAgICAgICAg5bm/5ZGK6IGU55ufU0tBZE5ldHdvcmvlkIjlubblt6XlhbcgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg==" options:NSDataBase64DecodingIgnoreUnknownCharacters] encoding:NSUTF8StringEncoding].UTF8String)

#define printfW(s) printf(YELLOW"%s"NONE,s)
#define printfE(s) printf(RED"%s"NONE,s)
#define printfG(s) printf(GREEN"%s"NONE,s)
#define printfB(s) printf(BLUE"%s"NONE,s)
#define printfC(s) printf(CYAN"%s"NONE,s)
#define printfP(s) printf(PURPLE"%s"NONE,s)
#define printfY(s) printf(YELLOW"%s"NONE,s)
#define printfFlower printf(LIGHT_GREEN"\n%s"NONE,flowersCode)

void printfDivider(void);


