module flags


pub type Callback = fn (options []string)

pub struct Flag{
	pub mut:
		commands  map[string]Callback
		options []string
		prefix string
}


fn check_arg(this Flag, arg string) bool{
	for key, callback in this.commands{
		if arg == key{
			callback(this.options)
			return true
		}else { return false}
	}
}


pub fn new(prefix string) Flag{
	c := map[string]Callback{}


	return Flag{
		commands : c
		options : []
		prefix : prefix
	}
}


pub fn (mut this Flag)  add_command(command string, callback Callback){
	this.commands[command] = callback
}


pub fn (mut this Flag) parse(args []string) {
	for arg in args{
		if arg.len <= this.prefix.len{
			if check_arg(this, arg){
				break
			}else{
				panic("Unkown command ${arg}")
			}
		}
		else{
			if arg[0..this.prefix.len] == this.prefix{
				//flag
				this.options << arg[this.prefix.len..]
			}else{
				if check_arg(this, arg){
					break
				}else{
					panic("Unkown command ${arg}")
				}
			}
		}
	}
}
