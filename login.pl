use Mojolicious::Lite;
use Mojo::Server::Daemon;

my $port = 3003;
my $daemon = Mojo::Server::Daemon->new(
  app => app,
  listen => ["http://*:$port"]
);


get '/' => "login";

post '/' => sub {
  my $self = shift;
  my $username = $self->param("username");

  unless ($username){
    $self->flash(error => "No name given!");
    $self->redirect_to("/");
    return;
  }

  $self->stash(username => $username);
  $self->render("menu");
};

$daemon->run;
app->start;


__DATA__

@@ login.html.ep

<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>

  <link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">

  <style>
    .login {
    display: inline-block;
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    width: 200px;
    height: 250px;
    margin: auto;
    background-color:  #05f9d8 ;
    border-radius:25px;
    border-style: solid;
  }

    #loginlabel{
    font-family: 'Amatic SC', cursive;
    font-size: 40px;
    font-weight: bold;
    margin-top: 0px;
  }

    #loginfield{
    width:180px;
  }

    #loginbutton{
    width:200px;
    margin-top:20px;
  }

    #errorlogin{
    font-size:20px;
    margin:0;
    padding:0;
    color:red;
  }

  .btn-style{
  height:40px;
	border : solid 2px #ffffff;
	border-radius : 20px;
	font-size : 20px;
	color : #ffffff;
	padding : 0px 20px;
	background-color : black ;
  }
  </style>

<head>

<body>
  <div class="login">
    <form method=post>
      <p id="loginlabel">your name:</p><br>
      % if (flash("error")) {
      <p id="errorlogin"><%= flash("error") %></p><br>
      % }
      <input id="loginfield" type='text' placeholder='Example: Zul' name='username'><br>
      <input class=btn-style id="loginbutton" type='submit' value="Log me in!">
    </form>
  </div>
</body>
</html>

@@ menu.html.ep

You are <%= stash('username') %> !
