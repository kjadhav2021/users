# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::userright
class users::userright {
  local_security_policy { 'Log on as a service':
  ensure       => 'present',
  policy_value => 'cloudbase-init,webapp',
  }
}
