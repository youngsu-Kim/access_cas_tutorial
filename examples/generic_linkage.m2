alias srun-large-memory='srun --account=css101  --partition=large-shared --nodes=1 --ntasks-per-node=1 --cpus-per-task=16 --mem=256G --time=00:30:00 --pty --wait=0 /bin/bash'

# export GC_NPROCS=4 
# export GC_MARKERS=4
export GC_INITIAL_HEAP_SIZE=60G
M2

R = QQ[x_1..x_12]
M = genericMatrix(R,3,4)
I = minors(2,M)
c = codim I
n1 = numgens I
d2 = c*n1

R2 = R[y_1..y_(d2)]
M2 = genericMatrix(R2,c,n1)
J2 = ideal(M2 * (transpose gens I))
elapsedTime I2 = J2:sub(I,R2)
n2 = numgens I2
d3 = c*n2

R3 = R2[z_1..z_(d3)]
M3 = genericMatrix(R3,c,n2)
elapsedTime J3 = ideal(M3 * (transpose gens I2))
I3 = J3:sub(I2,R3)

