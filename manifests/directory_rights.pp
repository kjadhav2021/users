# @summary
#  A special defined resource type for setting up directory rights
#
#  This resource type allows a lot of flexibility in the assigning directory rights.
#  It accepts directory path , local account name and directory rights as string parameters
#
# @example
#  users::directory_rights { 'directory_title':
#     directory_path => 'directory path',
#     account_name   => 'account name',
#     rights         => 'rights'
#  }
# @param directory_title
#   directory title as a string value such as 'pos_reports'.
# @param directory_path
#   directory path as a string value such as 'C:/pos_reports/'.
# @param account_name
#   account name as a string value such as 'alice'.
# @param rights
#   directory rights as a string value such as 'full' or 'read'
define users::directory_rights (
  String $directory_title,
  String $directory_path,
  String $account_name,
  String $rights,
)
{
  file { $directory_path:
    ensure => 'directory',
    path   => $directory_path,
  }
  acl { $directory_title:
    target      => $directory_path,
    purge       => true,
    permissions => [
      { identity => $account_name, rights   => [$rights] },
    ],
  }
}
