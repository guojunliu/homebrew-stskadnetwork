# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/stskadnetwork/files/6738776/stskadnetwork.tar.gz"
  version "1.0.0"
  sha256 "34eed7609777e7637815373b71534e0dc64c5b34b13efe5a445315f38eaaed92"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
