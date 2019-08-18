#!/usr/bin/python

import os
import re


def parse_file( line2 ):

	if re.search( 'if', line2 ):

		line3 = re.search('if', line2)

		parse_file( line2[:line3.start()] )
		parse_file( line2[line3.end():] )

	elif re.search( 'else', line2 ):

		line3 = re.search('else', line2)

		parse_file( line2[:line3.start()] )
		parse_file( line2[line3.end():] )
	elif re.search( 'case', line2 ):

		line3 = re.search('case', line2)

		parse_file( line2[:line3.start()] )
		parse_file( line2[line3.end():] )



for root, dirs, files in os.walk('.', topdown=False):
    for name in files:
        file1=os.path.join(root, name)


	file2=open(file1,'r')
	line1=file2.read()
	file2.close()

	parse_file(line1)




