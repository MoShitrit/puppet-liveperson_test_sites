class liveperson_test_sites {

  $dirs = ['/liveperson/code/server_openresty','/liveperson/code/server_openresty/nginx', '/liveperson/data/server_openresty', '/liveperson/data/server_openresty/logs']
  file { $dirs:
    ensure => 'directory',
    owner => 'root',
    group => 'root',
    recurse => true,
    mode => 0755,
  }

  file { '/liveperson/code/server_openresty/nginx/html':
    ensure => 'directory',
    owner => 'root',
    group => 'root',
    recurse => true,
    purge => true,
    force => true,
    mode => 0755,
    source => 'puppet:///modules/liveperson_test_sites/html/',
  }

  file { '/etc/nginx/nginx.conf':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    force => true,
    source => 'puppet:///modules/liveperson_test_sites/conf/nginx.conf'
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    force => true,
    source => 'puppet:///modules/liveperson_test_sites/conf/conf.d/default.conf'
  }

  package { 'nginx':
    ensure  =>  'installed',
  }

  service { 'nginx':
    ensure  =>  'running',
  }
}

File [$dirs] -> File ['/liveperson/code/server_openresty/nginx/html']