#!/usr/bin/python 
# 
# 
# A simple script to output a calendar month based off input from a Web form. 
# 
# 
import cgi,calendar 

print "Content-Type: text/html \n\n" 
print "<title>A month</title>" 
print "<body><pre>" 

form = cgi.FieldStorage() 
month = form.getvalue("month") 

try: 
	calendar.prmonth(2005, int(month),2,3) 
except Exception,e: 
	print "That is not a valid month" 
	
print "</body></pre>"