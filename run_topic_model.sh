if [ -z "$9" ]; then
  echo "usage: $0 [min_n_topics] [max_n_topics] [beta] [n_iter] [save_step] [corpus_file] [vocab_file] [output_dir] [log_dir]"
  exit 1
else
  min_n_topics=$1
  max_n_topics=$2
  beta=$3
  n_iter=$4
  save_step=$5
  corpus_file=$6
  vocab_file=$7
  output_dir=$8
  log_dir=$9
fi

num_vocab=`cat $vocab_file | wc -l`

if [ ! -d $output_dir ];then
  mkdir $output_dir
fi

if [ ! -d $log_dir ];then
  mkdir $log_dir
fi

for ((k=min_n_topics; k<=max_n_topics; k++)); do
  alpha=`python -c "print((round(50/int($k))))"`
  nohup ./topic_model/btm est $k $num_vocab $alpha $beta $n_iter $save_step $corpus_file $output_dir > "$log_dir/btm-$k.out" &
  echo "background running for BTM in topic-$k ..."
done