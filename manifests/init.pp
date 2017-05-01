# Class: vision_smart
# ===========================
#
# Parameters
# ----------
#
# @param monitoring_class Handles monitoring specific configuration
#
# Examples
# --------
#
# @example
# contain ::vision_smart
#

class vision_smart (

) {

  package { 'smartmontools':
    ensure => present,
  }

  file { '/usr/local/sbin/smart-test.sh':
    ensure => present,
    owner  => 'root',
    mode   => '0751',
    source => 'puppet:///modules/vision_smart/smart-test.sh',
  }

  contain ::vision_smart::short
  contain ::vision_smart::long

}
