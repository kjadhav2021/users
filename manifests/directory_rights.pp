# @summary
#  A special defined resource type for setting up directory rights
#
#  This resource type allows a lot of flexibility in the assigning directory rights.
#  It accepts directory path , local account name and directory rights as string parameters
#
# @example
#  users::directory_rights { 'title':
#     directory_path => 'directory path',
#     account_name   => 'account name',
#     rights         => 'rights'
#  }
# @param directory_path
#   directory path as a string value such as 'C:/pos_reports/'.
# @param account_name
#   account name as a string value such as 'alice'.
# @param rights
#   directory rights as a string value such as 'full' or 'read'
define users::directory_rights (
  String $directory_path,
  String $account_name,
  String $rights,
)
{
  acl { $directory_path:
    purge       => true,
    permissions => [
      { identity => $account_name, rights   => [$rights] },
    ],
  }
}
