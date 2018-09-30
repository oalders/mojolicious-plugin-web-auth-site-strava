use strict;
use warnings;

package Mojolicious::Plugin::Web::Auth::Site::Strava;

use Mojo::Base qw/Mojolicious::Plugin::Web::Auth::OAuth2/;

has access_token_url => 'https://www.strava.com/oauth/token';
has authorize_url    => 'https://www.strava.com/oauth/authorize';
has response_type    => 'code';
has scope            => 'public';
has user_info        => 1;
has user_info_url    => 'https://www.strava.com/api/v3/athlete';

sub moniker { 'strava' }

1;
__END__

# ABSTRACT: Strava OAuth Plugin for Mojolicious::Plugin::Web::Auth

=pod

=head1 SYNOPSIS

    my $client_id     = '9999';
    my $client_secret = 'seekrit';

    # Mojolicious
    $self->plugin(
        'Web::Auth',
        module           => 'Strava',
        key              => $client_id,
        secret           => $client_secret,
        scope       => 'view_private,write',
        on_finished => sub {
            my ( $c, $access_token, $access_secret ) = @_;
            ...;
        },
    );

    # Mojolicious::Lite
    plugin 'Web::Auth',
        module      => 'Strava',
        key         => $client_id,
        secret      => $client_secret,
        scope       => 'view_private,write',
        on_finished => sub {
        my ( $c, $access_token, $access_secret ) = @_;
        ...;
        };

=head1 DESCRIPTION

This module adds L<Strava|https://developers.strava.com/docs/authentication/>
support to L<Mojolicious::Plugin::Web::Auth>.

=cut
