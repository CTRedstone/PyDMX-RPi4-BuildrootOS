printf "\033[35mCleaning build directory\033[0m\n"
make clean
printf "\033[33mBuilding...\033[0m\n"
make -j4
printf "\033[1m\033[32mBuild done!\033[0m\n"
