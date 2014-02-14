Dummy::Application.routes.draw do

  subdomain only: 'blog' do
    root to: 'application#blog', as: :blog_root
  end

  subdomain except: 'www' do
    root to: 'application#subdomain', as: :www_root
  end


end
