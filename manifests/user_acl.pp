# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::useracl
class users::user_acl {
  $filename = 'C:/acltestDir/acltest.txt'
  $dirname = 'C:/acltestDir/'
  file { $filename:
    ensure  => 'file',
    path    => 'C:/acltestDir/acltest.txt',
    content => 'forge access control list module test',
  }
  file { $dirname:
    ensure => 'directory',
    path   => 'C:/acltestDir/',
  }
  acl { $dirname:
    purge       => true,
    permissions => [
      { identity => 'Administrator', rights   => ['full'] },
      { identity => 'Alice', rights   => ['full'] },
      { identity => 'Developers', rights   => ['read'] },
    ],
  }
}
