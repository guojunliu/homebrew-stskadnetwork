# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/homebrew-stskadnetwork/raw/master/product/4.0.0/stskadnetwork_4.0.0.tar.gz"
  version "4.0.0"
  sha256 "200506221324f5b15f1a8d6c411be94b3bc7c147d4b10abb0076647f42315835"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
