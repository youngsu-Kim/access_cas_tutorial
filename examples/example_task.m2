-- This example is based on https://macaulay2.com/doc/Macaulay2-1.21/share/doc/Macaulay2/Macaulay2Doc/html/_parallel_spprogramming_spwith_spthreads_spand_sptasks.html

allowableThreads = 4
fac = n -> () -> (n)!
f = fac(10^8)

t1 = schedule f
t2 = schedule f
t3 = schedule f
t4 = schedule f
while not isReady t1 do sleep 1
for i in {t1,t2,t3,t4} list i

https://groups.google.com/g/macaulay2/c/OMIeDlI0Ca8
Hi Andrew,

It depends for the built-in functions. To use threads, see this post https://macaulay2.com/doc/Macaulay2-1.21/share/doc/Macaulay2/Macaulay2Doc/html/_parallel_spprogramming_spwith_spthreads_spand_sptasks.html.

For instance, the script below will fire 4 threads for about 30 sec to a minute or two depending on the CPU.
allowableThreads = 4
fac = n -> () -> (n)!
f = fac(10^8)

t1 = schedule f
t2 = schedule f
t3 = schedule f
t4 = schedule f
while not isReady t1 do sleep 1
for i in {t1,t2,t3,t4} list i

-Youngsu 