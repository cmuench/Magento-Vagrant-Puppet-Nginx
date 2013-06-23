class magento::php {
    include php
    php::module { ['curl', 'xdebug', 'mysql',  'gd', 'mcrypt', 'cgi']:
        require => Class["php::install", "php::config"]
    }

    php::conf { [ 'pdo' ]:
        source  => 'puppet:///modules/magento/etc/php5/conf.d/pdo.ini',
        require => Class["php::install", "php::config"],
    }
    php::conf { [ 'pdo_mysql' ]:
        source  => 'puppet:///modules/magento/etc/php5/conf.d/pdo_mysql.ini',
        require => Class["php::install", "php::config"],
    }
}