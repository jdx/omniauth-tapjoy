require 'spec_helper'

describe OmniAuth::Strategies::Tapjoy do
  subject do
    OmniAuth::Strategies::Tapjoy.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq(:tapjoy)
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://oauth.tapjoy.com')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_path.should eq('/oauth/authorize')
    end
  end
end
