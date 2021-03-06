# @summary
# A sample class to show use of acl module from puppet forge
#
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
