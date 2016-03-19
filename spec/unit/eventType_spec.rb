require 'rails_helper'

def create_test_record
  EventType.create(name: "test_name", image_url: "test_image.png")
end

def create_test_record2
  EventType.create(name: "test_name2", image_url: "test_image.png")
end

describe(EventType) do
  it('creates new record') do
    create_test_record
    expect(EventType.all.length).to eq(1)
  end

  it('displays all the records in the file') do
    create_test_record
    create_test_record2
    test_index = EventType.all
    expect(test_index.length).to eq(2)
  end

  it('will delete a record') do
    create_test_record
    expect(EventType.all.length).to eq(1)
    EventType.last.delete
    expect(EventType.all.length).to eq(0)
  end

  it('will not allow a records with duplicate names') do
    create_test_record
    create_test_record
    expect(EventType.all.length).to eq(1)
  end

  it('will not allow a record to be created without name') do
    EventType.create(name: nil, image_url: "test_image.png")
    expect(EventType.all.length).to eq(0)
  end
end
