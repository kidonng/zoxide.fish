function __zoxide_z
    set --local argc (count $argv)
    set --query __zoxide_z_prefix || set --local __zoxide_z_prefix 'z!'
    set -l completion_regex '^'(string escape --style=regex $__zoxide_z_prefix)'(.*)$'

    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
        else if set -l result (string match --groups-only --regex $completion_regex $argv[-1])
            __zoxide_cd $result
    else
        set --local result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end
