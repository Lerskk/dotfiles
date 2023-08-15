local status, treejs = pcall(require, 'treesj')
if (not status) then return end

treejs.setup {}
