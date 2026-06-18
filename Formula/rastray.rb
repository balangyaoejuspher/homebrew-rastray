class Rastray < Formula
  desc "Blazing-fast static analysis for security, dependencies, and performance"
  homepage "https://github.com/balangyaoejuspher/rastray"
  version "0.17.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "750c485346ac42a51122c48a6db56ab7c0e62ebe206d016c99f3929701f783b5"
    end
    on_intel do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9e7d0402789a26e3d735c1f5ba4aa4049b923fba48447884bc205a9cc3deafb0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbc4bf28ee0e4bcfccb2950c62529fcd21622b14ab89bedcec5a9d60b4637602"
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
