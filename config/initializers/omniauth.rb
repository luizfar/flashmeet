Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, "RFDSuYpr14PkP0LIgz4cow", "QjZQ9go9hIuNqfG7ILzEfT4j8ZPfqbhz2gXL49VXpGk" 
end