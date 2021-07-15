//
//  STProgressBar.m
//  stskadnetwork
//
//  Created by steve on 2021/7/12.
//

#import "STProgressBar.h"

#define ProgressBarScale    (2)     // 最小变化单位
#define ProgressBarCount    (50)    // 进度条长度
#define ProgressBarSymbol   ('#')   // 进度条填充符号
#define ProgressBarUnderway(percent) ("|/-\\"[percent%4])   // 进行中的标志符号

@implementation STProgressBar

+ (void)update:(int)percent {
    
    // 声明进度符号
    char bar[ProgressBarCount];
    memset(bar, 0, sizeof(bar));

    // 创建对应进度的符号字符串
    for (int i = 0; i <percent/ProgressBarScale; i++) {
        bar[i] = ProgressBarSymbol;
    }
    
    // 输出当前进度
    printf("[%-50s] %16s [%d%%][%c]\r", bar, "", percent, ProgressBarUnderway(percent));
    fflush(stdout); //刷新缓冲区

    // 如果进度已经达到100% 则停止
    if (percent >= 100) {
//        printf("\n");
        [self clean];
    }
}

+ (void)clean {
    printf("%-80s\r", " ");
    fflush(stdout);
}

#pragma mark - 模拟

+ (void)start {
    [STProgressBar update:0];
}

+ (void)completion {
    for (int i = 0; i <= 100; i++) {
        [STProgressBar update:i];
        usleep(5000); //每0.1s刷新进度条
    }
}

@end
