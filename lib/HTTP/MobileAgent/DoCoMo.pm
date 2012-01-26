package HTTP::MobileAgent::DoCoMo;

use strict;
use vars qw($VERSION);
$VERSION = 0.24;

use base qw(HTTP::MobileAgent);

__PACKAGE__->make_accessors(
    qw(version model status bandwidth
       serial_number is_foma card_id xhtml_compliant comment)
);

use HTTP::MobileAgent::DoCoMoDisplayMap qw($DisplayMap);

# various preferences
use vars qw($DefaultCacheSize $HTMLVerMap $GPSModelsRe);
$DefaultCacheSize = 5;

# http://www.nttdocomo.co.jp/service/developer/make/content/spec/useragent/index.html
$HTMLVerMap = [
    qr/(?i-xsm:^(?:D501i|F501i|N501i|P501i)$)/,
    '1.0',
    qr/(?i-xsm:^(?:D209i|D502i|ER209i|F209i|F210i|F502i|F502it|F671i|KO209i|KO210i|N209i|N210i|N502i|N502it|N821i|NM502i|P209i|P209iS|P210i|P502i|P651ps|P821i|R209i|R691i|SH821i|SO502i|SO502iWM)$)/,
    '2.0',
    qr/(?i-xsm:^(?:D2101V|D210i|D211i|D503i|D503iS|F211i|F503i|F503iS|N2001|N2002|N211i|N211iS|N503i|N503iS|P2002|P2101V|P211i|P211iS|P503i|P503iS|R211i|R692i|SH2101V|SH251i|SH251iS|SO210i|SO211i|SO503i|SO503iS|T2101V)$)/,
    '3.0',
    qr/(?i-xsm:^(?:eggy|P751v)$)/,
    '3.2',
    qr/(?i-xsm:^(?:D251i|D251iS|D504i|F2051|F2102V|F212i|F251i|F504i|F504iS|F661i|F671iS|F672i|N2051|N2102V|N251i|N251iS|N2701|N504i|N504iS|NM705i|NM706i|NM850iG|P2102V|P251iS|P504i|P504iS|SO212i|SO213i|SO213iS|SO213iWR|SO504i)$)/,
    '4.0',
    qr/(?i-xsm:^(?:D252i|D253i|D253iWM|D505i|D505iS|D506i|D701i|D701iWM|D900i|D901i|D901iS|F505i|F505iGPS|F506i|F700i|F700iS|F880iES|F881iES|F900i|F900iC|F900iT|F901iC|F901iS|L600i|L601i|L602i|M702iG|M702iS|N252i|N253i|N505i|N505iS|N506i|N506iS|N506iSII|N600i|N700i|N701i|N701iECO|N900i|N900iG|N900iL|N900iS|N901iC|N901iS|P213i|P252i|P252iS|P253i|P253iS|P505i|P505iS|P506iC|P506iCII|P700i|P701iD|P851i|P900i|P900iV|P901i|P901iS|P901iTV|SA700iS|SA800i|SH252i|SH505i|SH505iS|SH506iC|SH700i|SH700iS|SH851i|SH900i|SH901iC|SH901iS|SO505i|SO505iS|SO506i|SO506iC|SO506iS)$)/,
    '5.0',
    qr/(?i-xsm:^(?:D702i|D702iBCL|D702iF|D800iDS|D851iWM|D902i|D902iS|F702iD|F882iES|F883i|F883iS|F902i|F902iS|L01A|L01C|L02B|L03A|L03B|L04A|L04B|L06A|L704i|L705i|L705iX|L706ie|L852i|N601i|N702iD|N702iS|N902i|N902iL|N902iS|N902iX|P702i|P702iD|P703imyu|P704imyu|P902i|P902iS|SA702i|SH702iD|SH702iS|SH902i|SH902iS|SH902iSL|SO702i|SO902i|SO902iWP+)$)/,
    '6.0',
    qr/(?i-xsm:^(?:D703i|D704i|D705i|D705imyu|D903i|D903iTV|D904i|F05A|F703i|F704i|F705i|F801i|F883iES|F883iESS|F903i|F903iBSC|F903iX|F904i|L10C|N703iD|N703imyu|N704imyu|N903i|N904i|P703i|P704i|P903i|P903iTV|P903iX|P904i|SH703i|SH704i|SH705i|SH705iII|SH706ie|SH903i|SH903iTV|SH904i|SO703i|SO704i|SO903i|SO903iTV)$)/,
    '7.0',
    qr/(?i-xsm:^(?:D905i|F07A|F10A|F884i|F884iES|F905i|F905iBiz|N03A|N05A|N06B|N705i|N705imyu|N706i|N706iII|N706ie|N905i|N905iBiz|N905imyu|N906iL|P705i|P705iCL|P705imyu|P706imyu|P905i|P905iTV|SH905i|SH905iTV|SO705i|SO706i|SO905i|SO905iCS)$)/,
    '7.1',
    qr/(?i-xsm:^(?:F01A|F02A|F03A|F04A|F06A|F08C|F09B|F706i|F906i|N01A|N02A|N04A|N906i|N906imyu|P01A|P02A|P03A|P04A|P05A|P06A|P10A|P706ie|P906i|SH01A|SH02A|SH03A|SH04A|SH706i|SH706iw|SH906i|SH906iTV|SO906i)$)/,
    '7.2',
];

