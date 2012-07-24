use strict;
use Test::More;

eval q{ use XML::Simple };
if ($@) {
    plan skip_all => 'XML::Simple not installed';
}
else {
    plan tests => 51;
    $ENV{DOCOMO_MAP} = 't/DoCoMoMap.xml';
    use_ok 'HTTP::MobileAgent';
}

my @Tests = (
    [ { HTTP_X_JPHONE_DISPLAY => '120*117', HTTP_USER_AGENT => 'J-PHONE/2.0/J-DN02',
        HTTP_X_JPHONE_COLOR => 'C256' },
      { width => 120, height => 117, color => 1, depth => 256. } ],
    [ { HTTP_X_UP_DEVCAP_SCREENPIXELS => '90,70',
        HTTP_USER_AGENT => 'KDDI-TS21 UP.Browser/6.0.2.276 (GUI) MMP/1.1',
        HTTP_X_UP_DEVCAP_SCREENDEPTH => '16,RGB565',
        HTTP_X_UP_DEVCAP_ISCOLOR => 1, },
      { width => 90, height => 70, color => 1, depth => 2**16 }, ],
    [ { HTTP_X_UP_DEVCAP_SCREENPIXELS => '90,70',
        HTTP_USER_AGENT => 'KDDI-TS21 UP.Browser/6.0.2.276 (GUI) MMP/1.1',
        HTTP_X_UP_DEVCAP_SCREENDEPTH => '1',
        HTTP_X_UP_DEVCAP_ISCOLOR => 0 },
      { width => 90, height => 70, color => '', depth => 2 }, ],
    [ { HTTP_USER_AGENT => "DoCoMo/2.0 SH902i(c100;TB;W24H12)" },
      { width => 240, height => 240, color => 1, depth => 262144 } ],
    [ { HTTP_USER_AGENT => "DoCoMo/2.0 N902i(c100;TB;W24H12)" },
      { width => 240, height => 270, color => 1, depth => 262144 } ],
    [ { HTTP_USER_AGENT => "DoCoMo/2.0 P701iD(c100;TB;W24H12)" },
      { width => 240, height => 270, color => 1, depth => 65536 } ],
    [ { HTTP_USER_AGENT => "DoCoMo/2.0 D702i(c100;TB;W23H12)" },
      { width => 230, height => 240, color => 1, depth => 262144 } ],
    [ { HTTP_USER_AGENT => 'DoCoMo/2.0 N703imyu' },
      { width => 240, height => 270, color => 1, depth => 262144 } ],
    [ { HTTP_USER_AGENT => 'DoCoMo/2.0 P08A3' },
      { width => 480, height => 662, color => 1, depth => 262144 } ],
    [ { HTTP_USER_AGENT => "DoCoMo/2.0 SO902iWP+(c100;TB;W24H12)" },
      { width => 240, height => 256, color => 1, depth => 262144 } ],
);

for (@Tests) {
    my($env, $values) = @$_;
    local *ENV = $env;
    my $ua = HTTP::MobileAgent->new;
    my $display = $ua->display;
    isa_ok $display, 'HTTP::MobileAgent::Display';
    for my $method (keys %$values) {
        is $display->$method(), $values->{$method}, "$method = $values->{$method}";
    }
}
