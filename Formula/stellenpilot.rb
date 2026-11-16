class Stellenpilot < Formula
  include Language::Python::Virtualenv

  desc "Local job search assistant for Germany that scores jobs against your CV"
  homepage "https://stellenpilot.dev"
  url "https://files.pythonhosted.org/packages/bb/5f/fdd8abc84c025de0aa5fac4bf6739d167d3e0dceaa1d942219fa1989b7ff/stellenpilot-0.14.1.tar.gz"
  sha256 "699ef9e4f969b9468a81fbcb48ab7340dde38ea69c4881e5cbc6054e0a4b12ae"
  license "MIT"

  depends_on "python@3.13"

  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  # The resources below are refreshed by `brew update-python-resources stellenpilot`.
  # The bump workflow in srvskr1/stellenpilot runs that on every release.
  resource "lxml" do
    url "https://files.pythonhosted.org/packages/23/ad/28ecd7cb894d172f3c9c80a075eeeb2017ac62e3632cee05a5f9493547eb/lxml-6.1.3.tar.gz"
    sha256 "45222d94ddd511536f3b2f7d9deae3b2339b4ce0f075f1ca25703b07cad9dd21"
  end

  resource "pypdf" do
    url "https://files.pythonhosted.org/packages/60/d3/367aa9baefaededd3321cde46bbcb9f008bb51cef3a6b745608352a99534/pypdf-7.1.0.tar.gz"
    sha256 "ca3fa902369e98a6d2cb7b56396de902b72ef9bb3c1e8706c1bfc7d8bd0cf0d7"
  end

  resource "python-docx" do
    url "https://files.pythonhosted.org/packages/a9/f7/eddfe33871520adab45aaa1a71f0402a2252050c14c7e3009446c8f4701c/python_docx-1.2.0.tar.gz"
    sha256 "7bc9d7b7d8a69c9c02ca09216118c86552704edc23bac179283f2e38f86220ce"
  end

  resource "truststore" do
    url "https://files.pythonhosted.org/packages/ee/9f/c5201d42a484c061e528825fc8e2d565f5abd50a4ced6fb7d29c4ec99b2b/truststore-0.10.5.tar.gz"
    sha256 "30d36967ccaded5cbb38d602c433f53600036c79d502f4533a49b60a03bbefcd"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Start Stellenpilot:
        mkdir -p ~/Stellenpilot && cd ~/Stellenpilot
        stellenpilot init
        stellenpilot serve

      Updates come with:
        brew upgrade stellenpilot
    EOS
  end

  test do
    system bin/"stellenpilot", "--home", testpath/"ws", "init"
    assert_path_exists testpath/"ws/config.toml"
  end
end
