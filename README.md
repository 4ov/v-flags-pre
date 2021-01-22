# Flags


## What is this?
A small module to parse command line arguments in vlang

## Usage
```v
import os
import flags


fn main(){
  f := flags.new('') //prefix (like - or --)
  f.add_command('help', fn(options []string){
      println("This is a help message")
  })
  f.parse(os.args[1..])
}

```

## Example
> _Check `main.v`_
