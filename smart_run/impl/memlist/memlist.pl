/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
#!/usr/bin/perl
use strict;

my $fl_rd_path = "./work/memlist.verdi.log";
my $fl_wr_path = "./impl/memlist/memlist.txt";
open(FL_RD, "<", $fl_rd_path) 
  or die " Failed to touch $fl_rd_path ... Terminated ...";
open(FL_WR, ">", $fl_wr_path) 
  or die " Failed to touch $fl_wr_path ... Terminated ...";

my @a_memlist;
my %h_memlist;
while(my $line = <FL_RD>) {
  $line =~ s/.*, (.*)$/$1/g;
  chomp($line);
  $h_memlist{$line}++;
}

@a_memlist = keys %h_memlist;

foreach my $elem (@a_memlist) {
  print "$elem\n";
  # print "$elem   : $h_memlist{$elem}\n";
  print FL_WR "$elem\n";
}

