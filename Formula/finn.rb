# typed: false
# frozen_string_literal: true

class Finn < Formula
  desc "Desktop daemon for Finn - control LLM assistants from your phone"
  homepage "https://tryfinn.ai"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-arm64"
      sha256 "1570629a2d5c64984c531e2a1d851596bf074902eae8616817948e88954ae11c"

      def install
        bin.install "finn-macos-arm64" => "finn"
      end
    else
      url "https://github.com/getfinn/finn/releases/download/v#{version}/finn-macos-intel"
      sha256 "29ec8d74b81d1342b53cbd2d977e94e6ee542b21c45fcd5e77bb145fb5b0e215"

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
