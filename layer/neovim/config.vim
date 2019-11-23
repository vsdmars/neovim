function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elsif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

" tnoremap <Esc> <C-\><C-n>:q!<CR>
tnoremap <Esc> <C-\><C-n>
