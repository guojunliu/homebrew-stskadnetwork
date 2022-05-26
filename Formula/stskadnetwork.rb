# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/homebrew-stskadnetwork/raw/master/product/4.0.0/stskadnetwork_4.0.0.tar.gz"
  version "4.0.0"
  sha256 "1538945d7c4885ebe6f7789a82753b992b21168e6fcff8615e50d180f40cd2a2"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
