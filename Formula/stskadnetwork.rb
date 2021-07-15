# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/homebrew-stskadnetwork/raw/master/product/2.0.0/stskadnetwork_2.0.0.tar.gz"
  version "2.0.0"
  sha256 "69813a53d6d794d2373de6527940606172cad2fee5680eaa1ad4692b3f0aafca"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
