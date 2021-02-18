# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::userfileio
class users::userfileio {
  file { 'fileiotest.txt':
    ensure  => 'file',
    path    => 'C:/testDir/fileiotest.txt',
    content => 'file creation test',
    owner   => 'Alice',
    group   => 'Developers',
  }
  file { 'testDir':
    ensure => 'directory',
    path   => 'C:/testDir/',
    owner  => 'Alice',
    group  => 'Developers',
    mode   => '0751',
  }
}
