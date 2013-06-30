class magento(
  $install_magento     = true,
  $magento_version     = "magento-ce-1.7.0.2",
  $install_sample_data = true
) {

    host { "magento.local":
        ip => "127.0.0.1"
    }

    include magento::nginx
    include magento::mysql
    include magento::php
    include magento::php_fpm

    class { "magento::n98magerun":
      install_magento     => $install_magento,
      magento_version     => $magento_version,
      install_sample_data => $install_sample_data
    }
}