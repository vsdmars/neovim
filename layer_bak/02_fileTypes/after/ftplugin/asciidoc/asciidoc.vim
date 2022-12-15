" Force wrapping.
setlocal textwidth=120
" Enable spell check for this buffer.
setlocal spell

function! AsciidocEnableSyntaxRanges()
  if exists('g:loaded_SyntaxRange')
    for lang in ['c', 'cpp', 'java',
               \ 'python', 'javascript',
               \ 'vim', 'sh',
               \ 'json', 'yaml', 'markdown', 'asciidoc',
               \ 'css', 'html']
      call SyntaxRange#Include(
            \  '\c\[source\s*,\s*' . lang . '\s*\]\s*\n[=-]\{4,\}\n'
            \, '\]\@<!\n[=-]\{4,\}\n'
            \, lang, 'NonText')
    endfor
  endif
endfunction

function! AsciidocFollowLink()
ruby <<EOF
  # See if the line under the cursor contains a proper link.
  current_line = Vim.evaluate('getline(".")')
  /^.*link:(?<path>\S+)\[.*\].*/ =~ current_line

  if path != nil
    # If the current file path is different from the CWD, then relative links
    # will require a CD to the file's path, to resolve, and then back.
    file_path = Vim.evaluate('expand("%:h")')
    need_cd = file_path != '.'
    cwd = Vim.evaluate("getcwd()")

    Vim.command("cd " + file_path) if need_cd
    Vim.command("edit " + Vim.evaluate('expand("' + path + '")'))
    Vim.command("cd " + cwd) if need_cd
  elsif
    Vim.command("echo 'not a link'")
  end
EOF
endfunction

call AsciidocEnableSyntaxRanges()
nmap <silent> <buffer> <CR> :call AsciidocFollowLink()<CR>
