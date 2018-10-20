import glob
import os
import shutil
import sys

from subprocess import call

def build():
  # Build TF Files
  for tf_file in glob.glob("../src/**/*.tf", recursive=True):
    build_tf_name = "-".join(tf_file.split("/")[2:])
    if "ignore-" not in tf_file:
      shutil.copyfile(tf_file, "../build/" + build_tf_name)

if __name__ == "__main__":
  build()

