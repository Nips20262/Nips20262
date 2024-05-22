
# eval dataset


# training model
MODEL=''

# log out
OUTPUT_DIR=''

LOG_RUN_NAME=''


file_list=('M1' 'M2' 'M3' 'M1M2' 'M2M1' 'M1M3' 'M3M1' 'M2M3' 'M3M2' 'M1M2M3' 'M1M3M2'  'M2M3M1' 'M2M1M3' 'M3M1M2' 'M3M2M1')


# safe test dataset M1
DATASET=''
for file in "${file_list[@]}"; do
    MODEL='models/setting2/alpaca-reproduced/alpaca-reproduced-'${file}
    LOG_RUN_NAME='alpaca-reproduced-'${file}'-safe-M1-eval'
    OUTPUT_DIR='models/setting2/alpaca-reproduced/all_evaluation'
    bash eval.sh \
        --eval_datasets ${DATASET} \
        --model_name_or_path ${MODEL} \
        --output_dir ${OUTPUT_DIR} \
        --log_run_name ${LOG_RUN_NAME} \

done


# truthful test dataset M2
DATASET='/workspace/inverse_alignment/ablation/setting2/dataset/training/truthful/truthful_test_1k.json'
for file in "${file_list[@]}"; do
    MODEL='models/setting2/alpaca-reproduced/alpaca-reproduced-'${file}
    LOG_RUN_NAME='alpaca-reproduced-'${file}'-truthful-M2-eval'
    OUTPUT_DIR='models/setting2/alpaca-reproduced/all_evaluation'
    bash eval.sh \
        --eval_datasets ${DATASET} \
        --model_name_or_path ${MODEL} \
        --output_dir ${OUTPUT_DIR} \
        --log_run_name ${LOG_RUN_NAME} \

done


# empathy test dataset M3
DATASET='/workspace/inverse_alignment/ablation/setting2/dataset/training/empathy/empathy_test_1k.json'
for file in "${file_list[@]}"; do
    MODEL='models/setting2/alpaca-reproduced/alpaca-reproduced-'${file}
    LOG_RUN_NAME='alpaca-reproduced-'${file}'-empathy-M3-eval'
    OUTPUT_DIR='models/setting2/alpaca-reproduced/all_evaluation'
    bash eval.sh \
        --eval_datasets ${DATASET} \
        --model_name_or_path ${MODEL} \
        --output_dir ${OUTPUT_DIR} \
        --log_run_name ${LOG_RUN_NAME} \

done
