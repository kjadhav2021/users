# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::registrydemo
class users::registrydemo {
  registry_value { 'HKLM\Software\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
  ensure => present,
  type   => dword,
  data   => 0x00000001,
  }
}
