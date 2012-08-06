#! /usr/bin/python
import os
import shutil
import glob

HOME_DIR = os.path.expanduser('~')

for file_path in glob.glob('*/*'):
    if not os.path.isfile(file_path):
        continue

    file_name = file_path.split('/')[1]
    home_dotfile_path = '%s/.%s' % (HOME_DIR, file_name)

    # absolute path to the local file
    symlink_target = os.path.join(os.getcwd(), file_path)

    if os.path.exists(home_dotfile_path):
        if os.path.islink(home_dotfile_path):
            if os.path.realpath(home_dotfile_path) == symlink_target:
                # already set, nothing to do here
                continue

        print 'Saving backup for %s.' % home_dotfile_path

        home_dotfile_backup_path = '%s/%s_backup' % (HOME_DIR, file_name)

        # creates the backup
        shutil.copyfile(home_dotfile_path, home_dotfile_backup_path)

        os.remove(home_dotfile_path)

    print 'Creating symlink for %s.' % file_name
    os.symlink(symlink_target, home_dotfile_path)
