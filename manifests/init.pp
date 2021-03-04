# @summary The puppet class is an entry point for user module.
#
# It read hiera data for users and groups elements and create users and groups using puppet inbuilt resources user and group
#
# @example
#   include users
class users {
  lookup('users',Hash,'hash').each | String $username, Hash $attrs | {
    user{ $username:
      ensure     => 'present',
      comment    => $attrs['comment'],
      groups     => $attrs['groups'],
      password   => $attrs['password'],
      membership => 'inclusive',
    }
  }
  lookup('groups',Hash,'hash').each | String $groupname, Hash $grpattrs | {
    group{ $groupname:
      ensure  =>'present',
      members => $grpattrs['members'],
    }
  }

  class { 'users::userright':
    security_policy => 'Log on as a service',
  }

  include users::user_fileio
  include users::user_acl
  include users::registry_demo
  include users::iis_server
  # include users::install_using_archive
  include users::install_using_chocolatey
}
