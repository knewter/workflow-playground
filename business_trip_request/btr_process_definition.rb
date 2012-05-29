Ruote.process_definition :name => 'business_trip_request', :revision => '0.1' do
  cursor do
    requestor :task => 'request_business_trip_application_form'
    concurrence do
      participant 'ceo', :if => '${f:requested_stipend}  > ${f:amount_supervised}'
      participant 'approver', :task => 'approve_business_trip_application_form'
    end
    rewind :if => '${forms_not_ok}'
    cancel_process  :if => '${trip_request_denied}'
    cursor do
      requestor :task => 'business_trip_report_form'
      reviewer :task => 'review_business_trip_application_form'
      rewind :if => '${incomplete_report}'
      archiver
    end
  end
end
