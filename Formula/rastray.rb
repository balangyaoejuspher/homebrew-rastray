class Rastray < Formula
  desc "Blazing-fast static analysis for security, dependencies, and performance"
  homepage "https://github.com/balangyaoejuspher/rastray"
  version "0.18.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "08ad457a4a3d21fdfa409dac4c9c821f216b0b4ff7b0fc10e20763f7bb7a3fb8"
    end
    on_intel do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d4adc5335e7b566762beafeca2ad06a78cb518dfe6d4cf82f0262b75bb5e3038"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/balangyaoejuspher/rastray/releases/download/v#{version}/rastray-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae87f6149f2b4ed5cc1fa49cb61ca705cfc729082b8f4a22687c1ad7e3fb8d77"
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
