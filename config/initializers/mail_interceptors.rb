class DropTestMailsInterceptor
    def self.delivering_email(message)
        message.perform_deliveries = false
    end
end

Rails.application.configure do
    unless Rails.env.production?
        ActionMailer::Base.register_interceptor(DropTestMailsInterceptor)
    end
end
