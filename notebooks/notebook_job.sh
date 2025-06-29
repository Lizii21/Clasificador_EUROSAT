#!/bin/bash
#SBATCH --job-name="ntb_gpu"                   # Job name
#SBATCH --output=logs/notebook_%j.out          # Output log file (%j will be replaced with the job ID)
#SBATCH --partition=redecia                    # Partition to submit the job to
#SBATCH --nodes=1                              # Number of nodes
#SBATCH --ntasks=1                             # Total number of tasks across all nodes
#SBATCH --cpus-per-task=4                      # Number of CPU cores per task
#SBATCH --mem=64G                              # Total memory per node
#SBATCH --gres=gpu:1                           # Request one GPU or two GPUs
#SBATCH --nodelist=deeplearning04              # Node to run the job on

# Set the GPU to use
export CUDA_VISIBLE_DEVICES=0

# Load necessary modules
module load miniconda3

# Source Conda initialization script
. /home/santiagovasquez/miniconda3/etc/profile.d/conda.sh

# Activate your Conda environment
conda activate test_env

# Start Jupyter Notebook
jupyter-notebook --no-browser --ip=0.0.0.0 --port 8888

conda deactivate