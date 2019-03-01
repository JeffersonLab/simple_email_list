#!/usr/bin/env perl
$message_length = `wc -c message.txt`;
if ($message_length == 0) {
    print "warning: empty message, no email sent\n";
    exit 0;
}
open(SUBJ, "subject.txt") or die "error: subject.txt not found";
$subject = <SUBJ>;
chomp $subject;
system "git pull";
open(LIST, "list.txt") or die "error: list.txt not found";
$addressees = '';
while (<LIST>) {
    chomp;
    $addressees .= ' ' . $_;
}
system "mail -s \"$subject\" $addressees < message.txt\n";
system "rm message.txt ; touch message.txt";
exit;
