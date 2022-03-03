gdb show environment


x/60s *((char **)environ)

x/s *((char **)environ)
x/s *((char **)environ + 1)



https://security.stackexchange.com/questions/13194/finding-environment-variables-with-gdb-to-exploit-a-buffer-overflow
https://shankaraman.wordpress.com/2015/06/07/finding-the-environment-variables-on-the-stack/
