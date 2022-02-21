# gcc 32 on x64


```
sudo apt install -y gcc-multilib gcc-5 expect
gcc-5 -m32 -nostdlib -g -z execstack -fno-stack-protector -o helloVuln helloVuln.c

# every boot
sudo sysctl -w kernel.randomize_va_space=0


```