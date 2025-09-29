<?php

declare(strict_types=1);

return [

    /*
    | The list of reserved subdomains for the application.
    | These subdomains are not allowed to be used by users.
    */

    'main' => env('DOMAIN_MAIN', 'uzm.app'),

    'cname' => env('DOMAIN_CNAME', 'cname.uzm.app'),

    'available' => [
        env('DOMAIN_MAIN', 'uzm.app'),
        'git.now',
    ]
];
