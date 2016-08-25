class liveperson_test_sites {
  file { '/usr/share/nginx/html':
    ensure => 'directory',
    owner => 'root',
    group => 'root',
    recurse => true,
    purge => true,
    force => true,
    mode => 0755,
    source => 'puppet:///modules/liveperson_test_sites/',
  }

  package { 'nginx':
    ensure  =>  'installed',
  }

  service { 'nginx':
    ensure  =>  'running',
  }
}
