import sys
import hashlib

if sys.argv[1]=='1':
	user_file_md5=open('usr.dll','r')
   	user_md5=user_file_md5.readline()
	pwd_file_md5=open('pwd.dll','r')
	pwd_md5=pwd_file_md5.readline()
	h1 = hashlib.new("md5", sys.argv[2])
	h2 = hashlib.new("md5", sys.argv[3])
	if user_md5==h1.hexdigest():
		if pwd_md5==h2.hexdigest():
			sys.exit(1)
	sys.exit(0)
if sys.argv[1]=='0':
	h1 = hashlib.new("md5", sys.argv[2])
	h2 = hashlib.new("md5", sys.argv[3])
	user_file_md5=open('usr.dll','w')
	user_file_md5.write(h1.hexdigest())
	user_file_md5.close()
	pwd_file_md5=open('pwd.dll','w')
	pwd_file_md5.write(h2.hexdigest())
	pwd_file_md5.close()
