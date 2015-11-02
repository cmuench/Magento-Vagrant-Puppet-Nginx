class magento::n98magerun(
    $install_magento     = true,
    $magento_version     = "magento-ce-1.9.1.0",
    $install_sample_data = true,
    $base_url            = "http://magento.local",
    $installation_folder = "/magento"
) {
    class { "::n98magerun": }

    if $install_magento == true {
        class { "::n98magerun::install":
            magento_version      => $magento_version,
            installation_folder  => $installation_folder,
            db_host              => "localhost",
            db_user              => "root",
            db_pass              => "root",
            db_name              => "magento",
            base_url             => $base_url,
            install_sample_data  => $install_sample_data,
            installation_timeout => 3600
        }
    }
}