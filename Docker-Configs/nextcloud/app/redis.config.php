<?php
$CONFIG = array (
   'memcache.local' => '\OC\Memcache\Redis',
   'filelocking.enabled' => 'true',
   'memcache.locking' => '\OC\Memcache\Redis',
   'redis' => array(
        'host' => 'redis',
        'port' => 6379,
        'timeout' => 0.0,
         ),
);
