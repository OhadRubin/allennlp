local model_name = "bert-base-uncased";
{
  "dataset_reader": {
    "type": "nlvr2",
    "image_dir": "test_fixtures/data/nlvr2",
    "image_loader": "detectron",
    "image_featurizer": "resnet_backbone",
    "region_detector": "faster_rcnn",
    "tokenizer": {
      "type": "pretrained_transformer",
      "model_name": model_name
    },
    "token_indexers": {
      "tokens": {
        "type": "pretrained_transformer",
        "model_name": model_name
      }
    }
  },
  "train_data_path": "test_fixtures/data/nlvr2/tiny-dev.json",
  "validation_data_path": "test_fixtures/data/nlvr2/tiny-dev.json",
  "model": {
    "type": "nlvr2_vilbert",
    "text_embeddings": {
      "vocab_size": 30522,
      "hidden_size": 22,
      "pad_token_id": 0,
      "max_position_embeddings": 50,
      "type_vocab_size": 4,
      "dropout": 0.0
    },
    "image_embeddings": {
      "feature_dim": 2048,
      "hidden_dim": 28
    },
    "encoder": {
      "text_num_hidden_layers": 2,
      "image_num_hidden_layers": 2,
      "text_hidden_size": 22,
      "image_hidden_size": 28,
      "combined_hidden_size": 26,
      "text_intermediate_size": 5,
      "image_intermediate_size": 7,
      "num_attention_heads": 2,
      "text_attention_dropout": 0.0,
      "image_attention_dropout": 0.0,
      "text_hidden_dropout": 0.0,
      "image_hidden_dropout": 0.0,
      "activation": "gelu",
      "v_biattention_id": [0, 1, 2],
      "t_biattention_id": [0, 1, 2],
      "fixed_t_layer": 0,
      "fixed_v_layer": 0
    },
    "pooled_output_dim": 3,
    "fusion_method": "sum"
  },
  "data_loader": {
    "batch_size": 32
  },
  "trainer": {
    "optimizer": {
      "type": "huggingface_adamw",
      "lr": 0.00005
    },
    "validation_metric": "+denotation_acc",
    "num_epochs": 1
  }
}