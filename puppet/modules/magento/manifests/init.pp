class magento(
    $install_magento     = true,
    $magento_version     = "magento-ce-1.9.1.0",
    $install_sample_data = true,
    $base_url            = "http://magento.local",
    $base_domain         = "magento.local",
    $user                = "magento",
    $group               = "magento",
    $installation_folder = "/magento"
) {

    host { "magento.local":
        ip => "127.0.0.1"
    }

    class { "magento::nginx":
        installation_folder => $installation_folder
    }

    include magento::mysql
    include magento::php

    class { "magento::php_fpm":
        user      => $user,
        group     => $group
    }

    class { "magento::n98magerun":
        install_magento     => $install_magento,
        magento_version     => $magento_version,
        install_sample_data => $install_sample_data,
        base_url            => $base_url,
        installation_folder => $installation_folder
    }
}