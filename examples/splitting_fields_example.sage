# splitting_fields_example
# Be sure to set the number of thread before starting sage
# Singularity> export SAGE_NUM_THREADS=4
# Singularity> sage

print(version())
R.<x>=QQ[]; R
pols = [ R.random_element(degree=5) for _ in range(4) ]

@parallel(p_iter='fork')
def worker(pol):
    # pari.allocatemem(6*1024*1024*1024)
    return pol.splitting_field('w')
    
print(list(worker(pols)))