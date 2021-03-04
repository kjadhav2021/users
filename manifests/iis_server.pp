# @summary It is sample class to demonstrate the use of forge modules windowsfeature and iis_feature (and its components)
#
# It downloads windowsfeature and iis_feature module from puppet forge and set up a minimal website.
# I have tested the website by copying sample html file in website folder
#
# @example
#   include users::iisserver

class users::iis_server {
  $iisfeatures = ['Web-Server','Web-WebServer','Web-Mgmt-Console','Web-Mgmt-Tools']
  windowsfeature { $iisfeatures:
    ensure => 'present',
  }
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']
  iis_feature { $iis_features:
    ensure => 'present',
  }
  # Delete the default website to prevent a port binding conflict.
  iis_site { 'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
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
