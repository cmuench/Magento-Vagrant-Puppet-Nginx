class magento {
    include magento::nginx
    include magento::mysql
    include magento::php
    include magento::php_fpm
    include magento::n98magerun
}