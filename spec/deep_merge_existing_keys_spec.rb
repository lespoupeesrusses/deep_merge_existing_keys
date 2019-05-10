RSpec.describe DeepMergeExistingKeys do
  it "has a version number" do
    expect(DeepMergeExistingKeys::VERSION).not_to be nil
  end

  it "does its job" do
    old_hash = {
      a: 10,
      b: 20,
      c: {
        c1: 30,
        c2: { c2a: 40 }
      }
    }

    new_hash = {
      b: 25,
      c: {
        c1: 35,
        c2: { c2b: 55 }
      },
      d: 65
    }

    result_hash = {
      a: 10,
      b: 25,
      c: {
        c1: 35,
        c2: {
          c2a: 40
        }
      }
    }

    expect(old_hash.deep_merge_existing_keys(new_hash)).to eq(result_hash)
  end
end
