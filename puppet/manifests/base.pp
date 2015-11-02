node default {

    class { "apt":
        always_apt_update => true
    }

    Exec { path => [ "/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin"] }

    package { 'vim': ensure => installed }
    package { 'wget': ensure => latest }
    package { 'curl': ensure => latest }
    include git

    # Installs Magento
    #
    # Valid versions are:
    #
    #   magento-ce-1.6.2.0
    #   magento-ce-1.7.0.2
    #   magento-ce-1.9.1.0
    #   mageplus-master
    #   magento-mirror-1.4.2.0
    #   magento-mirror-1.5.1.0
    #   magento-mirror-1.6.2.0
    #   magento-ce-2.0.0.0-dev
    class { "magento":
        install_magento     => true,
        magento_version     => "magento-ce-1.9.1.0",
        install_sample_data => false,
        base_url            => "http://127.0.0.1:8080",
        user                => "vagrant",
        group               => "vagrant",
        installation_folder => "/vagrant_data"
    }
}
