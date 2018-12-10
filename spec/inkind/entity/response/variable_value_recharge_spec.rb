describe InkindApi::Entity::Response::VariableValueRecharge do
  subject { described_class.new(valid_parameters) }

  let(:valid_parameters) { { 'transaction_id' => '225278', 'simulation' => '1', 'status' => '0', 'status_message' => 'Transaction successful', 'date' => '2018-11-26 13:54:32', 'account_number' => '911234567890', 'external_id' => '14248512386098429', 'operator_reference' => '10291928', 'product_id' => '1559', 'product' => 'IDEA Punjab India Bundles', 'product_desc' => 'IDEA Punjab India Bundles', 'product_currency' => 'INR', 'product_value' => 29, 'local_currency' => 'INR', 'local_value' => 29, 'operator_id' => '2241', 'operator' => 'IDEA Punjab India', 'country_id' => '766', 'country' => 'India', 'account_currency' => 'USD', 'wholesale_price' => 1.58, 'retail_price' => 1.58, 'fee' => 0, 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678', 'custom_field_1' => '', 'custom_field_2' => '', 'custom_field_3' => '' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '911234567890', 'custom_field_1' => '', 'custom_field_2' => '', 'custom_field_3' => '' }, 'sender_sms_notification' => 1, 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => 1, 'recipient_sms_text' => 'Recipient message' } }

  describe 'meta_data' do
    context 'with valid parameters' do
      let(:meta_data) { { 'simulation' => '1', 'account_number' => '911234567890', 'external_id' => '14248512386098429', 'transaction_id' => '225278', 'status' => '0', 'status_message' => 'Transaction successful', 'date' => '2018-11-26 13:54:32', 'operator_reference' => '10291928', 'sender_sms_notification' => 1, 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => 1, 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '911234567890' }, 'product' => { 'id' => '1559', 'name' => 'IDEA Punjab India Bundles', 'short_description' => nil, 'currency' => 'INR', 'account_currency' => 'USD', 'type' => 'recharge', 'operator' => { 'id' => '2241', 'name' => 'IDEA Punjab India', 'country' => { 'id' => '766', 'name' => 'India' } }, 'country' => { 'id' => '766', 'name' => 'India' }, 'service' => { 'id' => nil, 'name' => nil }, 'suggested_values' => [] }, 'local_value' => 29 } }

      it 'returns the right meta_data' do
        expect(subject.meta_data).to eq meta_data
      end
    end
  end
end
