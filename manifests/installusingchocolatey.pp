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
    provider        => 'chocolatey',
    install_options => ['/Passive', '/NoRestart'],
  }
  reboot { 'after':
    provider  => 'windows',
    subscribe => Package['7zip'],
  }
}
