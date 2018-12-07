describe InkindApi::Entity::Response::FixedValueVoucher do
  let(:valid_parameters) { { 'transaction_id' => '3623994', 'simulation' => 1, 'status' => '0', 'status_message' => 'Transaction successful', 'date' => '2018-11-26 13:54:32', 'account_number' => '6281234567890', 'external_id' => '14248512386098429', 'operator_reference' => '', 'product_id' => '112', 'product' => 'Gift Card 100GTQ', 'product_desc' => 'Pharmacy 100GTQ Voucher', 'product_currency' => 'GTQ', 'product_value' => 100, 'local_currency' => 'GTQ', 'local_value' => 100, 'operator_id' => '2061', 'operator' => 'Farmacias Cruz Verde Guatemala', 'country_id' => '756', 'country' => 'Guatemala', 'account_currency' => 'USD', 'wholesale_price' => 14.79, 'retail_price' => 17.4, 'fee' => 0, 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678', 'custom_field_1' => '', 'custom_field_2' => '', 'custom_field_3' => '' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '6281234567890', 'custom_field_1' => '', 'custom_field_2' => '', 'custom_field_3' => '' }, 'sender_sms_notification' => 0, 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => 0, 'recipient_sms_text' => 'Recipient message', 'custom_field_1' => '', 'custom_field_2' => '', 'custom_field_3' => '', 'voucher' => { 'info_1' => 'info1', 'currency' => 'IDR', 'pin2' => '1234-1234-1234-1234', 'pin' => '1111-2222-3333-4444', 'info_3' => '', 'value' => '20000', 'expiration_date' => '2015-05-01', 'info_2' => '' } } }
  subject { described_class.new(valid_parameters) }

  describe 'meta_data' do
    context 'with valid parameters' do
      let(:meta_data) {{ 'simulation' => 1, 'account_number' => '6281234567890', 'external_id' => '14248512386098429', 'transaction_id' => '3623994', 'status' => '0', 'status_message' => 'Transaction successful', 'date' => '2018-11-26 13:54:32', 'operator_reference' => '', 'product' => { 'id' => '112', 'name' => 'Gift Card 100GTQ', 'short_description' => nil, 'currency' => 'GTQ', 'account_currency' => 'USD', 'type' => 'voucher', 'operator' => { 'id' => '2061', 'name' => 'Farmacias Cruz Verde Guatemala', 'country' => { 'id' => '756', 'name' => 'Guatemala' } }, 'country' => { 'id' => '756', 'name' => 'Guatemala' }, 'service' => { 'id' => nil, 'name' => nil }, 'value' => 100, 'local_value' => 100, 'local_currency' => 'GTQ', 'wholesale_price' => 14.79, 'retail_price' => 17.4, 'fee' => 0 }, 'sender_sms_notification' => 0, 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => 0, 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '6281234567890' }, 'voucher' => { 'pin2' => '1234-1234-1234-1234', 'pin' => '1111-2222-3333-4444', 'currency' => 'IDR', 'value' => '20000', 'expiration_date' => '2015-05-01', 'info_1' => 'info1', 'info_2' => '', 'info_3' => ''} }}
      it 'returns the right meta_data' do
        expect(subject.meta_data).to eq meta_data
      end
    end
  end
end
