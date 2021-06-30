# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/stskadnetwork/blob/master/product/1.0.1/stskadnetwork_1.0.1.tar.gz"
  version "1.0.1"
  sha256 "186180f27be2078055c5946f9403596e5f0e3b925502c90e91800310bcffc49f"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
