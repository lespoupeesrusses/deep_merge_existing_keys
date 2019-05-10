class Hash
  def deep_merge_existing_keys(other_hash)
    dup.deep_merge_existing_keys!(other_hash)
  end

  def deep_merge_existing_keys!(other_hash)
    other_hash.each_pair do |k,v|
      next unless self.keys.include? k
      self[k] = self[k].is_a?(Hash) && v.is_a?(Hash) ? self[k].deep_merge_existing_keys(v) : v
    end
    self
  end
end