#! /usr/bin/python
import os
import shutil

USER_DIR = os.path.expanduser('~')

for dir in os.listdir('.'):
    if not os.path.isdir(dir):
        continue

    # ignoring dot folders (.git)
    if dir[0] == '.':
        continue

    for file in os.listdir(dir):
        # again, ignoring dot files
        if file[0] == '.':
            continue

        file_path = '%s/%s' % (dir, file)  # relative path to the local file
        if not os.path.isfile(file_path):
            continue

        home_dotfile_path = '%s/.%s' % (USER_DIR, file)
        # absolute path to the local file
        symlink_target = os.path.join(os.getcwd(), file_path)

        if os.path.exists(home_dotfile_path):
            if os.path.islink(home_dotfile_path):
                if os.path.realpath(home_dotfile_path) == symlink_target:
                    # already set, nothing to do here
                    continue

            print 'Saving backup for %s.' % home_dotfile_path

            home_dotfile_backup_path = '%s/%s_backup' % (USER_DIR, file)

            # creates the backup
            shutil.copyfile(home_dotfile_path, home_dotfile_backup_path)

            os.remove(home_dotfile_path)

        os.symlink(symlink_target, home_dotfile_path)
