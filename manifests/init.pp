# = Class: hosts
#
# Manage standard /etc/hosts entries:
#
# - Self hostname and FQDN (where available).
# - IPv4 loopback.
# - IPv6 lookback and multicast.
#
# This manages `hosts(5)` as a standard `file{}` resource. As a result, any
# stray entries will be removed.
#
class hosts {
  file { '/etc/hosts':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('hosts/hosts.erb'),
  }
}
