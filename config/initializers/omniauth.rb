Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['95zHIVCZeQ87VN4i6HCKXnMcf'], ENV['WrltxcfyogOGsaDO4rj1ELUVD7ODGIBeuhflKL5eZZjT7fEfJo']
end
