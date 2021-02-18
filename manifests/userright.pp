# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::userright
class users::userright(
  $security_policy=undef,
)
{
  local_security_policy { $security_policy :
  ensure       => 'present',
  policy_value => 'cloudbase-init,webapp',
  }
}
