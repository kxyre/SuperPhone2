<?php
    if (!function_exists('str_contains')) {
        function str_contains(string $haystack, string $needle): bool
        {
            return '' === $needle || false !== strpos($haystack, $needle);
        }
    }
    
    spl_autoload_register(function ($class_name) {
        if($class_name == "BD") {
            require '../../config/' . $class_name . '.php';
        }
        else if(str_contains($class_name,"DAO")) {
            require '../../model/dao/' . $class_name . '.php';
        }
        else {
            require '../../model/bean/' . $class_name . '.php';
        }
    });