# Formula template. Rendered by scripts/render-homebrew.sh at release time.
# The result goes to Formula/mulchie-cli.rb in the tap.
class MulchieCli < Formula
  desc "Command-line monitor and optimizer for machines running many AI agents"
  homepage "https://mulchie.com"
  version "0.3.0-rc.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/williamrogersdev/mulchie/releases/download/v#{version}/mulchie-aarch64-apple-darwin.tar.gz"
      sha256 "126ef2a341c7194db07c73e953b0ac30b2caa03e0763afb00e9d99706b52afbc"
    end
    on_intel do
      url "https://github.com/williamrogersdev/mulchie/releases/download/v#{version}/mulchie-x86_64-apple-darwin.tar.gz"
      sha256 "b25533660c5d5c894d4005bf21840788aef95d47097657515218bd11e26b8c51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/williamrogersdev/mulchie/releases/download/v#{version}/mulchie-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a9254c3c26000c71c61c19edc69d4229a4eb8896ed1e05af1f47cf131448e6c"
    end
    on_intel do
      url "https://github.com/williamrogersdev/mulchie/releases/download/v#{version}/mulchie-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "089aa1da798b6d538e981b4f2e8da423b2704eca13ad91867e59ea363f4433c7"
    end
  end

  # The cask also links a `mulchie` binary into the same bin directory.
  conflicts_with cask: "mulchie", because: "both install a `mulchie` command"

  def install
    bin.install "mulchie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mulchie --version")
  end
end
