class nginx {
	package { 'apache2.2-common':
		ensure => absent,
	}
	package { 'nginx':
		ensure => installed,
	}
	service { 'nginx':
		ensure => running,
		require => Package ['nginx'],
	}
	file { '/var/www/cat-pictures':
		ensure => "directory",
	}
	file { '/var/www/cat-pictures/index.html':
		ensure => present,
		content => "Automated from Puppet \n",
	}

	file {'/etc/nginx/sites-enabled/default':
		source => 'puppet:///modules/nginx/cat-pictures.conf',
		notify => Service['nginx'],
	}
} 
