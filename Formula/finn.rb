# typed: false
# frozen_string_literal: true

class Finn < Formula
  desc "Desktop daemon for Finn - control LLM assistants from your phone"
  homepage "https://tryfinn.ai"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-arm64"
      sha256 "8689c773cebd35532371583f04589d02b5e95d4ba1fda13db067f01043ec9cb7"

      def install
        bin.install "finn-macos-arm64" => "finn"
      end
    else
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-intel"
      sha256 "6d7b63cb16b28eca04f00c3909cff86adf39f4f9b3819c5ecc684c920e7d7e64"

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
