#/bin/bash

show_val() { echo "${!1}"; }
#for g in roadUSA; do echo "${!g[1]} ";done
result_dir="/data3/others/gapbs/results_new/"

input_dir="/data/inputs_new/inputs_symlink/"
roadUSA=("${input_dir}/USA-road-d.USA.gr" "${input_dir}/USA-road-d.USA.tgr" "${input_dir}/USA-road-d.USA.sgr" "${input_dir}/USA-road-d.USA.sg")
source_roadUSA=$( cat ${input_dir}/USA-road-d.USA.source )

sk2005=("${input_dir}/sk-2005.gr" "${input_dir}/sk-2005.tgr" "${input_dir}/sk-2005.sgr" "${input_dir}/sk-2005.sg")
source_sk2005=$( cat ${input_dir}/sk-2005.source )

kron=("${input_dir}/kron.gr" "${input_dir}/kron.tgr" "${input_dir}/kron.sgr" "${input_dir}/kron.sg")
source_kron=$( cat ${input_dir}/kron.source )

twitter=("${input_dir}/twitter_rv.gr" "${input_dir}/twitter_rv.tgr" "${input_dir}/twitter_rv.sgr" "${input_dir}/twitter_rv.sg")
source_twitter=$( cat ${input_dir}/twitter_rv.source )

urand=("${input_dir}/urand.gr" "${input_dir}/urand.tgr" "${input_dir}/urand.sgr" "${input_dir}/urand.sg")
source_urand=$( cat ${input_dir}/urand.source )

ext="SG_DRAM"
for r in {1..1}; do ./bfs -n 3 -f ${roadUSA[0]} -r ${source_roadUSA} -a | tee -a ${result_dir}/bfs_USA-road-d.USA_${ext}.log; done
for r in {1..1}; do ./bfs -n 3 -f ${sk2005[0]}  -r ${source_sk2005} -a | tee -a ${result_dir}/bfs_sk-2005_${ext}.log; done
for r in {1..1}; do ./bfs -n 3 -f ${kron[0]}  -r ${source_kron} -a | tee -a ${result_dir}/bfs_kron_${ext}.log; done
for r in {1..1}; do ./bfs -n 3 -f ${twitter[0]} -r ${source_twitter} -a | tee -a ${result_dir}/bfs_twitter_rv_${ext}.log; done
for r in {1..1}; do ./bfs -n 3 -f ${urand[0]} -r ${source_urand} -a | tee -a ${result_dir}/bfs_urand.log_${ext}; done

for r in {1..1}; do ./sssp -n 3 -f ${roadUSA[0]} -r ${source_roadUSA} -a -d 32768| tee -a ${result_dir}/sssp_USA-road-d.USA_${ext}.log; done
for r in {1..1}; do ./sssp -n 3 -f ${sk2005[0]}  -r ${source_sk2005} -a -d 1| tee -a ${result_dir}/sssp_sk-2005_${ext}.log; done
for r in {1..1}; do ./sssp -n 3 -f ${kron[0]} -p ${kron[1]} -r ${source_kron} -a -d 1| tee -a ${result_dir}/sssp_kron_${ext}.log; done
for r in {1..1}; do ./sssp -n 3 -f ${twitter[0]}  -r ${source_twitter} -a -d 1| tee -a ${result_dir}/sssp_twitter_rv_${ext}.log; done
for r in {1..1}; do ./sssp -n 3 -f ${urand[0]} -r ${source_urand} -a -d 1| tee -a ${result_dir}/sssp_urand_${ext}.log; done


for r in {1..1}; do ./cc -n 3 -f ${roadUSA[2]}  -a | tee -a ${result_dir}/cc_USA-road-d.USA_${ext}.log; done
for r in {1..1}; do ./cc -n 3 -f ${sk2005[2]}  -a | tee -a ${result_dir}/cc_sk-2005_${ext}.log; done
for r in {1..1}; do ./cc -n 3 -f ${kron[2]}  -a | tee -a ${result_dir}/cc_kron_${ext}.log; done
for r in {1..1}; do ./cc -n 3 -f ${twitter[2]}  -a | tee -a ${result_dir}/cc_twitter_rv_${ext}.log; done
for r in {1..1}; do ./cc -n 3 -f ${urand[2]}  -a | tee -a ${result_dir}/cc_urand_${ext}.log; done

for r in {1..1}; do ./cc_sv -n 3 -f ${roadUSA[2]}  -a | tee -a ${result_dir}/cc_sv_USA-road-d.USA_${ext}.log; done
for r in {1..1}; do ./cc_sv -n 3 -f ${sk2005[2]}  -a | tee -a ${result_dir}/cc_sv_sk-2005_${ext}.log; done
for r in {1..1}; do ./cc_sv -n 3 -f ${kron[2]}  -a | tee -a ${result_dir}/cc_sv_kron_${ext}.log; done
for r in {1..1}; do ./cc_sv -n 3 -f ${twitter[2]}  -a | tee -a ${result_dir}/cc_sv_twitter_rv_${ext}.log; done
for r in {1..1}; do ./cc_sv -n 3 -f ${urand[2]}  -a | tee -a ${result_dir}/cc_sv_urand_${ext}.log; done


for r in {1..1}; do ./pr -n 3 -f ${roadUSA[0]}  -a -t 0.000001 -i 100 | tee -a ${result_dir}/pr_USA-road-d.USA_${ext}.log; done
for r in {1..1}; do ./pr -n 3 -f ${sk2005[0]}  -a -t 0.000001 -i 100 | tee -a ${result_dir}/pr_sk-2005_${ext}.log; done
for r in {1..1}; do ./pr -n 3 -f ${kron[0]}  -a -t 0.000001 -i 100 | tee -a ${result_dir}/pr_kron_${ext}.log; done
for r in {1..1}; do ./pr -n 3 -f ${twitter[0]}  -a -t 0.000001 -i 100 | tee -a ${result_dir}/pr_twitter_rv_${ext}.log; done
for r in {1..1}; do ./pr -n 3 -f ${urand[0]}  -a -t 0.000001 -i 100 | tee -a ${result_dir}/pr_urand_${ext}.log; done


for r in {1..1}; do ./tc -n 3 -f ${roadUSA[3]}  -a | tee -a ${result_dir}/tc_USA-road-d.USA_${ext}.log; done
for r in {1..1}; do ./tc -n 3 -f ${sk2005[3]}  -a | tee -a ${result_dir}/tc_sk-2005_${ext}.log; done
for r in {1..1}; do ./tc -n 3 -f ${kron[3]}  -a | tee -a ${result_dir}/tc_kron_${ext}.log; done
for r in {1..1}; do ./tc -n 3 -f ${twitter[3]}  -a | tee -a ${result_dir}/tc_twitter_rv_${ext}.log; done
for r in {1..1}; do ./tc -n 3 -f ${urand[3]}  -a | tee -a ${result_dir}/tc_urand_${ext}.log; done
