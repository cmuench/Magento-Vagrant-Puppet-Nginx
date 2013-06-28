node default {

    class { "apt":
        always_apt_update => true
    }

    Exec { path => [ "/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin"] }

    host { "magento.local":
        ip => "127.0.0.1"
    }

    package { 'vim': ensure => installed }
    package { 'wget': ensure => latest }
    package { 'curl': ensure => latest }

    include magento
}
