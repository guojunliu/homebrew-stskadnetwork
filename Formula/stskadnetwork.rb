# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Stskadnetwork < Formula
  desc "合并各广告平台SKAdNetwork工具"
  homepage "https://github.com/guojunliu/stskadnetwork"
  url "https://github.com/guojunliu/stskadnetwork/raw/master/product/1.0.2/stskadnetwork_1.0.2.tar.gz"
  version "1.0.2"
  sha256 "07fbaed53638f560d0ce48d64b98b0af53fe2d74baee646c4b9705995c3a4aa3"
  license "MIT"

  def install
      bin.install "stskadnetwork"
  end
end
