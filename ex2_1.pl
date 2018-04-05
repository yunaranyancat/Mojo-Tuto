get '/' => sub {
  my $self = shift;

  $self->render(text => "Hello world");
};
