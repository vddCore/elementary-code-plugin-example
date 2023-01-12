project('helloworldplugin', 'vala', 'c')

module_name = 'helloworldplugin'
cp = find_program('cp')

vapi_dir = join_paths(meson.current_source_dir(), 'vapi')
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

libcodecore = meson.get_compiler('c').find_library('codecore', dirs: join_paths(meson.current_source_dir(), 'lib'))

shared_library(
    meson.project_name(),
    'src/helloworldplugin.vala',
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('gtksourceview-3.0'),
        dependency('libpeas-1.0'),
        libcodecore
    ],
    include_directories: include_directories('vapi'),
    vala_args: ['--pkg=codecore'], # https://github.com/mesonbuild/meson/issues/2103
)

custom_target(
    module_name + '.plugin',
    input: join_paths('src', module_name + '.plugin'),
    output: module_name + '.plugin',
    command: [cp, '@INPUT@', join_paths(meson.current_build_dir(), '@OUTPUT@')],
    install: true,
    install_dir: ''
)
