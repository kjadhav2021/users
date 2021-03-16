# @summary
#  A special defined resource type for setting up local security policies in windows machine.
#
#  It accepts three parameters ensure, security_policy, and security_policy_value.
#
# @example
#  users::user_policy_management { 'title':
#     ensure                 => 'present/absent',
#     security_policy        => 'policy_name',
#     security_policy_value  => 'policy_value',
#  }
#
# @param ensure
#   ensure as a string value such as 'present/absent'.
# @param security_policy
#   security_policy as a string value such as 'Log on as a service'.
# @param security_policy_value
#   security_policy_value as a string value such as 'local_account_name'.
define users::user_policy_management (
  String $ensure,
  String $security_policy,
  String $security_policy_value,#'cloudbase-init,webapp',
)
{
  local_security_policy { $security_policy:
    ensure       => $ensure,
    policy_value => $security_policy_value,
  }
}
