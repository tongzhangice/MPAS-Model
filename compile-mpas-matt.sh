export PIO=/global/project/projectdirs/piscees/mpas/TPL/pio1_7_1/pio/install-new

export ALBANY_LINK_LIBS="-L/global/homes/m/mperego/piscees/albany/albany-mpas-build/install/lib -L/global/u2/m/mperego/trilinos/trilinos-build/install/lib -lalbanyLib -lalbanyAdapt -lalbanySTK -lFELIX -lmpasInterface -lalbanySTKRebalance -lalbanyLib -lalbanyAdapt -lalbanySTK -lFELIX -lmpasInterface -lalbanySTKRebalance -lalbanyLib -lalbanyAdapt -lalbanySTK -lFELIX -lmpasInterface -lalbanySTKRebalance -ltrilinoscouplings -lpiro -lrol -lstokhos_muelu -lstokhos_ifpack2 -lstokhos_amesos2 -lstokhos_tpetra -lstokhos_sacado -lstokhos -lrythmos -lmuelu-adapters -lmuelu-interface -lmuelu -llocathyra -llocaepetra -llocalapack -lloca -lnoxepetra -lnoxlapack -lnox -lphalanx -lstk_io_util -lstk_io -lstk_mesh_base -lstk_topology -lstk_util_use_cases -lstk_util_registry -lstk_util_diag -lstk_util_env -lstk_util_parallel -lstk_util_util -lintrepid2 -lteko -lstratimikos -lstratimikosbelos -lstratimikosamesos2 -lstratimikosaztecoo -lstratimikosamesos -lstratimikosml -lstratimikosifpack -lifpack2-adapters -lifpack2 -lanasazitpetra -lModeLaplace -lanasaziepetra -lanasazi -lio_info_lib -lIonit -lIotr -lIohb -lIogn -lIovs -lIopg -lIoexo_fac -lIofx -lIoex -lIoss -lexodus -lamesos2 -lbelosxpetra -lbelostpetra -lbelosepetra -lbelos -lml -lifpack -lzoltan2 -lpamgen_extras -lpamgen -lamesos -lgaleri-xpetra -lgaleri-epetra -laztecoo -lisorropia -loptipack -lxpetra-sup -lxpetra -lthyratpetra -lthyraepetraext -lthyraepetra -lthyracore -lepetraext -ltrilinosss -ltpetraext -ltpetrainout -ltpetra -lkokkostsqr -ltpetraclassiclinalg -ltpetraclassicnodeapi -ltpetraclassic -ltriutils -lglobipack -lshards -lzoltan -lepetra -lminitensor -lsacado -lrtop -lkokkoskernels -lteuchoskokkoscomm -lteuchoskokkoscompat -lteuchosremainder -lteuchosnumerics -lteuchoscomm -lteuchosparameterlist -lteuchosparser -lteuchoscore -lkokkosalgorithms -lkokkoscontainers -lkokkoscore -ltpi -lgtest /usr/common/software/boost/1.63/gnu/ivybridge/lib/libboost_program_options.a /usr/common/software/boost/1.63/gnu/ivybridge/lib/libboost_system.a /opt/cray/pe/netcdf-hdf5parallel/4.4.1.1.3/GNU/5.1/lib/libnetcdf.a /usr/lib64/libdl.a -lpnetcdf -lAtpSigHandler -lAtpSigHCommData -lpthread -lfmpich -lmpichcxx -ldarshan -ldarshan-stubs -lz -lnetcdff_parallel -lgfortran -lm -lnetcdf_parallel -ldl -lgfortran -lm -lz -lhdf5_hl_parallel -lz -ldl -lgfortran -lm -lhdf5_parallel -lz -ldl -lgfortran -lm -lsci_gnu_61_mpi -lsci_gnu_61 -lpthread -lhugetlbfs -lmpichf90_gnu_51 -lrt -lugni -lpthread -lpmi -lmpich_gnu_51 -lrt -lugni -lpthread -lpmi -lpthread -lalpslli -lpthread -lwlm_detect -lalpsutil -lpthread -lrca -lugni -lpthread -lxpmem -ludreg -lgfortran -lquadmath -lpthread -lgfortran -lm -lquadmath -lm -lc"

export MPAS_EXTERNAL_LIBS="$ALBANY_LINK_LIBS -lstdc++"

export CORE=landice

make  gnu-nersc ALBANY=true 

