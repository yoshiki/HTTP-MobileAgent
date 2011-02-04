use strict;
use Test::More tests => 4;
use_ok "HTTP::MobileAgent";

{
    my $env = {
        HTTP_USER_AGENT => 'DoCoMo/1.0/D504i/c10/TJ',
        HTTP_X_DCMGUID  => 'foobar',
    };
    my $agent = HTTP::MobileAgent->new($env);

    is $agent->user_agent, $env->{HTTP_USER_AGENT}, "user agent matches";
    is $agent->user_id, $env->{HTTP_X_DCMGUID}, "fetchs proper guid";
    ok $agent->is_docomo, "properly detects docomo";
}