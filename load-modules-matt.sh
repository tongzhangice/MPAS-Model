#!/bin/bash

module unload cmake netcdf-hdf5parallel/4.2.0 python
module swap PrgEnv-intel PrgEnv-gnu;
module swap gcc/7.3.0 gcc/6.1.0
module load cmake
module load python
module load cray-netcdf-hdf5parallel
module load boost
module load cray-parallel-netcdf
module list
