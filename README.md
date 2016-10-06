[![Build Status](https://travis-ci.org/JaSei/Port-Generator.svg?branch=master)](https://travis-ci.org/JaSei/Port-Generator)
# NAME

Port::Generator - pick some unused port

# SYNOPSIS

    my $port_gen = Port::Generator->new();
    $port_gen->

# DESCRIPTION

# METHODS

## new(%attributes)

### %attributes

#### min

minimal range of ports

default _49152_

#### max

maximal range of ports

default _65535_

#### proto

socket protocol

default _tcp_

#### addr

local address

default _localhost_

## port()

try find some unused port from `min`-`max` ports range

each port is check for avialable

# LICENSE

Copyright (C) Avast Software.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Jan Seidl <seidl@avast.com>
