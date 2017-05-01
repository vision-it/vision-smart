# Class: vision_smart::short
# ===========================
#
# Parameters
# ----------
#
# Examples
# --------
#
# @example
# contain ::vision_smart::short
#

class vision_smart::short (

  String $interval,
  String $command,
  String $user,

) {

  file { '/etc/cron.d/smart-short-test':
    ensure  => present,
    owner   => 'root',
    mode    => '0751',
    content => template('vision_smart/basic-cron.erb')
  }

}
