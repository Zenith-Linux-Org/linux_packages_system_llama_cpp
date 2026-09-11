project('llama-cpp', 'c',
  version: '0.1.0',
  default_options: ['c_std=c23', 'warning_level=3'])

# ponytail: llama.cpp is built from upstream source during full build
# This stub just installs the boot script
install_data('llama-server.sh', install_dir: get_option('bindir'))
