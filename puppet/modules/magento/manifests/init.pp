class magento {

    host { "magento.local":
        ip => "127.0.0.1"
    }

    include magento::nginx
    include magento::mysql
    include magento::php
    include magento::php_fpm
    include magento::n98magerun
}