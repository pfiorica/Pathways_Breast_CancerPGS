#!/bin/bash
#SBATCH --partition=general-compute --qos=general-compute
#SBATCH --time=12:00:00
#SBATCH --job-name=PGS_calc_Breast_Cancer
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=16000
##SBATCH --requeue
#SBATCH --output=R-%x_%A_%a.out
#SBATCH --error=R-%x_%A_%a.err
#SBATCH --array=1-5

module load gcc openmpi r-bundle-bioconductor

cd $SLURM_SUBMIT_DIR

Rscript UKB.PGS_PNF1.R $SLURM_ARRAY_TASK_ID
