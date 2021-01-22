import flags
import os

fn main() {
	mut f := flags.new('--')

	f.add_command('hello', fn (options []string) {
		println('world')
	})

	f.add_command('help', fn (options []string) {
		mut msg := ''
		if 'w' in options {
			msg = 'with message'
		}
		println('help $msg')
	})

	f.parse(os.args[1..])
}
