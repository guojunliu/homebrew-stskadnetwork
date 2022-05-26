# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/homebrew-stskadnetwork/raw/master/product/4.0.0/stskadnetwork_4.0.0.tar.gz"
  version "4.0.0"
  sha256 "13bd8b92ab2fc9891f99d683df886b8ef9eca6eba59e824dc092a02b0dde753c"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
