let g:test#javascript#runner = 'mocha'
let g:test#typescript#runner = 'mocha'
let g:test#javascript#mocha#executable = './node_modules/.bin/cross-env FRONTENV=test ./node_modules/.bin/mocha --opts tests/mocha.opts'
let g:test#typescript#mocha#executable = './node_modules/.bin/cross-env FRONTENV=test ./node_modules/.bin/mocha --opts tests/mocha.opts'
let g:test#javascript#mocha#file_pattern = 'tests/server/*'
let g:test#typescript#mocha#file_pattern = 'tests/server/*'

function! MochaFrontStrategy(cmd)
    let fileName = split(a:cmd)[5]

    call luaeval("require'robert.plugin.dap'.debugMochaFront([[" . fileName . "]])")
endfunction

let g:test#custom_strategies = {'mochaFront': function('MochaFrontStrategy')}
