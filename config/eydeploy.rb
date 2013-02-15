# This is an overrides file for ey deploy that uses git to do all 
# moving around, rather than using multiple directories and symlinks 
 
class ::EY::Serverside::Deploy::Configuration 
  # no separate releases directories 
  def release_path(*args) 
    current_path 
  end 

  def all_releases(*args) 
    [current_path]
  end 
end 

def copy_repository_cache 
  # Don't need to do this, just make sure current is linked to 
  # cached-copy 
  run "ln -nfs #{c.repository_cache} #{c.current_path}" 
end 

def symlink(*args) 
  # do nothing 
end 

def cleanup_old_releases(*args) 
  # do nothing 
end 