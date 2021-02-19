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
  # Delete the default website to prevent a port binding conflict.
  iis_site {'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }

  iis_site { 'minimal':
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\minimal',
    applicationpool => 'DefaultAppPool',
    require         => [
      File['minimal'],
      Iis_site['Default Web Site']
    ],
  }

  file { 'minimal':
    ensure => 'directory',
    path   => 'c:\\inetpub\\minimal',
  }
}
