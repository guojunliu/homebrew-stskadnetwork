# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/homebrew-stskadnetwork/raw/master/product/5.0.0/stskadnetwork_5.0.0.tar.gz"
  version "5.0.0"
  sha256 "f63484a9f8c24432bafc31ad9431832ba4349ce34e1396d38383cdce3d0909a8"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
