class magento::nginx {
    include ::nginx
    ::nginx::resource::vhost { 'magento.local':
        ensure           => present,
        www_root         => '/vagrant_data',
        location_options => { try_files => "try_files \$uri \$uri/ @handler" },
        locations => {
            1 => { location => "^~ /app/",                options => [ "deny all" ] },
            2 => { location => "^~ /includes/",           options => [ "deny all" ] },
            3 => { location => "^~ /lib/",                options => [ "deny all" ] },
            4 => { location => "^~ /media/downloadable/", options => [ "deny all" ] },
            5 => { location => "^~ /pkginfo/",            options => [ "deny all" ] },
            6 => { location => "^~ /report/config.xml",   options => [ "deny all" ] },
            7 => { location => "^~ /var",                 options => [ "deny all" ] },
            8 => { location => "/.", options  => { return => "404" } },
            9 => {
                location => "@handler",
                options  => {
                    rewrite => "/ /index.php"
                }
            },
            10 => {
                location => '~ [^/]\.php(/|$)',
                options => [
                    "if (!-e \$request_filename) { rewrite / /index.php last; } #",
                    "fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name",
                    "fastcgi_pass  127.0.0.1:9000",
                    "fastcgi_index index.php",
                    "include       fastcgi_params",
                ]
            }
        }
    }
}