# https://github.com/amkdg/Dotfiles

import os

project_directory = os.path.dirname(os.path.abspath(__file__))

dotfiles = os.listdir(f'{project_directory}/Dotfiles')

for dotfile in dotfiles:
    if not os.path.isdir:
        try:
            absolute_dotfile = f'{project_directory}/Dotfiles/{dotfile}'
            dotfile_target_path = f'{os.path.expanduser("~")}/{dotfile}'

            os.symlink(absolute_dotfile, dotfile_target_path)
        except FileExistsError:
            pass
