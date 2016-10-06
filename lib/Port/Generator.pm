package Port::Generator ;
use strict;
use warnings;

our $VERSION = '0.1.2';

use IO::Socket::INET;
use Class::Tiny {
    min   => 49152,
    max   => 65535,
    proto => 'tcp',
    addr  => 'localhost',
};

=head1 NAME

Port::Generator - pick some unused port

=head1 SYNOPSIS

    my $port_gen = Port::Generator->new();
    $port_gen->port();

=head1 DESCRIPTION

=head1 METHODS

=head2 new(%attributes)

=head3 %attributes

=head4 min

lowest numbered port to consider

default I<49152>

=head4 max

highest numbered port to consider

default I<65535>

=head4 proto

socket protocol

default I<tcp>

=head4 addr

local address

default I<localhost>

=head2 port()

Tries to find an unused port from C<min>-C<max> ports range,
checking each port in turn until it finds an available one.

=cut

sub port {
    my ($self) = @_;

    foreach my $port ($self->min .. $self->max) {
        my $sock = IO::Socket::INET->new(
            LocalAddr => $self->addr,
            LocalPort => $port,
            Proto     => $self->proto,
        );

        if ($sock) {
            close $sock;

            return $port;
        }
    }

    return;
}

=head1 LICENSE

Copyright (C) Avast Software.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Jan Seidl E<lt>seidl@avast.comE<gt>

=cut

1;
