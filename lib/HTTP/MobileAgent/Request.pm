package HTTP::MobileAgent::Request;
use strict;
use Scalar::Util ();

sub new {
    my($class, $stuff) = @_;
    if (!defined $stuff) {
        bless { env => \%ENV }, 'HTTP::MobileAgent::Request::Env';
    }
    elsif (ref $stuff eq 'HASH') {
        # PSGI hash - translate it to an HTTP::Headers object
        require HTTP::Headers;
        my $hdrs = HTTP::Headers->new(
            map {
                (my $field = $_) =~ s/^HTTPS?_//;
                ( $field => $stuff->{$_} );        }
            grep { /^(?:HTTP|CONTENT|COOKIE)/i } keys %$stuff
        );
        bless { r => $hdrs }, 'HTTP::MobileAgent::Request::HTTPHeaders';
    }
    elsif (UNIVERSAL::isa($stuff, 'Apache')) {
        bless { r => $stuff }, 'HTTP::MobileAgent::Request::Apache';
    }
    elsif (Scalar::Util::blessed($stuff) && $stuff->isa('HTTP::Headers')) {
        bless { r => $stuff }, 'HTTP::MobileAgent::Request::HTTPHeaders';
    }
    else {
        bless { env => { HTTP_USER_AGENT => $stuff } }, 'HTTP::MobileAgent::Request::Env';
    }
}

package HTTP::MobileAgent::Request::Env;

sub get {
    my($self, $header) = @_;
    $header =~ tr/-/_/;
    return $self->{env}->{"HTTP_" . uc($header)};
}

package HTTP::MobileAgent::Request::Apache;

sub get {
    my($self, $header) = @_;
    return $self->{r}->header_in($header);
}

package HTTP::MobileAgent::Request::HTTPHeaders;

sub get {
    my($self, $header) = @_;
    return $self->{r}->header($header);
}

1;
