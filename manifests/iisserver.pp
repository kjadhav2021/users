# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::iisserver
class users::iisserver {
  $iisfeatures = ['Web-Server','Web-WebServer','Web-Mgmt-Console','Web-Mgmt-Tools']
  windowsfeature { $iisfeatures:
    ensure => 'present',
  }
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']
  iis_feature { $iis_features:
    ensure => 'present',
  }
}
