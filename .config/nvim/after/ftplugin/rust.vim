nnoremap <buffer> <leader><CR> <cmd>term cargo run<CR>

nnoremap <C-b> :Compile<CR>

ia pp eprintln!("{:?}",);<Left><Left>
ia pl! println!("{:?}",);<Left><Left>
ia dd #[derive(Debug)]
