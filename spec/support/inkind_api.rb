# frozen_string_literal: true

def xml_fixture(file_name)
  File.open(File.dirname(__FILE__) + '/fixtures/' + file_name + '.json', 'rb').read.strip
end

RSpec.configure do |config|
  config.before(:each) do
    # stub_request(:post, CONFIG['endpoint'])
    #   .with(body: xml_fixture('request/get_product_information/valid'))
    #   .to_return(status: 200, body: xml_fixture('response/get_product_information/valid'))
  end
end
