# @summary
# A demo class for exploring registry_value module from puppet forge
#
# @example
#   include users::registrydemo
class users::registry_demo {
  registry_value { 'HKLM\Software\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => present,
    type   => dword,
    data   => 0x00000001,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonUI':
    ensure => present,
    type   => dword,
    data   => 0x00000000,
  }
}
