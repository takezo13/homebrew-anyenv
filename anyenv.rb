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

      if which anyenv > /dev/null; then
        eval "$(anyenv init -)"
      fi
    EOS
  end

  test do
    system bin/"anyenv", "install", "-l"
  end
end
