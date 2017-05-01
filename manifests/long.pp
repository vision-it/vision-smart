# Class: vision_smart::long
# ===========================
#
# Parameters
# ----------
#
# Examples
# --------
#
# @example
# contain ::vision_smart::long
#

class vision_smart::long (

  String $interval,
  String $command,
  String $user,

) {

  file { '/etc/cron.d/smart-long-test':
    ensure  => present,
    owner   => 'root',
    mode    => '0751',
    content => template('vision_smart/basic-cron.erb')
  }

}
