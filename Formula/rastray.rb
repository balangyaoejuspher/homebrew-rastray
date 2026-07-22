class Rastray < Formula
  desc "Blazing-fast static analysis for security, dependencies, and performance"
  homepage "https://github.com/balangyaoejuspher/rastray"
  version "0.19.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a4124b2b1c627ee496ba467218895d10152fd43c8bd84bc0b370c77b06032d35"
    end
    on_intel do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d551cdedc42846d04acbf7f718c3add31002d0806722c4564c60221b8ceb75a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "204fd159cc1ea69f215f81c5c598df6640ca1a9f5fc9eb5bda64e650db0e6ba4"
    end
  end

  def install
    bin.install "rastray"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rastray --version")
    (testpath/"sample.py").write <<~PY
      import os
      os.system("echo hello")
    PY
    system "#{bin}/rastray", testpath.to_s, "--fail-on", "never"
  end
end
