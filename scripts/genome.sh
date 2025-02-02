export TOKENIZERS_PARALLELISM=true

N=10
ITERS=10
ROOT_DIR="input your root dir here"
MODEL_NAME="input your model name here"

TASKS="mmlupro"
TEST_TASKS='mmlupro'
WEIGHTS='1.0'
COMBINE_METHOD=linear
CROSS_METHOD=linear

SEEDS=(41 42 47 53 3407)

for SEED in "${SEEDS[@]}"; do
    echo "Running GA with seed: $SEED"
    python run_ga.py \
        --tasks $TASKS \
        --test_tasks $TEST_TASKS \
        --task_weights $WEIGHTS \
        --model_path $ROOT_DIR/models/$MODEL_NAME \
        --lora_dir $ROOT_DIR/lora/$MODEL_NAME/lora \
        --population_size $N \
        --combine_method $COMBINE_METHOD \
        --cross_method $CROSS_METHOD \
        --plot_enabled \
        --iters $ITERS \
        --seed $SEED \
        --cross_rate 0 \
        --individual_mutation_rate 0.1 \
        --gene_mutation_rate 0.1 \
        --sigma 0.001 \
        --elite_percent 0.1 \
        --early_stop_iter 5 \
        --ports 9112 36048 22246 13732
    
    echo "Process with seed $SEED completed, wait 10 seconds"
    sleep 10
done