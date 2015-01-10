dep 'nodejs.bin' do 
  provides 'node >= 0.10.15'
  requires 'node-ppa'
end

dep 'node-ppa' do 
  requires 'add-apt-repository.bin'
  
  met? {
    shell? "ls /etc/apt/sources.list.d | grep chris-lea"
  }
  meet {
    log "adding chris-lea nodejs PPA"
    sudo "add-apt-repository ppa:chris-lea/node.js"
  }
  after {
    log "running apt-get update"
    sudo "apt-get update"
  }
end

dep 'add-apt-repository.bin' do 
  installs 'python-software-properties'
end
