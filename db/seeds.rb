require 'csv'
require 'pathname'

anonymous = {
  username: 'Anonymous',
  email: nil,
  encrypted_password: nil
}

User.find_or_initialize_by(anonymous).save(validate: false)

fishy_test = CSV.table("#{APP_ROOT}/db/fish_questions.csv", { converters: nil }).map { |row| row.to_h }
fish_deck = Deck.find_or_create_by(title: 'Fish Trivia')
fish_deck_id = fish_deck.id

fishy_test.each do |row|
  card_info = row.merge({deck_id: fish_deck_id})
  Card.find_or_create_by(card_info)
end

canadian_test = CSV.table("#{APP_ROOT}/db/canadian_capitals.csv", { converters: nil }).map { |row| row.to_h }
canadian_deck = Deck.find_or_create_by(title: 'Canadian Province and Territory capitals')
canadian_deck_id = canadian_deck.id

canadian_test.each do |row|
  card_info = row.merge({deck_id: canadian_deck_id})
  Card.find_or_create_by(card_info)
end
