use inc::Module::Install;
name 'HTTP-MobileAgent';
all_from 'lib/HTTP/MobileAgent.pm';

requires 'HTTP::Headers' => 1.43;

build_requires 'Test::More' => 0.32;

auto_include;
WriteAll;

