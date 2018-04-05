use Mojolicious::Lite;

get '/:name' => {name => ''} => sub {
  my $c = shift;

  my $name = $c->param("name");

  $c->stash(name => $name);

  $c->render("slash");
};

app->start;

__DATA__

@@ slash.html.ep

% if (stash('name')) {
  You are <%= stash('name') %>
% }else{
  Please pass in a name to the url like so '<%= url_for('/Ben')->to_abs %>'.
% }
