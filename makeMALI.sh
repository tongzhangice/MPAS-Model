#!/bin/bash

module unload cmake cray-netcdf-hdf5parallel python
module swap PrgEnv-intel PrgEnv-gnu;
module load cmake/3.11.4
module load python
module load cray-netcdf-hdf5parallel
#module load boost
module load cray-tpsl
module load cray-parallel-netcdf
module load netcdf-cxx/4.2
module list

# note this version has no netcdf support 
PIO=/global/homes/m/mperego/pio/pio-build/install
#PIO=/global/project/projectdirs/piscees/mpas/TPL/pio1_7_1/pio/install-new

#source ~/piscees/albany/albany-mpas-build/install/export_albany.in
source /global/homes/m/mperego/albany/albany-build/install/export_albany.in

MPAS_EXTERNAL_LIBS="$ALBANY_LINK_LIBS -lstdc++"

CORE=landice

make clean gnu-nersc ALBANY=false USE_PIO2=true CORE=$CORE PIO=$PIO MPAS_EXTERNAL_LIBS="$MPAS_EXTERNAL_LIBS" DEBUG=true 
#make clean gnu-nersc ALBANY=true USE_PIO2=false CORE=$CORE PIO=$PIO MPAS_EXTERNAL_LIBS="$MPAS_EXTERNAL_LIBS" DEBUG=true 


