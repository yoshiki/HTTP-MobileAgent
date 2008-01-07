use strict;
use warnings;
use Test::Base;
use HTTP::MobileAgent;

filters {
    input => [qw/functions/],
    expected => [qw/yaml/],
};

run_is_deeply input => 'expected';

sub functions {
    local $ENV{HTTP_USER_AGENT} = shift;
    my $ma = HTTP::MobileAgent->new;
    my @keys = qw/carrier type xhtml_compliant/;
    +{ map { $_ => $ma->$_ } @keys } ;
}

__END__

===
--- input: SoftBank/1.0/910T/TJ001/SNXXXXXXXXX Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1
--- expected
carrier: V
type: 3GC
xhtml_compliant: 1

===
--- input: J-PHONE/2.0/J-DN02
--- expected
carrier: V
type: C2
xhtml_compliant: 0

===
--- input: J-PHONE/2.0/J-DN02
--- expected
carrier: V
type: C2
xhtml_compliant: 0

===
--- input: Vodafone/1.0/V702NK/NKJ001 Series60/2.6 Profile/MIDP-2.0 Configuration/CLDC-1.1
--- expected
carrier: V
type: 3GC
xhtml_compliant: 1

===
--- input: Vodafone/1.0/V802SE/SEJ001/SNXXXXXXXXX Browser/SEMC-Browser/4.1 Profile/MIDP-2.0 Configuration/CLDC-1.10
--- expected
carrier: V
type: 3GC
xhtml_compliant: 1

===
--- input: J-PHONE/5.0/V801SH SH/0005aa Profile/MIDP-1.0 Configuration/CLDC-1.0 Ext-Profile/JSCL-1.1.0
--- expected
carrier: V
type: W
xhtml_compliant: 1

