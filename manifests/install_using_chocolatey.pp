# @summary
#  A special defined resource type for installing softwares using chocolatey repo.
#
#  This resource type allows user to install softwares using chocolatey repository.
#  It accepts two parameters package_name and reboot_machine.
#
# @example
#  users::install_using_chocolatey { 'title':
#     package_name => 'software name',
#     reboot_machine   => 'true/false',
#  }
# @param package_name
#   package name as a string value such as '7zip'.
# @param reboot_machine
#   reboot machine flag as a boolean value such as 'true' or 'false'.
define users::install_using_chocolatey (
  String $package_name,
  Boolean $reboot_machine,
)
{
  include chocolatey
  package { $package_name:
    ensure   => installed,
    provider => 'chocolatey',
  }
  if $reboot_machine {
  reboot { 'after':
    provider  => 'windows',
    subscribe => Package[$package_name],
  }
  }
}
