## Experimental Setup

original model: alpaca-7b-reproduced \ alpaca2-7b-reproduced \ llama2-7B \ gemma-2B

### config for alpaca2-7b-reproduced \ llaama2-7B \ gemma-2B

```
deepspeed "${DEEPSPEED_ARGS[@]}" \
	--module safe_rlhf.finetune \
	--train_datasets inverse-json::${DATASET} \
	--model_name_or_path "${MODEL_NAME_OR_PATH}" \
	--max_length 2048 \
	--trust_remote_code True \
	--epochs 1 \
	--per_device_train_batch_size 4 \
	--per_device_eval_batch_size 4 \
	--gradient_accumulation_steps 8 \
	--gradient_checkpointing \
	--learning_rate 1e-5 \
	--lr_scheduler_type constant \
	--lr_warmup_ratio 0 \
	--weight_decay 0.0 \
	--seed 42 \
	--output_dir "${OUTPUT_DIR}" \
	--log_type wandb \
	--log_run_name ${LOG_RUN_NAME} \
	--log_project Inverse_Alignment \
	--zero_stage "${ZERO_STAGE}" \
	--offload "${OFFLOAD}" \
	--bf16 True \
	--tf32 True \
	--save_interval 250 \
	--save_16bit
```

### config for alpaca-7b-reproduced 

```
deepspeed "${DEEPSPEED_ARGS[@]}" \
	--module safe_rlhf.finetune \
	--train_datasets inverse-json::${DATASET} \
	--model_name_or_path "${MODEL_NAME_OR_PATH}" \
	--max_length 2048 \
	--trust_remote_code True \
	--epochs 1 \
	--per_device_train_batch_size 4 \
	--per_device_eval_batch_size 4 \
	--gradient_accumulation_steps 8 \
	--gradient_checkpointing \
	--learning_rate 2e-5 \
	--lr_scheduler_type cosine \
	--lr_warmup_ratio 0.03 \
	--weight_decay 0.0 \
	--seed 42 \
	--output_dir "${OUTPUT_DIR}" \
	--log_type wandb \
	--log_run_name alpaca-reproduced-M1 \
	--log_project Inverse_Alignment \
	--zero_stage "${ZERO_STAGE}" \
	--offload "${OFFLOAD}" \
	--bf16 True \
	--tf32 True \
	--save_interval 250 \
	--save_16bit
```