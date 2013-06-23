class magento::n98magerun {

    class { "::n98magerun": }
    class { "::n98magerun::install":
        installation_folder => "/vagrant_data",
        db_host             => "localhost",
        db_user             => "root",
        db_pass             => "root",
        db_name             => "magento",
        base_url            => "http://127.0.0.1:8080",
        install_sample_data => true
    }
}