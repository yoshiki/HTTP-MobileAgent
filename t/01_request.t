use strict;
use Test::More tests => 9;

BEGIN { use_ok 'HTTP::MobileAgent' }

# various way to make request

my $ua = "Mozilla/1.0";

{
    my $agent = HTTP::MobileAgent->new($ua);
    isa_ok $agent, 'HTTP::MobileAgent';
    is $agent->user_agent, $ua;
}

{
    local $ENV{HTTP_USER_AGENT} = $ua;
    my $agent = HTTP::MobileAgent->new($ua);
    isa_ok $agent, 'HTTP::MobileAgent';
    is $agent->user_agent, $ua;
}

SKIP: {
    eval { require HTTP::Headers; };
    skip "no HTTP::Headers", 2 if $@;

    my $header = HTTP::Headers->new;
    $header->header('User-Agent' => $ua);
    my $agent = HTTP::MobileAgent->new($header);
    isa_ok $agent, 'HTTP::MobileAgent';
    is $agent->user_agent, $ua;
}

{
    # mock object
    package Apache;
    sub header_in {
	my($r, $header) = @_;
	return $r->{$header};
    }

    package main;
    my $r = bless { 'User-Agent' => $ua }, 'Apache';
    my $agent = HTTP::MobileAgent->new($r);
    isa_ok $agent, 'HTTP::MobileAgent';
    is $agent->user_agent, $ua;
}
