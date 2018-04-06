use Mojolicious::Lite;

get '/' => sub {
    my $self = shift;

    ++$self->session->{count};

    $self->render("slash");
};

app->start;

__DATA__

@@ slash.html.ep

% if (1 == session("count")) {
You have visted once.
% } else {
You have visted <%= session("count") %> times.
% }
