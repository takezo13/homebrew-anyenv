class Anyenv < Formula
  desc "anyenv - all in one for **env"
  homepage "https://github.com/riywo/anyenv"
  head "git://github.com/riywo/anyenv.git", :using => :git

  def install
    inreplace "libexec/anyenv", %Q|ANYENV_ROOT="${HOME}/.anyenv"|, %Q|ANYENV_ROOT="#{prefix}"|
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    Run the following script and add configuration to your Run-Control File:
      
      echo 'eval "$(anyenv init -)"' >> ~/.your_profile
    EOS
  end

  test do
    system bin/"anyenv" "install" "-L"
  end
end
