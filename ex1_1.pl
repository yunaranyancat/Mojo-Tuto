use Mojolicious::Lite;

get '/' => {text => 'Mojolicious is awesome!'};

app->start;
