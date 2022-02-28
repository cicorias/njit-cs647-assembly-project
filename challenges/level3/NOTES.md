

# Get the bytes that represent path to sh...  make it 8 bytes in little endian.
```
echo -n "/bin//sh" | xxd -e

00000000: 6e69622f 68732f2f               -> parts are in little endian  /bin  //sh
```

