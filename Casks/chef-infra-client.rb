cask "chef-infra-client" do
  version "16.11.7"
  sha256 "49af5f17c92378374fcb0fa65e78d7a48dee928a7a19edca24186d695120bedf"

  # packages.chef.io was verified as official when first introduced to the cask
  url "https://packages.chef.io/files/stable/chef/#{version}/mac_os_x/10.14/chef-#{version}-1.x86_64.dmg"
  name "Chef Infra Client"
  homepage "https://community.chef.io/tools/chef-infra/"

  depends_on macos: ">= :high_sierra"

  pkg "chef-#{version}-1.pkg"

  # As suggested in https://docs.chef.io/install_dk.html#mac-os-x
  uninstall_postflight do
    system_command "/usr/bin/find",
      args: ["/usr/local/bin", "-lname", "/opt/chef/*", "-delete"],
      sudo: true
  end

  uninstall pkgutil: "com.getchef.pkg.chef",
            delete:  "/opt/chef/"
end
