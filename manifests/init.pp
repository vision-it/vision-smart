# Class: vision_smart
# ===========================
#
# Parameters
# ----------
#
# @param devices List of SMART managed devices
#

class vision_smart (

  Array[String] $devices = [],

) {

  package { 'smartmontools':
    ensure => present,
  }

  file { '/etc/smartd.conf':
    ensure  => present,
    owner   => 'root',
    mode    => '0644',
    content => template('vision_smart/smartd.conf.erb'),
    require => Package['smartmontools'],
  }

  service { 'smartd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/etc/smartd.conf'],
  }

}
