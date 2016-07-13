class Anyenv < Formula
  desc "all in one for **envs"
  homepage "https://github.com/r[<32;34;3Miywo/anyenv"
  head "https://github.com/riywo/anyenv.git"

  def install
    inreplace "libexec/anyenv", %(ANYENV_ROOT="${HOME}/.anyenv"), %(ANYENV_ROOT="#{prefix}")
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    To  enable anyenv, add this to your profile:

      if which anyenv > /dev/null; then
        eval "$(anyenv init -)"
      fi

    To add "anyenv update" command, run the following commands:

      mkdir -p $(anyenv root)/plugins
      git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

    EOS
  end

  test do
    system bin/"anyenv", "install", "-l"
  end
end