# http://www.nttdocomo.co.jp/binary/pdf/service/developer/make/content/spec/imode_spec.pdf
$GPSModelsRe = qr/SH03D|P03D|N03D|N02D|F04D|F02D|F10C|F09C|F07C|F03C|F02C|F01C|SH11C|SH10C|SH09C|SH06C|SH05C|SH04C|SH02C|SH01C|CA01C|N05C|N03C|N02C|N01C|P05C|P04C|P03C|L01B|N05B|N04B|N02B|N01B|P06B|P04B|P02B|P01B|F09B|F07B|F06B|F04B|F03B|F02B|F01B|SH08B|SH07B|SH04B|SH03B|SH02B|SH01B|SH08A|SH07A3|SH06A3|SH05A3|SH04A|SH03A|SH02A|SH01A|N09A3|N08A3|N06A3|N02A|N01A|P09A3|P08A3|P07A3|P02A|P01A|F10A|F09A3|F06A|F05A|F03A|F01A|N906iL|N906i|F906i|N906imyu|SH906i|SO906i|P906i|F884iES|F884i|F801i|F905iBiz|SO905iCS|N905iBiz|N905imyu|SO905i|F905i|P905i|N905i|D905i|SH905i(?!TV)|P904i|D904i|F904i|N904i|SH904i|F883iESS|F883iES|F903iBSC|SO903i|F903i|D903i|N903i|P903i(?!TV|X)|SH903i|SA800i|SA702i|SA700iS|F505iGPS|F661i/;

sub is_docomo { 1 }

sub carrier { 'I' }

sub carrier_longname { 'DoCoMo' }

sub parse {
    my $self = shift;
    my($main, $foma_or_comment) = split / /, $self->user_agent, 2;

    if ($foma_or_comment && $foma_or_comment =~ s/^\((.*)\)$/$1/) {
	# DoCoMo/1.0/P209is (Google CHTML Proxy/1.0)
	$self->{comment} = $1;
	$self->_parse_main($main);
    } elsif ($foma_or_comment) {
	# DoCoMo/2.0 N2001(c10;ser0123456789abcde;icc01234567890123456789)
	$self->{is_foma} = 1;
	@{$self}{qw(name version)} = split m!/!, $main;
	$self->_parse_foma($foma_or_comment);
    } else {
	# DoCoMo/1.0/R692i/c10
	$self->_parse_main($main);
    }

    $self->{xhtml_compliant} =
      ( $self->is_foma && !( $self->html_version && $self->html_version == 3.0 ) )
      ? 1
      : 0;
}

