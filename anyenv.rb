class Anyenv < Formula
  desc "all in one for **envs"
  homepage "https://github.com/riywo/anyenv"
  head "https://github.com/riywo/anyenv.git"

  def install
    inreplace "libexec/anyenv", %(ANYENV_ROOT="${HOME}/.anyenv"), %(ANYENV_ROOT="#{prefix}")
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    To  enable anyenv, add this to your profile follow:
      eval "$(anyenv init -)"
    EOS
  end

  test do
    system bin/"anyenv", "install", "-l"
  end
end
