# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include users::iisserver
class users::iisserver {
  # $iisfeatures = ['Web-Server','Web-WebServer','Web-Mgmt-Console','Web-Mgmt-Tools']
  # windowsfeature { $iisfeatures:
  #   ensure => 'present',
  # }
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']
  iis_feature { $iis_features:
    ensure => 'present',
  }
  iis_application_pool { 'minimal_site_app_pool':
  ensure                  => 'present',
  state                   => 'started',
  managed_pipeline_mode   => 'Integrated',
  managed_runtime_version => 'v4.0',
  }
  iis_site { 'minimal':
  ensure          => 'started',
  physicalpath    => 'c:\\inetpub\\minimal',
  applicationpool => 'minimal_site_app_pool',
  require         => File['minimal'],
  }
  file { 'minimal':
  ensure => 'directory',
  path   => 'c:\\inetpub\\minimal',
  }
}
