# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::userfileio
class users::userfileio {
  file { 'fileiotest.txt':
    ensure  => 'file',
    path    => 'C:/fileiotest.txt',
    content => 'file creation test',
    owner   => 'Alice',
    group   => 'Developers',
    type    => 'file',
  }
}
