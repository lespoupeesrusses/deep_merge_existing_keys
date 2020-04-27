class Hash
  def deep_merge_existing_keys(other_hash, &block)
    dup.deep_merge_existing_keys!(other_hash, &block)
  end

  def deep_merge_existing_keys!(other_hash, &block)
    other_hash.each_pair do |k,v|
      next unless self.keys.include? k

      self[k] = if self[k].is_a?(Hash) && v.is_a?(Hash)
                  self[k].deep_merge_existing_keys(v, &block)
                elsif block_given?
                  block.call(k, self[k], v)
                else
                  v
                end
    end
    self
  end
end