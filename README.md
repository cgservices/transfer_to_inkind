# TransferTo InKind API

A client for TransferTo InKind API communication, docs for the API can be found here https://api.transferto.com/docs.html

## Installation

Add this line to your application's Gemfile:

    gem 'transfer_to_inkind'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transfer_to_inkind

## Usage

    @inkind_client = InkindApi::Client.new(
      endpoint: 'https://api.transferto.com/v1.1',
      api_key: '<YOUR-VERY-SPECIAL-API-KEY>',
      api_secret: '<YOUR-VERY-SECRET-API-SECRET>'
    )

## Integration testing

Create a config.yml in the root directory of the project with the test credentials:

    endpoint: https://api.transferto.com/v1.1
    api_key: <YOUR-VERY-SPECIAL-API-KEY>
    api_secret: <YOUR-VERY-SECRET-API-SECRET>

Remove any recorded VCR cassettes from the ./spec/fixtures directory if necessary and run:

    $ rspec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
