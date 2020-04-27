RSpec.describe DeepMergeExistingKeys do
  it "has a version number" do
    expect(DeepMergeExistingKeys::VERSION).not_to be nil
  end

  it "does its basic job" do
    old_hash = { a: 10, b: 20, c: { c1: 30, c2: { c2a: 40 } } }
    new_hash = { b: 25, c: { c1: 35, c2: { c2b: 55 } }, d: 65 }
    result_hash = old_hash.deep_merge_existing_keys(new_hash)

    expected_result_hash = { a: 10, b: 25, c: { c1: 35, c2: { c2a: 40 } } }
    expect(result_hash).to eq(expected_result_hash)
  end

  it "handles block argument" do
    old_hash = { a: 10, b: 20, c: [ { uid: '123', c1: 30, c2: 40 }, { uid: '456', c1: 50, c2: 60 } ] }
    new_hash = { b: 25, c: [ { uid: '123', c2: 45 }, { uid: '456', c2: 65 } ] }

    result_hash = old_hash.deep_merge_existing_keys(new_hash) { |key, old_v, new_v|
      if old_v.is_a?(Array) && old_v.first&.has_key?("uid")
        old_h = old_v.map { |item| [item['uid'], item] }.to_h
        new_h = new_v.map { |item| [item['uid'], item] }.to_h
        old_h.deep_merge_existing_keys(new_h).values
      else
        new_v
      end
    }
    expected_result_hash = { a: 10, b: 25, c: [ { uid: '123', c1: 30, c2: 45 }, { uid: '456', c1: 50, c2: 65 } ] }

    expect(old_hash.deep_merge_existing_keys(new_hash)).to eq(result_hash)
  end
end
