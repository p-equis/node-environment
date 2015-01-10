dep 'npm install -g without sudo' do
  requires 'change npm prefix'
  requires 'add npm prefix to path'
end

dep 'change npm prefix' do
  met? {
    home_dir = ENV['HOME']
    shell? "npm config get prefix | grep #{home_dir}/npm"
  }
  meet {
    shell "mkdir -p ~/npm && npm config set prefix ~/npm"
  }
end

dep 'add npm prefix to path' do
  home_dir = ENV['HOME']
  npm_bin = "#{home_dir}/npm/bin"  

  met? {
    shell? "cat ~/.bashrc | grep 'export PATH=$PATH:#{npm_bin}'"
  }
  meet {
    log "adding ~/npm/bin to $PATH"
    shell "echo 'export PATH=$PATH:#{npm_bin}' >> ~/.bashrc"
  }
end
