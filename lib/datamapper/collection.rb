module DataMapper
  class Collection
    def batch(size = 100, options = {}, &block)
      start = 0
      options = {
        :offset => start,
        :limit => size
      }.merge(options)
      loop do
        n = all(options).each do |item|
          block.call(item)
        end
        break  if n < size
        start += size
      end
    end
  end
end
