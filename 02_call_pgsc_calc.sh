#!/bin/bash
#SBATCH --partition=general-compute --qos=general-compute
#SBATCH --time=23:59:00
#SBATCH --nodes=1
#SBATCH --constraint=IB
#SBATCH --mem=64000
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --job-name="BrCa_PGSC_CALC_no_ancestry"
#SBATCH --output=R-%x.%a.out
#SBATCH --error=R-%x.%a.err

module load gcc openmpi java plink/2.00a3.7

cd /projects/rpci/songyao/pnfioric/pgs_calc

nextflow run pgscatalog/pgsc_calc \
    -profile singularity \
    --input /projects/rpci/songyao/pnfioric/pgs_calc/pathways_samplesheet2.csv --target_build GRCh37 \
    --pgs_id  PGS000212,PGS000213,PGS000214,PGS000215,PGS000216 \
#    --run_ancestry /projects/rpci/songyao/pnfioric/pgs_calc/pgsc_HGDP+1kGP_v1.tar.zst \
    --outdir /projects/rpci/songyao/pnfioric/pgs_calc/breast_cancer_pgs/results/ \
#    --n_popcomp 5 \
    -c /projects/rpci/songyao/pnfioric/pgs_calc/default_hpc.config --max_cpus 8 
