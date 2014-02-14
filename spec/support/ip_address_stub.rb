module IPAddressStub
  def stub_remote_ip(remote_ip)
    ActionDispatch::Request.any_instance.stub(:remote_ip).and_return(remote_ip)
  end
end

Rspec.configure do |c|
  c.include IPAddressStub
end
