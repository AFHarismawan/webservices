#!"C:\Strawberry\perl\bin\perl.exe"
use DBI;
use JSON;

print "Content-type:application/json; charset=utf-8\r\n\r\n";

my $dbh = DBI->connect("DBI:mysql:database=webservices;host=localhost;port=3306", "root", "");

my $result = $dbh->prepare("SELECT * FROM news LIMIT 5000");
$result->execute();
my $array = $result->fetchall_arrayref();

for (my $i = 0; $i < scalar(@{$array}); $i++) {
    my $a1 = $array->[$i];
    my $temp = "";

    my $j = 0;
    while ($j++ < 2) {
        $temp .= $a1->[2];
        $temp =~ s/Lorem ipsum dolor sit amet/This is real text/g;
    }
    $a1->[2] = $temp;
    $array->[$i] = $a1;
}
print to_json($array);

$dbh->disconnect();