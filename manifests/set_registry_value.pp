# @summary
#  A special defined resource type for setting registry values in windows machine.
#
#  It accepts four parameters registry_value_path, registry_enable, registry_value_type and
#  registry_data_value.
#
# @example
#  users::set_registry_value { 'title':
#     registry_value_path   => 'registry_value_path',
#     registry_enable       => 'present/absent',
#     registry_value_type   => 'value_type',
#     registry_data_value   => 'registry_data',
#  }
#
# @param registry_value_path
#   registry_value_path as a string value such as 'HKLM\Software\Microsoft\Active Setup\Installed Components\IsInstalled'.
# @param registry_enable
#   registry_enable as a string value such as 'present' or 'absent'.
# @param registry_value_type
#   registry_value_type as a string value such as 'int,dword'.
# @param registry_data_value
#   registry_data_value as a String value such as '000000001'.
define users::set_registry_value (
  String $registry_value_path,
  String $registry_enable,
  String $registry_value_type,
  String $registry_data_value,
)
{
  registry_value { $registry_value_path:
    ensure => $registry_enable,
    type   => $registry_value_type,
    data   => $registry_data_value,
  }
}
