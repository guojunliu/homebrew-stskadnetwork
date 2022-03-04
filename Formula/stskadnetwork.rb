# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/homebrew-stskadnetwork/raw/master/product/3.0.0/stskadnetwork_3.0.0.tar.gz"
  version "3.0.0"
  sha256 "2a1845aa945b5e736e5963c0102c78fbcf88af3e05acc07a5eec70e052f3c8af"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
