use strict;
use warnings;
use Test::Base;
use HTTP::MobileAgent;
use HTTP::Headers;

filters {
    input => [qw/yaml functions/],
    expected => [qw/yaml/],
};

run_is_deeply input => 'expected';

sub functions {
    my $inputs_ref = shift;
    my $header = HTTP::Headers->new;
    $header->header( $_ => $inputs_ref->{ headers }->{ $_ } )
        for keys %{ $inputs_ref->{ headers } };
    my $ma = HTTP::MobileAgent->new( $header );
    my @keys = qw/carrier browser_version/;
    +{ map { $_ => $ma->$_ } @keys };
}

__END__

=== DoCoMo
--- input
headers:
  User-Agent: DoCoMo/2.0 SH905i(c100;TB;W24H16)
--- expected
carrier: I
browser_version: 1.0

=== DoCoMo
--- input
headers:
  User-Agent: DoCoMo/2.0 P07A3(c500;TB;W24H15)
--- expected
carrier: I
browser_version: 2.0
