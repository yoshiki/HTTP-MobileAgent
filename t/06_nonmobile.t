use strict;
use Test::More tests => 164 * 13;
use HTTP::MobileAgent;

while (<DATA>) {
    chomp;
    $ENV{HTTP_USER_AGENT} = $_;
    my $agent = HTTP::MobileAgent->new;
    isa_ok $agent, 'HTTP::MobileAgent::NonMobile';
    ok ! $agent->is_docomo;
    ok ! $agent->is_j_phone;
    ok ! $agent->is_ezweb;
    ok $agent->is_non_mobile;
    ok $agent->model eq '';
    ok $agent->device_id eq '';
    ok $agent->carrier eq 'N';
    ok $agent->carrier_longname eq 'NonMobile';
    ok $agent->xhtml_compliant;
    is $agent->display, undef;
    is $agent->user_id, undef;
    is $agent->gps_compliant, undef;
}

__END__
Mozilla/2.0 (compatible; Ask Jeeves)
Mozilla/2.0 (compatible; MSIE 3.01; Windows 95)
Mozilla/2.0 (compatible; MSIE 3.02; Windows CE)
Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; 240x320)
Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; 240x320; PPC)
Mozilla/2.0 (compatible; MSIE 3.02; Windows CE; PPC; 240x320)
Mozilla/2.0 (compatible; T-H-U-N-D-E-R-S-T-O-N-E)
Mozilla/3.0 (DreamPassport/3.0)
Mozilla/3.0 (DreamPassport/3.15; SONICTEAM/PSOV2)
Mozilla/3.0 (DreamPassport/3.2)
Mozilla/3.0 (Slurp.so/Goo; slurp@inktomi.com; http://www.inktomi.com/slurp.html)
Mozilla/3.0 (Slurp/si; slurp@inktomi.com; http://www.inktomi.com/slurp.html)
Mozilla/3.0 (Win95; I)
Mozilla/3.0 (Windows 2000; U) Opera 6.05  [ja]
Mozilla/3.0 (aruyo/0.01;http://www.aaacafe.ne.jp/ ;support@aaacafe.ne.jp)
Mozilla/3.0 (compatible)
Mozilla/3.0 (compatible; Indy Library)
Mozilla/3.0 (compatible; NetMind-Minder/4.3.1J)
Mozilla/3.0 (compatible; NetPositive/2.2.1; BeOS)
Mozilla/3.0 (compatible; PerMan Surfer 3.0; Win95)
Mozilla/3.0 (compatible;)
Mozilla/3.01 (compatible;)
Mozilla/3.01 [ja] (Macintosh; I; 68K)
Mozilla/3.01Gold (Macintosh; I; 68K)
Mozilla/3.01Gold (Macintosh; I; 68K; SiteCoach 1.0)
Mozilla/4.0
Mozilla/4.0 (LINKS ARoMATIZED)
Mozilla/4.0 (PDA; SL-A300/1.0,Embedix/Qtopia/1.1.0) NetFront/3.0
Mozilla/4.0 (PDA; Windows CE/0.9.3) NetFront/3.0
Mozilla/4.0 (Windows NT 4.0)
Mozilla/4.0 (compatible
Mozilla/4.0 (compatible; MSIE 4.01; MSN 2.5; Windows 95)
Mozilla/4.0 (compatible; MSIE 4.01; Windows 95)
Mozilla/4.0 (compatible; MSIE 4.01; Windows 98)
Mozilla/4.0 (compatible; MSIE 4.01; Windows NT Windows CE)
Mozilla/4.0 (compatible; MSIE 4.01; Windows NT)
Mozilla/4.0 (compatible; MSIE 4.0; Windows 95)
Mozilla/4.0 (compatible; MSIE 4.5; Mac_PowerPC)
Mozilla/4.0 (compatible; MSIE 5.00; Windows 98)
Mozilla/4.0 (compatible; MSIE 5.01; MSN 2.5; Windows 98)
Mozilla/4.0 (compatible; MSIE 5.01; Windows 95)
Mozilla/4.0 (compatible; MSIE 5.01; Windows 98)
Mozilla/4.0 (compatible; MSIE 5.01; Windows 98; HKBN)
Mozilla/4.0 (compatible; MSIE 5.01; Windows 98; MSIECrawler)
Mozilla/4.0 (compatible; MSIE 5.01; Windows 98; MSOCD; AtHomeJP0109)
Mozilla/4.0 (compatible; MSIE 5.01; Windows 98; Q312461)
Mozilla/4.0 (compatible; MSIE 5.01; Windows 98; YComp 5.0.2.4)
Mozilla/4.0 (compatible; MSIE 5.01; Windows 98; istb 641)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0) LinkChecker 0.1
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0) WebWasher 3.2
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0; DigExt)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0; NetCaptor 7.0.1)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0; T312461)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0; istb 641)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT; Lunascape 0.99c)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT; Norfolk Southern Corp.)
Mozilla/4.0 (compatible; MSIE 5.01; Windows NT; nk-07102k)
Mozilla/4.0 (compatible; MSIE 5.0; AOL 7.0; Windows 98; DigExt)
Mozilla/4.0 (compatible; MSIE 5.0; Linux 2.2.18-0vl4.2 i686) Opera 6.0  [en]
Mozilla/4.0 (compatible; MSIE 5.0; Mac_PowerPC)
Mozilla/4.0 (compatible; MSIE 5.0; Mac_PowerPC; AtHomeJP191)
Mozilla/4.0 (compatible; MSIE 5.0; Mac_PowerPC;)
Mozilla/4.0 (compatible; MSIE 5.0; Win32)
Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.0  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.03  [en]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.03  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.05  [en]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 2000) Opera 6.05  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 95)
Mozilla/4.0 (compatible; MSIE 5.0; Windows 95; DigExt)
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98) Opera 5.12  [es]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98) Opera 6.03  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98) Opera 6.05  [en]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98) Opera 6.05  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)::ELNSB50::0000211003200258031a018f000000000505000b00000000
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; DigExt)
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; DigExt; YComp 5.0.0.0)
Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; Hotbar 3.0)
Mozilla/4.0 (compatible; MSIE 5.0; Windows ME) Opera 6.03  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows ME) Opera 6.05  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows NT 4.0) Opera 6.0  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows NT 4.0) Opera 6.01  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows NT 4.0) Opera 6.03  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows NT 4.0) Opera 6.05  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows NT 5.0)
Mozilla/4.0 (compatible; MSIE 5.0; Windows NT)
Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)
Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt; DTS Agent
Mozilla/4.0 (compatible; MSIE 5.0; Windows XP) Opera 6.01  [de]
Mozilla/4.0 (compatible; MSIE 5.0; Windows XP) Opera 6.03  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows XP) Opera 6.04  [en]
Mozilla/4.0 (compatible; MSIE 5.0; Windows XP) Opera 6.04  [ja]
Mozilla/4.0 (compatible; MSIE 5.0; Windows XP) Opera 6.05  [ja]
Mozilla/4.0 (compatible; MSIE 5.12; Mac_PowerPC)
Mozilla/4.0 (compatible; MSIE 5.14; Mac_PowerPC)
Mozilla/4.0 (compatible; MSIE 5.16; Mac_PowerPC)
Mozilla/4.0 (compatible; MSIE 5.21; Mac_PowerPC)
Mozilla/4.0 (compatible; MSIE 5.22; Mac_PowerPC)
Mozilla/4.0 (compatible; MSIE 5.2; Mac_PowerPC)
Mozilla/4.0 (compatible; MSIE 5.2; Mac_PowerPC) OmniWeb/4.1.1-v424.6
Mozilla/4.0 (compatible; MSIE 5.5; AOL 6.0; Windows 98; Win 9x 4.90)
Mozilla/4.0 (compatible; MSIE 5.5; MSN 2.5; AOL 7.0; Windows 98)
Mozilla/4.0 (compatible; MSIE 5.5; MSN 2.5; Windows 98)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 95)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 95; T312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 95; YComp 5.0.0.0)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 95; ie5.5cd_t-zone_0005)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; DigExt)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; H010818)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; MSIECrawler)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; MSN 6.1; MSNbMSFT; MSNmja-jp; MSNc00)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; MSOCD; AtHomeJP191)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Q312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Q312461; T312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; T312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; T312461; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; T312461; istb 641)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; T312461; istb 641; COM+ 1.0.2204)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; Lunascape 0.98d)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; MSOCD; AtHomeJP0109)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; Q312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; Q312461; T312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; T312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; T312461; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; T312461; Lunascape 0.99c)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; Unithink)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; telus.net_v5.0.1; Hotbar 4.0)
Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; telus.net_v5.0.1)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; H010818)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; H010818; CPT-IE401SP1; T312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; SenseWave 1.0)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; Suncorp Metway Ltd)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; T312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; T312461; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; T312461; Lunascape 0.95a)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0; Yahoo! JAPAN Version Windows 95/NT CD-ROM Edition 1.0.)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; (R1 1.1))
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; (R1 1.1); (R1 1.3))
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; (R1 1.3))
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; AIRF)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; DigExt)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; FORJEIS55SP1)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; H010818)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; Hotbar 3.0; istb 641)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; Hotbar 4.1.7.0)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; Lunascape 0.98c)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; N_o_k_i_a)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; Q312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; Q312461; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; T312461)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; T312461; .NET CLR 1.0.3705)
Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0; T312461; Hewle
