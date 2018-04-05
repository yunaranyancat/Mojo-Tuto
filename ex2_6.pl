use Mojolicious::Lite;

# Present form
get ’ / ’ => "slash";
post ’ / ’ => sub {
my $self = shift;
# Process
if ("Bender" eq $self->param("name")) {
$self->redirect_to("/bender");
return;
}
# Error
$self->flash(error => "Not bender");
$self->redirect_to("/");
};
get ’ /bender ’ ;

app->start;

__DATA__

@@ slash.html.ep
% if (flash("error")) {
<%= flash("error") %><br>
% }
<form method=post action="/">
Name: <input type=text name=name>
</form>
@@ bender.html.ep
Awesome!
