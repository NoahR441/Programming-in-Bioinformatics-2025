#!/usr/bin/env nextflow

include { STAR_INDEX; STAR_ALIGN } from './process.nf'

//files
	fasta_file = file('Mus_musculus.GRCm38.dna_rm.chr19.fa')
	gtf_file = file('Mus_musculus.GRCm38.88.chr19.gtf')
	control_file_1 = file('control.mate_1.fq.gz')
       control_file_2 = file('control.mate_2.fq.gz')

// workflow
workflow {
    STAR_INDEX(fasta_file, gtf_file)
    STAR_ALIGN(STAR_INDEX.out, control_file_1, control_file_2)
}