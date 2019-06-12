#!/bin/bash

# Path to processed data
data_dir=/data/users/deepscale/data/qanet/processed

if [ ! -d ${data_dir} ]; then
    echo "Processed data directory does not exist, please create it first!"
    exit 1
fi

squad_dir=${data_dir}/SQuAD
squad_args="--train_processed_data ${squad_dir}/train-v1.1-processed.pkl \
            --dev_processed_data ${squad_dir}/dev-v1.1-processed.pkl \
            --train_meta_data ${squad_dir}/train-v1.1-meta.pkl \
            --train_eval_data ${squad_dir}/dev-v1.1-meta.pkl \
            --dev_eval_data ${squad_dir}/dev-v1.1-eval.pkl \
            --processed_word_embedding ${squad_dir}/word_emb.pkl \
            --word_dictionary ${squad_dir}/word_dic.pkl \
            --processed_char_embedding ${squad_dir}/char_emb.pkl \
            --char_dictionary ${squad_dir}/char_dic.pkl \
           "
args="--data_processed ${squad_args}"
python main.py $@ ${args}
