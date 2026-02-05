# typed: false
# frozen_string_literal: true

class Finn < Formula
  desc "Desktop daemon for Finn - control LLM assistants from your phone"
  homepage "https://tryfinn.ai"
  version "1.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-arm64"
      sha256 "7aed6662b024aa591cd140fc9a25fb53899a3bc975e2698b8ffd92253e24179b"

      def install
        bin.install "finn-macos-arm64" => "finn"
      end
    else
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-intel"
      sha256 "5cb17643a27b2353a030b2f1d7b84af535cf4a61e3aa27ee5a33c115f2b0556a"

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
