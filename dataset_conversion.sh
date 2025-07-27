#!/bin/bash

RECORDS_ROOT=/data/records
SPLITS_ROOT=/data/splits
DOWNLOADS_ROOT=/data/downloads

DATASET_NAME=$1

echo "Converting dataset: $DATASET_NAME"
echo "Records root: $RECORDS_ROOT"
echo "Splits root: $SPLITS_ROOT"
echo "Downloads root: $DOWNLOADS_ROOT"
echo "Dataset root: $DOWNLOADS_ROOT/$DATASET_NAME"
echo "Running conversion script..."

uv run python3 -m meta_dataset.dataset_conversion.convert_datasets_to_records \
  --dataset=$DATASET_NAME \
  --dtd_data_root=$DOWNLOADS_ROOT/$DATASET_NAME \
  --splits_root=$SPLITS_ROOT \
  --records_root=$RECORDS_ROOT \
