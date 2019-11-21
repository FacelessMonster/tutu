require "rails_helper"

describe EconomyCarriage, '#default_values' do
  it 'returns information about of seats' do
    economy_carriage = Carriage.create(type: "EconomyCarriage", train_id: 1)
    expect(economy_carriage.seats).to eq 54
    expect(economy_carriage.seats).not_to eq 36
  end
end

describe ComfortCarriage, '#default_values' do
  it 'returns information about of seats' do
    comfort_carriage = Carriage.create(type: "ComfortCarriage", train_id: 1)
    expect(comfort_carriage.seats).to eq 36
    expect(comfort_carriage.seats).not_to eq 54
  end
end


describe Carriage, '#set_number' do
  it 'returns information about of number' do
    train = Train.create(number: 1112)
  
    first_carriage = Carriage.create(train_id: train.id, type: "ComfortCarriage")

    expect(first_carriage.number).to eq 1
  end
end
