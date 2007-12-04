package HTTP::MobileAgent::DoCoMoDisplayMap;
# This file is autogenerated by makedocomomap
# in HTTP-MobileAgent distribution

use strict;
require Exporter;
use base qw(Exporter);

use vars qw(@EXPORT_OK $DisplayMap);
@EXPORT_OK = qw($DisplayMap);

BEGIN {
    if ($ENV{DOCOMO_MAP}) {
        eval q{
            require XML::Simple;
            my $xml = XML::Simple->new;
            my $map = $xml->XMLin($ENV{DOCOMO_MAP});
            if ($map->{terminal}) {
                # new layout
                for my $terminal (@{$map->{terminal}}) {
                    my $model = delete $terminal->{model};
                    $DisplayMap->{$model} = $terminal;
                }
            }
            else {
                # old layout
                $DisplayMap = $map;
            }
        };
        warn "using normal hash map: $@" if $@;
    }
}

$DisplayMap ||= {
  'P2101V' => {
    'width' => '163',
    'color' => '1',
    'depth' => '262144',
    'height' => '182'
  },
  'R211I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '4096',
    'height' => '98'
  },
  'SH702IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'F2102V' => {
    'width' => '176',
    'color' => '1',
    'depth' => '65536',
    'height' => '182'
  },
  'D903ITV' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'P209IS' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '87'
  },
  'SO903ITV' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '368'
  },
  'P504I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'F211I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '4096',
    'height' => '113'
  },
  'F704I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SO703I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '368'
  },
  'N251IS' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '140'
  },
  'SH251IS' => {
    'width' => '176',
    'color' => '1',
    'depth' => '65536',
    'height' => '187'
  },
  'SH505I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'ER209I' => {
    'width' => '120',
    'color' => '',
    'depth' => '2',
    'height' => '72'
  },
  'SA800I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '252'
  },
  'F881IES' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '256'
  },
  'P821I' => {
    'width' => '118',
    'color' => '',
    'depth' => '4',
    'height' => '128'
  },
  'D851IWM' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'P900IV' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '266'
  },
  'D251I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '262144',
    'height' => '144'
  },
  'P851I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'F671IS' => {
    'width' => '160',
    'color' => '1',
    'depth' => '65536',
    'height' => '120'
  },
  'N2002' => {
    'width' => '118',
    'color' => '1',
    'depth' => '65536',
    'height' => '128'
  },
  'N211I' => {
    'width' => '118',
    'color' => '1',
    'depth' => '4096',
    'height' => '128'
  },
  'N905I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'D505I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'P505IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '266'
  },
  'P211IS' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '130'
  },
  'L602I' => {
    'width' => '170',
    'color' => '1',
    'depth' => '65536',
    'height' => '189'
  },
  'P209I' => {
    'width' => '96',
    'color' => '',
    'depth' => '4',
    'height' => '87'
  },
  'D502I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '90'
  },
  'D252I' => {
    'width' => '176',
    'color' => '1',
    'depth' => '262144',
    'height' => '198'
  },
  'D800IDS' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SO210I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '256',
    'height' => '113'
  },
  'N901IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'NM502I' => {
    'width' => '111',
    'color' => '',
    'depth' => '2',
    'height' => '106'
  },
  'P213I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'F901IC' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'D703I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'D702IF' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SH902I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'P503I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '256',
    'height' => '130'
  },
  'P211I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '130'
  },
  'N503IS' => {
    'width' => '118',
    'color' => '1',
    'depth' => '4096',
    'height' => '128'
  },
  'N506ISII' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '295'
  },
  'N211IS' => {
    'width' => '118',
    'color' => '1',
    'depth' => '4096',
    'height' => '128'
  },
  'N900IG' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '269'
  },
  'SO213IWR' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '112'
  },
  'D504I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '262144',
    'height' => '144'
  },
  'F883IES' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '256'
  },
  'SH506IC' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'P506ICII' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '266'
  },
  'F702ID' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SH905I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '16777216',
    'height' => '320'
  },
  'SH904I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'P702ID' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'P703I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'SA700IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '252'
  },
  'SO506IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '256'
  },
  'KO209I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '96'
  },
  'F506I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '268'
  },
  'P905I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '350'
  },
  'P252IS' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'F905I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '16777216',
    'height' => '352'
  },
  'L601I' => {
    'width' => '170',
    'color' => '1',
    'depth' => '65536',
    'height' => '189'
  },
  'SO502IWM' => {
    'width' => '120',
    'color' => '1',
    'depth' => '256',
    'height' => '113'
  },
  'N503I' => {
    'width' => '118',
    'color' => '1',
    'depth' => '4096',
    'height' => '128'
  },
  'KO210I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '96'
  },
  'F700IS' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'N700I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'N251I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '140'
  },
  'D506I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'SO213I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '112'
  },
  'D902I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'M702IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '267'
  },
  'D701IWM' => {
    'width' => '230',
    'color' => '1',
    'depth' => '65536',
    'height' => '240'
  },
  'F672I' => {
    'width' => '160',
    'color' => '1',
    'depth' => '65536',
    'height' => '120'
  },
  'D503I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '4096',
    'height' => '126'
  },
  'SH902IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'F502IT' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '91'
  },
  'D901I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'N2701' => {
    'width' => '176',
    'color' => '1',
    'depth' => '65536',
    'height' => '198'
  },
  'P502I' => {
    'width' => '96',
    'color' => '',
    'depth' => '4',
    'height' => '117'
  },
  'N502I' => {
    'width' => '118',
    'color' => '',
    'depth' => '4',
    'height' => '128'
  },
  'SO211I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '4096',
    'height' => '112'
  },
  'N505IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'SO702I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '256'
  },
  'D505IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'P701ID' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'F2051' => {
    'width' => '176',
    'color' => '1',
    'depth' => '65536',
    'height' => '182'
  },
  'P251IS' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'P505I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '266'
  },
  'R209I' => {
    'width' => '96',
    'color' => '',
    'depth' => '4',
    'height' => '72'
  },
  'T2101V' => {
    'width' => '176',
    'color' => '1',
    'depth' => '262144',
    'height' => '144'
  },
  'F903IBSC' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SO506IC' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '256'
  },
  'N252I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '140'
  },
  'N904I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '352'
  },
  'N600I' => {
    'width' => '176',
    'color' => '1',
    'depth' => '65536',
    'height' => '180'
  },
  'N501I' => {
    'width' => '118',
    'color' => '',
    'depth' => '2',
    'height' => '128'
  },
  'N902I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'D903I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'F703I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'F900I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'P252I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'P902IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'F901IS' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'D253IWM' => {
    'width' => '220',
    'color' => '1',
    'depth' => '262144',
    'height' => '144'
  },
  'F661I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '136'
  },
  'D501I' => {
    'width' => '96',
    'color' => '',
    'depth' => '2',
    'height' => '72'
  },
  'P704I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'L704I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '280'
  },
  'SO902I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '256'
  },
  'F505IGPS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '268'
  },
  'NM850IG' => {
    'width' => '176',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'N900IL' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '269'
  },
  'SH704I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'N702IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'P700I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'N701IECO' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'F904I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '352'
  },
  'SO212I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '112'
  },
  'N209I' => {
    'width' => '108',
    'color' => '',
    'depth' => '4',
    'height' => '82'
  },
  'D503IS' => {
    'width' => '132',
    'color' => '1',
    'depth' => '4096',
    'height' => '126'
  },
  'SH505IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'P210I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '91'
  },
  'N506IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '295'
  },
  'F883I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '256'
  },
  'F902IS' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'L600I' => {
    'width' => '170',
    'color' => '1',
    'depth' => '65536',
    'height' => '189'
  },
  'SO504I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '112'
  },
  'P253IS' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'SO213IS' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '112'
  },
  'N504IS' => {
    'width' => '160',
    'color' => '1',
    'depth' => '65536',
    'height' => '180'
  },
  'D251IS' => {
    'width' => '132',
    'color' => '1',
    'depth' => '262144',
    'height' => '144'
  },
  'N900I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '269'
  },
  'D905I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '352'
  },
  'P503IS' => {
    'width' => '120',
    'color' => '1',
    'depth' => '256',
    'height' => '130'
  },
  'SH252I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'P702I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'D701I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '65536',
    'height' => '240'
  },
  'D704I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'N210I' => {
    'width' => '118',
    'color' => '1',
    'depth' => '256',
    'height' => '113'
  },
  'P903I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'N502IT' => {
    'width' => '118',
    'color' => '1',
    'depth' => '256',
    'height' => '128'
  },
  'N703ID' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'P900I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '266'
  },
  'F880IES' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '256'
  },
  'M702IG' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '267'
  },
  'R691I' => {
    'width' => '96',
    'color' => '',
    'depth' => '4',
    'height' => '72'
  },
  'P901I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'F900IT' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'N601I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'D702I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'P902I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'SH821I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '78'
  },
  'F209I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '91'
  },
  'D901IS' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'N505I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'SO903I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '368'
  },
  'N506I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '295'
  },
  'P904I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '350'
  },
  'SH703I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SA702I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '252'
  },
  'F210I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '113'
  },
  'SH900I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'R692I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '4096',
    'height' => '98'
  },
  'F903I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SO502I' => {
    'width' => '120',
    'color' => '',
    'depth' => '4',
    'height' => '120'
  },
  'SO506I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '256'
  },
  'F700I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'F503IS' => {
    'width' => '120',
    'color' => '1',
    'depth' => '4096',
    'height' => '130'
  },
  'F504I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '136'
  },
  'F671I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '256',
    'height' => '126'
  },
  'N902IL' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'N901IC' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'SO505I' => {
    'width' => '256',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'N2001' => {
    'width' => '118',
    'color' => '1',
    'depth' => '4096',
    'height' => '128'
  },
  'SO503I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '113'
  },
  'N704I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'N702ID' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'F504IS' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '136'
  },
  'SH901IC' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'F501I' => {
    'width' => '112',
    'color' => '',
    'depth' => '2',
    'height' => '84'
  },
  'P903IX' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'P901ITV' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'F502I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '91'
  },
  'SO905I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '16777216',
    'height' => '368'
  },
  'SH700IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'F251I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '140'
  },
  'P253I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'SH851I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'D209I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '90'
  },
  'D702IBCL' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SH2101V' => {
    'width' => '800',
    'color' => '1',
    'depth' => '65536',
    'height' => '600'
  },
  'D211I' => {
    'width' => '100',
    'color' => '1',
    'depth' => '4096',
    'height' => '91'
  },
  'D253I' => {
    'width' => '176',
    'color' => '1',
    'depth' => '262144',
    'height' => '198'
  },
  'N701I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'SH901IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'SO505IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '256'
  },
  'N703I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'N903I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'D902IS' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'P2002' => {
    'width' => '118',
    'color' => '1',
    'depth' => '65536',
    'height' => '128'
  },
  'F900IC' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'D2101V' => {
    'width' => '120',
    'color' => '1',
    'depth' => '262144',
    'height' => '130'
  },
  'P504IS' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '144'
  },
  'SH700I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '252'
  },
  'N900IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '269'
  },
  'P651PS' => {
    'width' => '96',
    'color' => '',
    'depth' => '4',
    'height' => '87'
  },
  'F902I' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SO902IWP+' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '256'
  },
  'D904I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'F503I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '256',
    'height' => '130'
  },
  'P903ITV' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '350'
  },
  'SH902ISL' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'SO704I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '368'
  },
  'P901IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '270'
  },
  'D900I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'SH251I' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '130'
  },
  'N2102V' => {
    'width' => '176',
    'color' => '1',
    'depth' => '65536',
    'height' => '198'
  },
  'P501I' => {
    'width' => '96',
    'color' => '',
    'depth' => '2',
    'height' => '120'
  },
  'N253I' => {
    'width' => '160',
    'color' => '1',
    'depth' => '65536',
    'height' => '180'
  },
  'SO503IS' => {
    'width' => '120',
    'color' => '1',
    'depth' => '65536',
    'height' => '113'
  },
  'P2102V' => {
    'width' => '176',
    'color' => '1',
    'depth' => '262144',
    'height' => '198'
  },
  'F212I' => {
    'width' => '132',
    'color' => '1',
    'depth' => '65536',
    'height' => '136'
  },
  'SH903I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'N902IS' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'SH903ITV' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '320'
  },
  'P506IC' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '266'
  },
  'SH702ID' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'F505I' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '268'
  },
  'F903IX' => {
    'width' => '230',
    'color' => '1',
    'depth' => '262144',
    'height' => '240'
  },
  'N902IX' => {
    'width' => '240',
    'color' => '1',
    'depth' => '262144',
    'height' => '270'
  },
  'N821I' => {
    'width' => '118',
    'color' => '',
    'depth' => '4',
    'height' => '128'
  },
  'N2051' => {
    'width' => '176',
    'color' => '1',
    'depth' => '65536',
    'height' => '198'
  },
  'F882IES' => {
    'width' => '240',
    'color' => '1',
    'depth' => '65536',
    'height' => '256'
  },
  'N504I' => {
    'width' => '160',
    'color' => '1',
    'depth' => '65536',
    'height' => '180'
  },
  'D210I' => {
    'width' => '96',
    'color' => '1',
    'depth' => '256',
    'height' => '91'
  }
}
;

1;