sub _parse_main {
    my($self, $main) = @_;
    my($name, $version, $model, $cache, @rest) = split m!/!, $main;
    $self->{name}    = $name;
    $self->{version} = $version;
    $self->{model}   = $model;
    $self->{model}   = 'SH505i' if $self->{model} eq 'SH505i2';

    if ($cache) {
	$cache =~ s/^c// or return $self->no_match;
	$self->{cache_size} = $cache;
    }

    for (@rest) {
	/^ser(\w{11})$/  and do { $self->{serial_number} = $1; next };
	/^(T[CDBJ])$/    and do { $self->{status} = $1; next };
	/^s(\d+)$/       and do { $self->{bandwidth} = $1; next };
	/^W(\d+)H(\d+)$/ and do { $self->{display_bytes} = "$1*$2"; next; };
    }
}

sub _parse_foma {
    my($self, $foma) = @_;

    $foma =~ s/^([^\(]+)// or return $self->no_match;
    $self->{model} = $1;
    $self->{model} = 'SH2101V' if $1 eq 'MST_v_SH2101V'; # Huh?

    if ($foma =~ s/^\((.*?)\)//) {
	my @options = split /;/, $1;
	for (@options) {
	    /^c(\d+)$/       and $self->{cache_size} = $1, next;
	    /^ser(\w{15})$/  and $self->{serial_number} = $1, next;
	    /^icc(\w{20})$/  and $self->{card_id} = $1, next;
	    /^(T[CDBJ])$/    and $self->{status} = $1, next;
            /^W(\d+)H(\d+)$/ and $self->{display_bytes} = "$1*$2", next;
	    $self->no_match;
	}
    }
}

sub html_version {
    my $self = shift;

    my @map = @$HTMLVerMap;
    while (my($re, $version) = splice(@map, 0, 2)) {
	return $version if $self->model =~ /$re/;
    }
    return undef;
}

sub cache_size {
    my $self = shift;
    return $self->{cache_size} || $DefaultCacheSize;
}

sub series {
    my $self = shift;
    my $model = $self->model;

    if ($self->is_foma && $model =~ /(?:\d{4}|\w\d{2}\w\d?)/) {
        return 'FOMA';
    }

    $model =~ /(\d{3}i)/;
    return $1;
}

sub vendor {
    my $self = shift;
    my $model = $self->model;
    $model =~ /^([A-Z]+)\d/;
    return $1;
}

sub _make_display {
    my $self = shift;
    my $display = $DisplayMap->{uc($self->model)};
    if ($self->{display_bytes}) {
	my($w, $h) = split /\*/, $self->{display_bytes};
	$display->{width_bytes}  = $w;
	$display->{height_bytes} = $h;
    }
    return HTTP::MobileAgent::Display->new(%$display);
}

sub is_gps {
    my $self = shift;
    return $self->gps_compliant;
}

sub gps_compliant {
    my $self = shift;
    return $self->model =~ qr/$GPSModelsRe/;
}

sub user_id {
    my $self = shift;
    return $self->get_header( 'x-dcmguid' );
}

sub browser_version {
    my $self = shift;
    return $self->is_foma && $self->cache_size >= 500 ? '2.0' : '1.0';
}

1;
__END__

=head1 NAME

HTTP::MobileAgent::DoCoMo - NTT DoCoMo implementation

=head1 SYNOPSIS

  use HTTP::MobileAgent;

  local $ENV{HTTP_USER_AGENT} = "DoCoMo/1.0/P502i/c10";
  my $agent = HTTP::MobileAgent->new;

  printf "Name: %s\n", $agent->name;       		# "DoCoMo"
  printf "Ver: %s\n", $agent->version; 			# 1.0
  printf "HTML ver: %s\n", $agent->html_version;	# 2.0
  printf "Model: %s\n", $agent->model;			# "P502i"
  printf "Cache: %dk\n", $agent->cache_size;		# 10
  print  "FOMA\n" if $agent->is_foma;			# false
  printf "Vendor: %s\n", $agent->vendor;		# 'P'
  printf "Series: %s\n", $agent->series;		# "502i"

  # only available with <form utn>
  # e.g.) "DoCoMo/1.0/P503i/c10/serNMABH200331";
  printf "Serial: %s\n", $agent->serial_number;		# "NMABH200331"

  # e.g.) "DoCoMo/2.0 N2001(c10;ser0123456789abcde;icc01234567890123456789)";
  printf "Serial: %s\n", $agent->serial_number;		# "0123456789abcde"
  printf "Card ID: %s\n", $agent->card_id;		# "01234567890123456789"

  # e.g.) "DoCoMo/1.0/P502i (Google CHTML Proxy/1.0)"
  printf "Comment: %s\n", $agent->comment;		# "Google CHTML Proxy/1.0

  # e.g.) "DoCoMo/1.0/D505i/c20/TB/W20H10"
  printf "Status: %s\n", $agent->status;                # "TB"

  # only available in eggy/M-stage
  # e.g.) "DoCoMo/1.0/eggy/c300/s32/kPHS-K"
  printf "Bandwidth: %dkbps\n", $agent->bandwidth;	# 32

  # e.g.) "DoCoMo/2.0 SO902i(c100;TB;W30H16)"
  print "XHTML compiant!\n" if $agent->xhtml_compliant;	# true

  # e.g.) "DoCoMo/2.0 P07A(c500;TB;W24H15)"
  printf "Browser ver: %s\n", $agent->browser_version   # 2.0

=head1 DESCRIPTION

HTTP::MobileAgent::DoCoMo is a subclass of HTTP::MobileAgent, which
implements NTT docomo i-mode user agents.

=head1 METHODS

See L<HTTP::MobileAgent/"METHODS"> for common methods. Here are
HTTP::MobileAgent::DoCoMo specific methods.

=over 4

=item version

  $version = $agent->version;

returns DoCoMo version number like "1.0".

=item html_version

  $html_version = $agent->html_version;

returns supported HTML version like '3.0'. retuns undef if unknown.

=item model

  $model = $agent->model;

returns name of the model like 'P502i'.

=item cache_size

  $cache_size = $agent->cache_size;

returns cache size as killobytes unit. returns 5 if unknown.

=item is_foma

  if ($agent->is_foma) { }

retuns whether it's FOMA or not.

=item vendor

  $vendor = $agent->vendor;

returns vender code like 'SO' for Sony. returns undef if unknown.

=item series

  $series = $agent->series;

returns series name like '502i'. returns undef if unknown.

=item serial_number

  $serial_number = $agent->serial_number;

returns hardware unique serial number (15 digit in FOMA, 11 digit
otherwise alphanumeric). Only available with E<lt>form utnE<gt>
attribute. returns undef otherwise.

=item card_id

  $card_id = $agent->card_id;

returns FOMA Card ID (20 digit alphanumeric). Only available in FOMA
with E<lt>form utnE<gt> attribute. returns undef otherwise.

=item comment

  $comment = $agent->comment;

returns comment on user agent string like 'Google Proxy'. returns
undef otherwise.

=item bandwidth

  $bandwidth = $agent->bandwidth;

returns bandwidth like 32 as killobytes unit. Only vailable in eggy,
returns undef otherwise.

=item status

  $status = $agent->status;

returns status like "TB", "TC", "TD" or "TJ", which means:

  TB | Browsers
  TC | Browsers with image off (only Available in HTML 5.0)
  TD | Fetching JAR
  TJ | i-Appli

=item xhtml_compliant

  if ($agent->xhtml_compliant) { }

returns if the agent is XHTML compliant.

=item browser_version

  if ($agent->browser_version > 2.0) { }

returns browser version(1.0 or 2.0).

=back

=head1 AUTHOR

Tatsuhiko Miyagawa E<lt>miyagawa@bulknews.netE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<HTTP::MobileAgent>

http://www.nttdocomo.co.jp/p_s/imode/spec/useragent.html

http://www.nttdocomo.co.jp/p_s/imode/spec/ryouiki.html

http://www.nttdocomo.co.jp/p_s/imode/tag/utn.html

http://www.nttdocomo.co.jp/p_s/mstage/visual/contents/cnt_mpage.html


=cut
