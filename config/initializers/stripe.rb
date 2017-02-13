if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_naLrz5kxbdXipbhr4bitJ7cF',
    :secret_key => 'sk_test_DmySYhZg6J7wOpovtlVpFTxz'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]