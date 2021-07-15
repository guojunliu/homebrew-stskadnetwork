# stskadnetwork

![Alt text](Image/1.png)

[![MIT License](https://img.shields.io/badge/license-MIT-brightgreen)](https://github.com/guojunliu/homebrew-stskadnetwork/blob/master/LICENSE)
[![Version](https://img.shields.io/badge/version-v2.0.0-blue)](https://github.com/guojunliu/homebrew-stskadnetwork)
[![GitHub Release](https://img.shields.io/badge/release-v2.0.0-orange)](https://github.com/guojunliu/homebrew-stskadnetwork)
[![Github All Releases](https://img.shields.io/badge/downloads-37KB-yellowgreen)](https://github.com/guojunliu/homebrew-stskadnetwork/raw/master/product/2.0.0/stskadnetwork_2.0.0.tar.gz)
[![Github Platform](https://img.shields.io/badge/platform-Linux-red)](https://github.com/guojunliu/homebrew-stskadnetwork)
[![Github homebrew](https://img.shields.io/badge/homebrew-v2.0.0-green)](https://github.com/guojunliu/homebrew-stskadnetwork)



## 介绍

针对运行 iOS 14 或更高版本的用户的游戏必须在Info.plist文件中实现广告商网络 ID 。包含一系列经过验证的网络 ID 使广告来源能够通过 Apple 的SKAdNetwork框架正确地归因其广告支出。

在`Info.plist`文件中添加SKAdNetworkIdentifier时有以下几个特点

- 广告联盟众多，较为繁琐
- 广告联盟会有交叉的`SKAdNetworkIdentifier`，需要去重
- 广告联盟会不定时更新

本工具可以从各广告联盟直接抓取`SKAdNetworkIdentifier`，去重后，直接写入项目的`Info.plist`中，方便快捷

## 安装

需要提前安装[Homebrew](https://brew.sh/)，然后在终端中运行以下代码

`brew install guojunliu/stskadnetwork/stskadnetwork`


## 使用

```
usage: stskadnetwork [-p] [-x <path>] [-t <path>]

    -p, --plist                      将SKAdNetworkId导出到当前路径下的Info.plist

    -x, --xml                        将SKAdNetworkId以XML格式导出到当前路径
    -t, --txt                        将SKAdNetworkId以TXT格式导出到当前路径
```

### 两种用法，建议使用第一种
#### 第一种、直接写入项目Info.plist

cd到项目`Info.plist`同级目录

- `stskadnetwork -p`

#### 第二种、导出去重合并之后的SKAdNetworkIdentifier

YourPath为文件导出的目的目录

- `stskadnetwork -x YourPath`
- `stskadnetwork -t YourPath `