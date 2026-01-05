# typed: false
# frozen_string_literal: true

class Finn < Formula
  desc "Desktop daemon for Finn - control LLM assistants from your phone"
  homepage "https://tryfinn.ai"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-arm64"
      sha256 "e4c38517c9bd2c46b09006a07abaf78e853a797a07659a1f41fe4457efe4aef0"

      def install
        bin.install "finn-macos-arm64" => "finn"
      end
    else
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-intel"
      sha256 "3867e9a1862f1e75413a9d242f6aeb454913abae0f229a6215b876480cee5b02"

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
