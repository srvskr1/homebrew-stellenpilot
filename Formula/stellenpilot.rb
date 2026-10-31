class Stellenpilot < Formula
  include Language::Python::Virtualenv

  desc "Local job search assistant for Germany that scores jobs against your CV"
  homepage "https://stellenpilot.dev"
  url "https://files.pythonhosted.org/packages/66/2b/7801eafa73c98a3d70a9360014be3808df72231d59dba5d9265ab391d27c/stellenpilot-0.12.3.tar.gz"
  sha256 "4ecc08d92c8b72b4247b312c953ca552e888f175cd1fe5e8f71c35c067d375e5"
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
    url "https://files.pythonhosted.org/packages/1e/e1/ec8f4d155c997c45917153a5521e60d6ee6389d68abdcbc8e44e564caffc/pypdf-6.21.4.tar.gz"
    sha256 "c8817e3f888d47a087872ded69812c1ef30cacb871d6e053e0c00bbaf0bc2163"
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
