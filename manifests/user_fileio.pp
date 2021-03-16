# @summary
# A sample class to show use of inbuilt file resource from puppet
#
#
# @example
#   include users::userfileio
class users::user_fileio {
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
    mode   => 'u=rwx,g=rx,o=r',
  }
}
