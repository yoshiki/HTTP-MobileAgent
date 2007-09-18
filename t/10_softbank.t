use strict;
use Test::More tests => 33;

BEGIN { use_ok 'HTTP::MobileAgent' }

my @Tests = (
    [ 'SoftBank/1.0/910T/TJ001/SNXXXXXXXXX Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1',
      '1.0', '910T', 1, 'XXXXXXXXX', undef, undef, {
          Profile => 'MIDP-2.0',
          Configuration => 'CLDC-1.1',
      },
    ],
    [ 'SoftBank/1.0/910T/TJ001 Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1',
      '1.0', '910T', 1, undef, undef, undef, {
          Profile => 'MIDP-2.0',
          Configuration => 'CLDC-1.1',
      },
    ],
);

for (@Tests) {
    my($ua, @data) = @$_;

    local $ENV{'HTTP_USER_AGENT'} = $ua;
    # can't get the 3GC's "model" from user-agent.
    local $ENV{'HTTP_X_JPHONE_MSNAME'} = $data[1];
    my $agent = HTTP::MobileAgent->new();
    isa_ok $agent, 'HTTP::MobileAgent';
    isa_ok $agent, 'HTTP::MobileAgent::JPhone';
    ok !$agent->is_docomo && !$agent->is_ezweb;
    ok $agent->is_j_phone && $agent->is_vodafone && $agent->is_softbank;
    ok $agent->name eq 'Vodafone' || $agent->name eq 'SoftBank' || $agent->name =~ /^MOT/ ;

    is $agent->user_agent, $ua,            "ua";
    is $agent->version, $data[0],          "version";
    is $agent->model, $data[1],            "model";
    is $agent->packet_compliant, $data[2], "packet compliant";

    is $agent->serial_number, $data[3],    "serial";
    is $agent->vendor, $data[4],           "vendor";
    is $agent->vendor_version, $data[5],   "vendor version";
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
SoftBank/1.0/910T/TJ001/SNXXXXXXXXX Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1
