#/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#*/
#! /usr/bin/perl


my $path="./regress_result";
my @file_list;
my @result_list;
my $filename;
my $file;
my $i=0;
my $pass=0;
my $fail=0;
my $not_run=0;
my $total=0;

#$header1="  BLOCK           PATTERN              RESULT  \n";
#$header2="------------------------------------------------\n";

# read result of every case
@file_list = `find $path -type f`;
foreach $filename (@file_list){
	my $result=" ";
	my $empty;
	open FILE,"$filename" or die "can't open file";
 	@text=<FILE>;
	if($filename=~/.*\/(.*)\.report/) {
		$empty=$1;
		if($empty=~/\w/){
			$file=$empty;
		}else{
			next;
		}
	}		
 	foreach my $file_line (@text){
    		if ($file_line =~/NOT RUN/){  
     			$result="=>NOT RUN";
			$not_run=$not_run+1;
		}
    		elsif ($file_line =~/TEST PASS/){
     			$result="PASS";
			$pass=$pass+1;
    		}
		elsif ($file_line =~/TEST FAIL/){
     			$result="=>FAIL";
			$fail=$fail+1;
    		}else{
			$result=" ";
		}
  	}


	$line="$i,$file,$result\n";
	push (@result_list,$line);
	$i=$i+1;

}

$total=$not_run+$pass+$fail;

#$filename ="./result";
#open NEW_FILE,">$filename" or die "can't open file";
#print NEW_FILE $header1;
#print NEW_FILE $header2;
#print NEW_FILE @result_list;
#close NEW_FILE;

# write result to regress_report file
$filename ="./regress_report";
open NEW_FILE,">$filename" or die "can't open file";
my $file=NEW_FILE;

my ($Block,$Pattern,$Result);
foreach $data (@result_list){
	($Block,$Pattern,$Result)=split(",",$data);
	select(NEW_FILE);
	$^='STDOUT_TOP';
	$~='STDOUT';
#	$=='STDOUT_TO';
	write;
}
# write format
format STDOUT_TOP=
@>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

 Block      Pattern                   Result
---------------------------------------------
.
format STDOUT=
@<<<<<<<<<@<<<<<<<<<<<<<<<<<<<<<@>>>>>>>>>>>>
$Block    $Pattern      $Result
.

#($not_run1,$pass1,$fail1,$total1)=($not_run,$pass,$fail,$total);
#select(NEW_FILE);
#$^='STDOUT_B';
#$~='STDOUT2';
#write;
#format STDOUT_B=
#@>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#
#	   Regress Result
# NOT RUN      FAIL      PASS      TOTAL
#------------------------------------------
#.
#format STDOUT2=
#@<<<<<<<<<@<<<<<<<<<<<<<<<@>>>>>>>>>>>>
#$not_run1    $pass1     $fail1      $total1 
#.
$header="---------------------------------------------\n";
$header1=" Not run   Pass   Fail   Total\n";
$header2="   $not_run       $pass      $fail      $total\n";

print NEW_FILE $header;
print NEW_FILE $header1;
print NEW_FILE $header2;
#print NEW_FILE @result_list;
#close NEW_FILE;

close NEW_FILE;
