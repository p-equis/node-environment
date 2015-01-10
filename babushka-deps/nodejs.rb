dep 'nodejs.bin' do 
  provides 'node >= 0.10.15'
  requires 'node-ppa'
end

dep 'node-ppa' do 
  met? {
    shell? "ls /etc/apt/sources.list.d | grep nodesource.list"
  }
  meet {
    log "adding nodejs repository..."
    shell "curl -sL https://deb.nodesource.com/setup | sudo bash -"
  }
end
