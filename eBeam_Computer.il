procedure(Modify_Ebeam()

Original_wgate = hiCreateStringField(
?name 'Original_wgate 
?prompt "Original gate" 
?value "" 
?editable t)

Original_core = hiCreateStringField( 
?name 'Original_core 
?prompt "Original core"
?value "" 
?editable t)
 
Original_gap = hiCreateStringField( 
?name 'Original_gap 
?prompt "Original gap" 
?value ""
?editable t) 

New_wgate = hiCreateStringField( 
?name New_wgate 
?prompt "New wgate" 
?value "" 
?editable t) 

New_core = hiCreateStringField( 
?name 'New_core 
?prompt "New core" 
?value "" 
?editable t)

New_gap = hiCreateStringField( 
?name New_gap 
?Prompt "New gap"
?value "" 
?editable t) 

File_Name = hiCreateStringField( 
?name 'FileName 
?prompt "File Name" 
?value "" 
?editable  t)

ebeam_form=hiCreateAppFormA( 
?name 'ebeam_form 
?formTitle "Ebeam Tooling Form" 
?callback "ebeam_computer(
ebeam_form~>Original_wgate~>value 
ebeam_form~>Original_core~>value 
ebeam_form~>Original_gap~>value 
ebeam_form~>New_wgate~>value 
ebeam_form~>New_core~>value 
ebeam_form~>New_gap~>value 
ebearn_form~>File_Name~>value)"
?fields 
list( 
list(Original_wgate 0:0150:30 85) 
list(Original_core 0:30 150:30 85) 
list(Original_gap 0:60 150:30 85) 
list(New_wgate 160:0 160:30 60) 
list(New_core 160:30 160:30 60) 
list(New_gap 160:60 160:30 60) 
list(File_Name 0:90 200:30 85) 
); end of list 
); end of hiCreateAppForm 

hiDisplayForm(ebeam_form) 
); end of procedure Modify_ebeam 


procedure(ebeam computer(a b c d e f g) 
a=cdfParseFloatString(a) 
b=cdfParseFloatString(b)
c=cdfParseFloatString(c)
d=cdfParseFloatString(d)
e=cdfParseFloatString(e)
f=cdfParseFloatString(f)


out = outfile( strcat( "/home/" getShellEnvVar("USER") "/txt/" g "_ebeam.txt" ) ) fprintf(out "%s Generator\n" g) 

fprintf(out "Result			Operation\n")
y1=(e-b)*0.5
y2=d+f
y3=f+y1
fprintf(out "new_21	21 SIZE y:%g\n" y1)
fprintf(out "new_27	27 SIZE y:%g\n" y1)
fprintf(out "25a	21 SIZE y:%g\n" y2)
fprintf(out "25b	21 SIZE y:%g\n" f)
fprintf(out "new_25	25a AND NOT 25b" y1)
close(out)
);EOP ebeam computer
