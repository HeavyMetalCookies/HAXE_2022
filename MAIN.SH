################################################################
HAX_COMPILER_COMMAND_STRING="" #################################
HAX_COMPILER_COMMAND_STRING=$( cat <<HAXE_HEREDOC ##############

        -cp src
        -D analyzer-optimize
        -main Main
        
        --each

        --python bin/main.py

        --next

        --js bin/main.js

        --next

        --cpp bin/main.c
        -D mingw
        -D hl-check

HAXE_HEREDOC
) ### LINE ABOVE CANNOT CONTAIN ANY SPACES ONLY[ HAXE_HEREDOC ]
################################################################
echo "$HAX_COMPILER_COMMAND_STRING" ## keeps newlines    #######
echo  $HAX_COMPILER_COMMAND_STRING  ## discards newlines #######
################################################################

    export MINGW_ROOT=$( echo $( which gcc ) )

    haxe $HAX_COMPILER_COMMAND_STRING

    ./bin/main.c/Main.exe

################################################################


##  #include <hxcpp.h> , where are you my friend ? #############


################################################################
##                                                            ##
##  Compile , but don't run.                                  ##
##  Good if you are getting errors about missing MSVC         ##
##                                                            ##
##          --cpp bin/main.c                                  ##
##          -D no-compilation                                 ##
##                                                            ##
################################################################

## All that work... And it segfaults out of the box....
## https://github.com/HaxeFoundation/hashlink/issues/399
## TRY[ -D hl-check ]ToSeeIf[ VM typing ]BUG