---@diagnostic disable: undefined-global
local Job = require "plenary.job"

local M = {}

function M:npm_install()
  local package = vim.fn.input("Npm package > ")

  if string.len(package) == 0 then
    return print("Please choose an package")
  else
    Job:new(
      {
        command = "npm",
        args = {"install", package, "--save"},
        on_exit = function(j, return_val)
          print(vim.inspect(j:result()))
        end
      }
    ):sync()
  end

  -- if package == {} then
  --   return print("teste")
  -- end
end

function M:npm_install_dev()
  local package = vim.fn.input("Npm package > ")

  if string.len(package) == 0 then
    return print("Please choose an package")
  else
    Job:new(
      {
        command = "npm",
        args = {"install", package, "--save-dev"},
        on_exit = function(j, return_val)
          print(vim.inspect(j:result()))
        end
      }
    ):sync()
  end
end

return M
