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
    my @keys = qw/carrier user_id/;
    +{ map { $_ => $ma->$_ } @keys };
}

__END__

=== DoCoMo
--- input
headers:
  User-Agent: DoCoMo/2.0 SH905i(c100;TB;W24H16)
  X-DCMGUID: abcdef0
--- expected
carrier: I
user_id: abcdef0

=== SoftBank
--- input
headers:
  User-Agent: SoftBank/1.0/815SH/SHJ002 Browser/NetFront/3.4 Profile/MIDP-2.0 Configuration/CLDC-1.1
  X-JPHONE-UID: abcdef0123456789
--- expected
carrier: V
user_id: abcdef0123456789

=== KDDI
--- input
headers:
  User-Agent: KDDI-SA3A UP.Browser/6.2.0.13.1.4 (GUI) MMP/2.0
  X-UP-SUBNO: abcdef0123_45.ezweb.ne.jp
--- expected
carrier: E
user_id: abcdef0123_45.ezweb.ne.jp
