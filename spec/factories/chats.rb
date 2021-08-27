FactoryBot.define do
  factory :chat do
    area_id                  {3}
    price_id                 {3}
    sauna_temperature_id     {3}
    water_bath_id            {3}
    sauna_name               {'すみれの湯'}
    description              {'説明'}
  end
end
