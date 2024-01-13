-- This example is based on https://macaulay2.com/doc/Macaulay2-1.21/share/doc/Macaulay2/Macaulay2Doc/html/_parallel_spprogramming_spwith_spthreads_spand_sptasks.html
-- It computes (10^8)! four time using four threads
-- and it takes somewhere between 20 seconds to 
-- a couple of minutes depending on your process

allowableThreads = 4
fac = n -> () -> (n)!
f = fac(10^8)

t1 = schedule f
t2 = schedule f
t3 = schedule f
t4 = schedule f
while not isReady t1 do sleep 1
for i in {t1,t2,t3,t4} list i

a = taskResult t1 
b = taskResult t2
c = taskResult t3
d = taskResult t4
a == b, b==c, c==d
