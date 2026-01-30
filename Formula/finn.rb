# typed: false
# frozen_string_literal: true

class Finn < Formula
  desc "Desktop daemon for Finn - control LLM assistants from your phone"
  homepage "https://tryfinn.ai"
  version "1.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-arm64"
      sha256 "3eb01521c4961107682bbd2d5379c02d79e55d2aed86af72d11d40e9547ec830"

      def install
        bin.install "finn-macos-arm64" => "finn"
      end
    else
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-intel"
      sha256 "8b40b496b60bc4e9c5c4f83152d39c7b38d0f652e4ee37799ebdb5fca6eb34c6"

      def install
        bin.install "finn-macos-intel" => "finn"
      end
    end
  end

  def caveats
    <<~EOS
      Finn runs as a menu bar app. After installation:

        1. Run 'finn' to start the daemon
        2. Click the menu bar icon and select "Sign In"
        3. Approve folders you want to work with

      For more info: https://tryfinn.ai/download
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/finn --version")
  end
end
