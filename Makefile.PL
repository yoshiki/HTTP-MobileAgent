use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'      => 'HTTP::MobileAgent',
    'VERSION_FROM' => 'lib/HTTP/MobileAgent.pm', # finds $VERSION
    'PREREQ_PM' => {
	'Test::More' => 0.32,
	'HTTP::Headers' => 1.43,
    },
);
