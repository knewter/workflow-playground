Ruote.process_definition :name => 'if_example', :revision => '0.1' do
  requestor :task => 'request_business_trip_application_form'
  participant 'ceo', :if => '${f:amount}  > 25_000'
end
