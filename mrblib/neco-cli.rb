def parse(argv)
  options = {}

  commands = []
  optname = nil
  argv.each do |arg|
    if arg[0] == '-'
      # maybe option name
      if arg[1] == '-'
        optname = arg[2..-1]
      else 
        optname = arg[1..-1]
      end
      options[optname] = [] unless options.has_key? optname
    else
      if optname.nil?
        # maybe cmd
        commands.push(arg)
      else
        # maybe option value
        options[optname].push(arg)
      end
    end
  end

  [commands, options]
end

def help
puts <<'EOS'
  usage: neco-cli <subcmd>
         neco-cli get <key> [--open <db options as JSON>]
         neco-cli put <key> <value> [--open <db options as JSON>]

  example: neco-cli set "key1" "value1" --open '{"name": redis, "addr": "127.0.0.1", "port": 6379}'

EOS
end

def __main__(argv)
  parsed = parse(argv[1..-1])
  commands = parsed[0]
  options = parsed[1]

  case commands[0]
  when "version"
    puts "v#{NecoCli::VERSION}"
  when "help"
    help
  when "get"
    NecoCli::Cmd::get commands[1], options['open']
  when "put"
    NecoCli::Cmd::put commands[1], commands[2], options['open']
  else
    help
  end
end
