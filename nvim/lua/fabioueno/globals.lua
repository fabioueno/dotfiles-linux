local status_ok, job = pcall(require, "plenary.job")
if not status_ok then
  return
end

CMD = function(cmd, args)
  local output

  local p = job:new({
    command = cmd,
    args = args,
    on_exit = function(j, r)
      output = r == 0 and j:result() or {}
      print(vim.inspect(output))
    end
  })

  p:sync()

  return output
end

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)

  return require(name)
end
