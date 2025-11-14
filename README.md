# Pathways Breast Cancer PGS

## Introduction & Background

On November 13 2025, Song Yao, Christine Ambrosone, and I received an email from Pathways requesting the breast cancer PGS to be calculated for the Pathways Samples. The PGS below were requested.

-   PGS000004
-   PGS000007
-   PGS000015
-   PGS000332

and **PGP000088** from Zhang et al Nat Genet (2020).

The first four above have already been calculated. I now need to calculate the last one PGS for the Pathways samples.

### PGP000088

More details about the requested PGP000088 can be found [here](https://www.pgscatalog.org/publication/PGP000088/). This is the publication ID for Zhang et al Nat Genet (2020) <https://doi.org/10.1038/s41588-020-0609-2>. Within this paper, they generated 5 PGS, which correspond to the following phenotypes below:

| PGS ID    | Phenotype                                                           |
|-----------|---------------------------------------------------------------------|
| PGS000212 | Breast cancer intrinsic-like subtype (luminal A-like)               |
| PGS000213 | Breast cancer intrinsic-like subtype (luminal B/HER2-negative-like) |
| PGS000214 | Breast cancer intrinsic-like subtype (luminal B-like)               |
| PGS000215 | Breast cancer intrinsic-like subtype (HER2-enriched-like)           |
| PGS000216 | Breast cancer intrinsic-like subtype (triple negative)              |

All of the PGS above appear to use the same 330 SNPs, but they have different weights according to the subtype they were trained to detect.

### Initial Calculation Attempt

As I did in the CVD/CMD Pathways Heart Study paper, I planned to use [PGSC_CALC](https://pgsc-calc.readthedocs.io/en/latest/) to calculate the PGS since I can directly link the PGP ID to the the pipeline. The code to run this is available as `02_call_pgsc_calc.sh`.

When I did this, I ran into some errors. Primarily, PGSC_CALC requires that the genotypes samples be intersected with 1kGP and HGDP first. Then it calculates the PGS using the SNPs from the intersection of these datasets. Because of this, I received an error that reported:

    Score PGS000215_hmPOS_GRCh37 matching failed with match rate 0.669

Since I have existing code to manually calculate the PGS, I decided to just use that code rather than re-read about the entire nextflow pipeline.

## Calculation Process

1.  `03_call_pgs_calc.sh` : Calculates each PGS in parallel using the Pathways .gds files.
2.  `04_merge_PNF.R` : Merges all of the sub-chromosome PGS files for each PGS
3.  `05_merge.valid.nvar_PNF.R` : Merges the files that check the call-rate of the PGS

**Note:** `Breast_Cancer_PRS_for_Shieh.Rmd` includes the code to describe the population structure of Pathways relative to 1kGP and HGDP. It also describes the unnormalized and normalized PGS for these individuals.

For questions about these analyses, please contact Peter Fiorica, peter.fiorica\@roswellpark.org
