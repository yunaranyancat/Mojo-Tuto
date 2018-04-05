use Mojolicious::Lite;

get '/:name' => {name => 'Default'} => sub {
  my $self = shift;

  my $name = $self->param("name");
  my $age = $self->param("age") // 20;

  $self->render(text => "Hello World: $name and $age years old.");
};

app->start;
