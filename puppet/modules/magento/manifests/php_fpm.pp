class magento::php_fpm(
    $user  = "magento",
    $group = "magento"
) inherits magento::php {
    php::fpm::pool { 'www':
        user  => $user,
        group => $group
    }
}