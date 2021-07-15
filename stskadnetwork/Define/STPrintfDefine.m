//
//  STPrintfDefinea.m
//  stskadnetwork
//
//  Created by steve on 2021/7/15.
//

#import "STPrintfDefine.h"

void printfDivider(void) {
    char bar[78]; memset(bar, '-', sizeof(bar)); printf(GREEN"\n%s"NONE,bar);
}
