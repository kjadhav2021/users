# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::installusingchocolatey
class users::installusingchocolatey {
  include chocolatey
  package { '7zip':
    ensure          => installed,
    provider        => chocolatey,
    #install_options => ['/VERYSILENT', '/NORESTART'],
  }
  reboot { 'after':
    subscribe => Package['7zip'],
  }
}
