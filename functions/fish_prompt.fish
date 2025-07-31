function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
    set -l last_status $status

    set -l cyan (set_color cyan)
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l blue (set_color blue)
    set -l green (set_color green)
    set -l normal (set_color normal)

    set -l cwd $blue(pwd | sed "s:^$HOME:~:")

    # Output the prompt, left to right

    # Add a newline before new prompts
    echo -e ''

    # Display [venvname] if in a virtualenv
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b cyan black) '[' (basename "$VIRTUAL_ENV") ']' $normal ' '
    end

    # Print pwd or full path
    echo -n -s $cwd $normal

    # show date and time
    echo -n -s ' at ' $yellow (date "+%a %b %d %I:%M:%S %p") $normal

    # Configure __fish_git_prompt
    set -g __fish_git_prompt_char_stateseparator ' '
    set -g __fish_git_prompt_color 5fdfff
    set -g __fish_git_prompt_color_flags df5f00
    set -g __fish_git_prompt_color_prefix white
    set -g __fish_git_prompt_color_suffix white
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_show_informative_status true
    echo -n -s (__fish_git_prompt)

    set -l prompt_color $green
    if test $last_status -ne 0
        #  set prompt_color $normal
        echo -n -s $red ' [' $last_status '] '
    end

    # Terminate with a nice prompt char
    echo -e ''
    echo -e -n -s $prompt_color '$ ' $normal
end
