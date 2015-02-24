
use 5.016000;

use ExtUtils::MakeMaker;
$Verbose = 1;
WriteMakefile(
    NAME   => 'kg::Hashtest::hashtestlib',
    SKIP   => [qw(all static static_lib dynamic dynamic_lib)],
    clean  => {'FILES' => 'libhashtestlib$(LIB_EXT)'},
    );
sub MY::top_targets {
'
all :: static
pure_all :: static
static ::       libhashtestlib$(LIB_EXT)
libhashtestlib$(LIB_EXT): $(O_FILES)
		$(AR) cr libhashtestlib$(LIB_EXT) $(O_FILES)
		$(RANLIB) libhashtestlib$(LIB_EXT)
';
}


