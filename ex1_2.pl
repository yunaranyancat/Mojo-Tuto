use Mojolicious::Lite;

get '/' => sub {
  my $self = shift;

  $self->render("index");


};

app->start;

__DATA__

@@ index.html.ep

<!DOCTYPE html>
<html>
<head>
  <title>Hello World</title>
</head>

<body>
  Hello World<br> <%# Edit here %>
  Carpe diem
</body>
</html>
