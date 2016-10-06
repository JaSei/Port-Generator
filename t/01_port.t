use strict;
use warnings;

use Test::More tests => 5;

use_ok('Port::Generator');

subtest 'port is empty' => sub {
    my $port_gen = Port::Generator->new(); 
    my $port = $port_gen->port();

    my $sock = IO::Socket::INET->new(
        PeerAddr => 'localhost',
        PeerPort => $port,
    );

    ok(!$sock, 'socket is closed');
};

subtest 'first port is used' => sub {
    my $port_gen = Port::Generator->new();

    my $port1 = $port_gen->port();

    my $sock_server = IO::Socket::INET->new(
        LocalAddr => 'localhost',
        LocalPort => $port1,
    );

    ok($sock_server, 'socket on port1 is started');

    my $port2 = $port_gen->port();

    ok($port1 != $port2, 'next call port give other port');
};

subtest 'first port is used' => sub {
    my $port_gen = Port::Generator->new();

    my $port1 = $port_gen->port();

    my $sock_server = IO::Socket::INET->new(
        LocalAddr => 'localhost',
        LocalPort => $port1,
    );

    ok($sock_server, 'socket on port1 is started');

    my $port2 = $port_gen->port();

    ok($port1 != $port2, 'next call port give other port');
};

subtest 'first port is used - udp' => sub {
    my $port_gen = Port::Generator->new(
        proto => 'udp'
    );

    my $port1 = $port_gen->port();

    my $sock_server = IO::Socket::INET->new(
        LocalAddr => 'localhost',
        LocalPort => $port1,
        Proto     => 'udp'
    );

    ok($sock_server, 'socket on port1 is started');

    my $port2 = $port_gen->port();

    ok($port1 != $port2, 'next call port give other port');
};
