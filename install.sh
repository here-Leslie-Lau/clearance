#! /bin/bash
# define fish_prompt path
FISH_PROMPT_PATH=~/.config/fish/functions/fish_prompt.fish
FISH_PROMPT_PATH_CP=~/.config/fish/functions/fish_prompt_cp

if [ -f "$FISH_PROMPT_PATH" ]; then
    # backup the original fish_prompt.fish
    mv $FISH_PROMPT_PATH $FISH_PROMPT_PATH_CP
else
    echo "the original fish_prompt.fish is not exist"
fi

# cp fish_prompt.fish to FISH_PROMPT_PATH
cp functions/fish_prompt.fish $FISH_PROMPT_PATH
