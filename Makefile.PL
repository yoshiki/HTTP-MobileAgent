use inc::Module::Install;
name 'HTTP-MobileAgent';
all_from 'lib/HTTP/MobileAgent.pm';

requires 'HTTP::Headers' => 1.43;
requires 'WWW::MobileCarrierJP' => 0.04;

build_requires 'Test::More' => 0.32;

use_test_base;
auto_include;
WriteAll;
