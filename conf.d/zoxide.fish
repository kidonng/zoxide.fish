if ! status -i || ! command -sq zoxide
    exit
end

functions -q __zoxide_cd_internal || functions -c cd __zoxide_cd_internal

set -q zoxide_hook || set -l zoxide_hook --on-variable PWD
if test -n "$zoxide_hook"
    function __zoxide_hook $zoxide_hook
        test -z "$fish_private_mode"
        and command zoxide add -- (__zoxide_pwd)
    end
end

set -q zoxide_cmd || set -l zoxide_cmd z
if test -n "$zoxide_cmd"
    function $zoxide_cmd
        __zoxide_z $argv
    end
    complete -c $zoxide_cmd -f -a '(__zoxide_z_complete)'

    function "$zoxide_cmd"i
        __zoxide_zi $argv
    end
end
