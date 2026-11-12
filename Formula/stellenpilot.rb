class Stellenpilot < Formula
  include Language::Python::Virtualenv

  desc "Local job search assistant for Germany that scores jobs against your CV"
  homepage "https://stellenpilot.dev"
  url "https://files.pythonhosted.org/packages/26/96/c61136b7468aabd703bd26e18bb551fa36f7f6b10fd1e2a5611f9e2cbdcd/stellenpilot-0.13.0.tar.gz"
  sha256 "be724b086c3336df3953966dcc2f516f34a05b02559452c7222d07244dc5d13e"
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
    url "https://files.pythonhosted.org/packages/00/c2/4c34b3229abae3e2fcc7809e6cf80fdea159771a37142f475fbf1009c809/pypdf-7.0.1.tar.gz"
    sha256 "0a78bb99efb41e9088260e9a8e5da134a5cbb9a322014744177bf29b5267ea6d"
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
