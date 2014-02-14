Dummy::Application.routes.draw do

  subdomain only: 'blog' do
    root to: 'application#blog', as: :blog_root
  end

  subdomain except: 'www' do
    root to: 'application#subdomain', as: :www_root
  end

  ip_address '81.184.116.14' do
    root to: 'application#admin', as: :ip_addr_root
  end

  root to: 'application#index'
end
