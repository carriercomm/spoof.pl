print("   Old:");
print(`ifconfig en1 | grep ether`);
$oldmac=sprintf(`ifconfig en1 | grep ether`);
do{
if (length($ARGV[$0])==17)
{$mac=$ARGV[$0]."\n";}
elsif (length($ARGV[$0])!=0)
{
    print("   New: ether ".$ARGV[$0]."\n");
    die();
}
else
{
$mac="";
    for($x=0;$x<6;$x++){
        $mlist[$x]=int(rand()*256);
    }
    $mac=(lc(sprintf("%02x:%02x:%02x:%02x:%02x:%02x\n", $mlist[0],$mlist[1],$mlist[2],$mlist[3],$mlist[4],$mlist[5],)));
}

print("Target: ether $mac");
chomp $mac;
print(`sudo ifconfig en1 ether $mac`);
print("   New:");
print(`ifconfig en1 | grep ether`);
$newmac=sprintf(`ifconfig en1 | grep ether`);
if ($oldmac ne $newmac)
{
    print("Changes successful!\n");
}
else{
    print("Change unsuccesful.\n");}
} while ($newmac eq $oldmac && length($ARGV[$0])==0);