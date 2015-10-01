#
# == Class: phpfpm::package
#
# Installs the php-fpm package. Do not use this class directly.
#
class phpfpm::package {

  package { $::phpfpm::package_name:
    ensure => $::phpfpm::ensure,
  }

  if $::phpfpm::ensure == 'present' {
    file { "/var/log/php-fpm":
      ensure => directory,
      owner => 'php-fpm',
      group => 'root',
      mode => '0775',
      require => Package[$::phpfpm::package_name],
    }
  }
}

