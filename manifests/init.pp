# @summary A short summary of the purpose of this class
#
# A description of what this class does
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
}
