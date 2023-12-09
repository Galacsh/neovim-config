Logger = {}

function Logger.off(msg, opts)
  vim.notify(msg, vim.log.levels.OFF, opts)
end

function Logger.warn(msg, opts)
  vim.notify(msg, vim.log.levels.WARN, opts)
end

function Logger.info(msg, opts)
  vim.notify(msg, vim.log.levels.INFO, opts)
end

function Logger.debug(msg, opts)
  vim.notify(msg, vim.log.levels.DEBUG, opts)
end

function Logger.error(msg, opts)
  vim.notify(msg, vim.log.levels.ERROR, opts)
end

function Logger.trace(msg, opts)
  vim.notify(msg, vim.log.levels.TRACE, opts)
end
