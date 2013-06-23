class magento::php_fpm inherits magento::php {
    php::fpm::pool { 'www':
        user  => "vagrant",
        group => "vagrant"
    }
}