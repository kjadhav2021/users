# @summary
# A sample class to show use of local_security_policy module from puppet forge
#
#
# @example
#   include users::userright
class users::user_right (
  String $security_policy,
  String $security_policy_value,#'cloudbase-init,webapp',
)
{
  local_security_policy { $security_policy:
    ensure       => 'present',
    policy_value => $security_policy_value,
  }
}
