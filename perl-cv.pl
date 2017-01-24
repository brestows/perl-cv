#!/usr/bin/env perl
#===============================================================================
#
#         FILE: cv.pl
#
#        USAGE: ./cv.pl  
#
#  DESCRIPTION: CV
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Sergey Chistyakov
# ORGANIZATION: 
#      VERSION: 31.5
#      CREATED: 12/08/1985 12:20:14 PM
#     REVISION: ---
#===============================================================================
package Main::CV;
use strict;
use warnings;
use utf8;
use JSON::XS;
use Data::Dumper;
my $profile = { 
    'Imię Nazwisko' => 'Sergey Chistyakov',
    'Data urodzenia' => '12.08.1985',
    'E-mail' => 'root@tux.by',
    'Telefon' => '577380684',
    'Miasto' => 'Warszawa',   
};

my $skill = {};

$skill->{RRP} = JOBS::RRB->get_skills();
$skill->{TimeRider} = JOBS::TimeRider->get_skills();
$skill->{EPC} = JOBS::EPC->get_skills();
$skill->{E100} = JOBS::E100::Polska->get_skills();
$skill->{Inny} = {
    'język' => {
        ru => "100%",
        pl => '30%',
        en => '30%',
    },
    'język programowania'=> [qw( Perl Bash C/C++ )],
    'hobby' => {
        'sport' => 'piłka nożna, piłka ręczna',
        'podróż' => 'Malta, Mallorca, Australia,Japan',
        'literatura' => 'William Gibson,Robert Ludlum',
        'filmy' => 'Out of memory :)'
    },
};

my $TODO = {
    'lang' => {
        'en' =>{
            'poziom' => '50-60%',
            'data wykonania' => '07-08.2017',           
        },
    },
    'certyfikacja' => {
        'RHCSA' => '04-05.2017'
    },
};

my $CV = {};

$CV->{Profile} = $profile;
$CV->{Skill} = $skill;
$CV->{Todo} = $TODO;
$CV->{Wynagrodzenie} = JOBS::wynagrodzenie->get_wynagrodzenie();
print Data::Dumper $CV;
1;

package JOBS::RRB;
my $suite = "https://rrb.by";
sub get_skills {
    my $skill =  {
        'okres' => '01.09.2008 - 30.05.2012',
        'technologii i produkty' => [(
               'Windows 2003/2008 Server','Windows XP/7','MDaemon',
               'RAID 1/5/1+0', 'Linux Ubuntu 8.04/10.04','DNS','DHCP'
        )],
        'opis' => "
            -utrzymanie w dobrym stanie parku PC (do 40);
            -narzędzia administracyjne systemu Windows Server 200[3,8];
            -wsparcie techniczne użytkowników;
            -wsparcie dla serwera poczty(MDaemon);
            -Obsługa sieci telefonicznej;
            -zakupu sprzętu;
        ",
    };
    return \$skill;
}
1;
package JOBS::TimeRider;
my $suite = 'https://timerider.by';

sub get_skills {
    my $skill = {
        'okres' => '01.06.2012 - 30.06.2014',
        'technologii i produkty' => [(
               'Postfix','KVM', 'Dovecot', 'Bacula', 'Munin', 'VoIP','Asterisk','LDAP',
               'RAID 1/5/1+0', 'CentOS','DNS','DHCP','MySql','nginx','Apache','LVM','php-fpm'
        )],
        'opis' => "
            -utrzymanie w dobrym stanie parku PC (do 25);
            -narzędzia administracyjne systemu Linux CentOS 6, Debian/Ubuntu;
            -wsparcie techniczne użytkowników;
            -wsparcie dla serwera poczty(Postfix, dovecot, Amawisd, postgrey, ClamAV,SpammAssassin;
            -Obsługa sieci telefonicznej (Asterisk, VoIP, SIP,IAX, Autoprovisioning telefonów);
            -Obsługa sieci LAN/WAN (Dlink DFL-860, openvpn);
            -Obsługa web serwerow (nginx, php-fpm, uwsgi);
            -zakupu sprzętu;\n
        ",
    };
    return \$skill;
}
1;
package JOBS::EPC;
my $suite = 'https://euprocessing.com';

sub get_skills {
    my $skill = {
        'okres' => '01.07.2014 - 30.06.2016',
        'technologii i produkty' => [(
               'Postfix','KVM','Hyper-V (Microsoft 2012R2)', 'Dovecot', 'Bacula', 'Munin', 'VoIP','Asterisk','Zabbix',
               'RAID 1/5/1+0', 'CentOS','DNS','DHCP','MySql','nginx','Apache','LVM', 'ansible',
               'PostgreSql','Bareos','Memcached','LDAP','Squid + rejik','Docker','Azure','Kerberos',
               'OwnCloud', 'OnlyOffice','Bucardo'
        )],
        'opis' => "
            -utrzymanie w dobrym stanie parku Serverow (więcej 60);
            -narzędzia administracyjne systemu Linux CentOS 6;
            -wsparcie dla serwera poczty(Postfix, dovecot, Amawisd, postgrey, ClamAV,SpammAssassin;
            -Obsługa sieci telefonicznej (Asterisk, VoIP, SIP,IAX, Autoprovisioning telefonów);
            -Obsługa web serwerow (nginx, php-fpm, uwsgi);
            -przenoszenie infrastruktury w data centry;
            -zakupu sprzętu;
        ",
    };
    return \$skill;
}
1;

package JOBS::E100::Polska;
my $suite = 'https://e100.eu';

sub get_skills {
    my $skill = {
        'okres' => '01.07.2016 - obecnie',
        'technologii i produkty' => [(
               'Postfix','KVM', 'Dovecot', 'Bacula', 'Munin', 'VoIP','Asterisk','Zabbix',
               'RAID 1/5/1+0', 'CentOS','DNS','DHCP','MySql','nginx','Apache','LVM', 'ansible',
               'PostgreSql','Bareos','Memcached','LDAP','Squid + rejik','Docker','Azure','Kerberos',
               'OwnCloud', 'OnlyOffice','Bucardo','Redis', 'HAProxy','DigitalOcean','Dancer2','JS',
               'corosync','pacemaker','hearbeat','drbd'
        )],
        'opis' => "
            -utrzymanie w dobrym stanie parku Serverow (więcej 60);
            -narzędzia administracyjne systemu Linux CentOS 6/7;
            -wsparcie dla serwera poczty(Postfix, dovecot, Amawisd, postgrey, ClamAV,SpammAssassin;
            -Obsługa sieci telefonicznej (Asterisk, VoIP, SIP,IAX, Autoprovisioning telefonów);
            -Obsługa web serwerow (nginx, php-fpm, uwsgi);
            -zapewnienie odporności web serwerow (HAProxy,pacemaker,corosync,hearbeat);
            -zakupu sprzętu;
        ",
    };
    return \$skill;
}

package JOBS::wynagrodzenie;

sub get_wynagrodzenie {
    return 'od 7000 - 10000 zl. netto';
}

1;

