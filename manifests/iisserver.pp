# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::iisserver
class users::iisserver {
  $iis_features = ['Web-Server','Web-WebServer','Web-Mgmt-Console','Web-Mgmt-Tools']
  windowsfeature { $iis_features:
    ensure => present,
  }
}
