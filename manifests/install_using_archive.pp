# @summary
# A sample class to show use of archive module from puppet forge
#
# @example
#   include users::installusingarchive
class users::install_using_archive {
  class { 'archive':
    seven_zip_name     => '7-Zip 19.00 (x64 edition)',
    seven_zip_source   => 'https://www.7-zip.org/a/7z1900-x64.msi',
    seven_zip_provider => 'windows',
  }
}
