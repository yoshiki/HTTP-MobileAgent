use strict;
use Test::More tests => 61;

BEGIN { use_ok 'HTTP::MobileAgent' }

my @Tests = (
    [ 'Vodafone/1.0/V802SE/SEJ001/SNXXXXXXXXX Browser/SEMC-Browser/4.1 Profile/MIDP-2.0 Configuration/CLDC-1.10', 
      '1.0', 'V802SE',1,'XXXXXXXXX',undef,undef, {
      Profile => 'MIDP-2.0',
      Configuration => 'CLDC-1.10',
      } ],
    [ 'MOT-V980/80.2B.04I MIB/2.2.1 Profile/MIDP-2.0 Configuration/CLDC-1.1',
      undef ,'V702MO',1,undef,undef,undef,{
      Profile => 'MIDP-2.0',
      Configuration => 'CLDC-1.1',
      }],
    [ 'Vodafone/1.0/V702NK/NKJ001 Series60/2.6 Profile/MIDP-2.0 Configuration/CLDC-1.1',
     '1.0','V702NK',1,undef,undef,undef,{
      Profile => 'MIDP-2.0',
      Configuration => 'CLDC-1.1',
      }],
    [ 'Nokia6820/2.0 (4.83) Profile/MIDP-1.0 Configuration/CLDC-1.0 (compatible; Googlebot-Mobile/2.1; +http://www.google.com/bot.html)',
      undef,'Nokia6820',undef,undef,undef,undef,{
          Profile => 'MIDP-1.0',
          Configuration => 'CLDC-1.0',
      }], # for funny googlebot
);

for (@Tests) {
    my($ua, @data) = @$_;

    local $ENV{'HTTP_USER_AGENT'} = $ua;
    # can't get the 3GC's "model" from user-agent.
    local $ENV{'HTTP_X_JPHONE_MSNAME'} = $data[1];
    my $agent = HTTP::MobileAgent->new();
    isa_ok $agent, 'HTTP::MobileAgent';
    isa_ok $agent, 'HTTP::MobileAgent::JPhone';
    ok !$agent->is_docomo && $agent->is_j_phone && $agent->is_vodafone && !$agent->is_ezweb;
    ok $agent->name eq 'Vodafone' || $agent->name =~ /^MOT/ ;

    is $agent->user_agent, $ua,     "ua";
    is $agent->version, $data[0],   "version";
    is $agent->model, $data[1],     "model";
    is $agent->packet_compliant, $data[2], "packet compliant";

    is $agent->serial_number, $data[3], "serial";
    is $agent->vendor, $data[4],        "vendor";
    is $agent->vendor_version, $data[5],    "vendor version";
    is_deeply $agent->java_info, $data[6];

    ok $agent->is_type_3gc && !$agent->is_type_c && !$agent->is_type_p && !$agent->is_type_w;
}


while (<DATA>) {
    next if /^#/;
    chomp;
    my($ua,$model) = split(/,/,$_);
    local $ENV{HTTP_USER_AGENT} = $ua;
    my $agent = HTTP::MobileAgent->new;
    isa_ok $agent, 'HTTP::MobileAgent', $ua;
    ok $agent->name && ($agent->name,'Vodafone' || $agent->name =~ /^MOT/);
    ok !$agent->is_docomo && $agent->is_vodafone && !$agent->is_ezweb;
    ok $agent->is_type_3gc;
}


__END__
Vodafone/1.0/V902SH/SHJ001/SN999999999999999 Browser/UP.Browser/7.0.2.1 Profile/MIDP-2.0 Configuration/CLDC-1.1 Ext-J-Profile/JSCL-1.2.2 Ext-V-Profile/VSCL-2.0.0,V902SH
MOT-V980/80.2F.2E. MIB/2.2.1 Profile/MIDP-2.0 Configuration/CLDC-1.1,V702MO
