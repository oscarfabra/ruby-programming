# Own Hash Module

# Hash data structure that uses list-chaining to store values
module Dictionary

  # Initializes a Dictionary with the given number of buckets
  def Dictionary.new num_buckets = 256
    aDictionary = []
    (0...num_buckets).each do |i|
      aDictionary << []
    end
    aDictionary
  end

  # Given a key, generates a number and then converts it to an index
  def Dictionary.hash_key aDictionary, key
    key.hash % aDictionary.length    
  end

  # Given a key, finds the bucket where value would go
  def Dictionary.get_bucket aDictionary, key
    bucket_id = Dictionary.hash_key aDictionary, key
    aDictionary[bucket_id]
  end

  # Returns the index, key, and value of a slot found in a bucket
  def Dictionary.get_slot aDictionary, key, default = nil
    bucket = Dictionary.get_bucket(aDictionary, key)
    # Walks through the elements in bucket looking for the value with given key
    bucket.each_with_index do |kv, i|
      k, v = kv
      if key == k
        return i, k, v
      end
    end
    return -1, key, default
  end

  # Gets the value for the given key
  def Dictionary.get aDictionary, key, default = nil
    i, k, v = Dictionary.get_slot(aDictionary, key, default = default)    
    return v
  end

  # Sets the value to the given key, replacing any existing value
  def Dictionary.set aDictionary, key, value
    bucket = Dictionary.get_bucket(aDictionary, key)
    i, k, v = Dictionary.get_slot(aDictionary, key)
    if i>= 0
      bucket[i] = [key, value]
    else
      bucket.push([key, value])
    end
  end

  # Deletes the value with the given key from the Dictionary
  def Dictionary.delete aDictionary, key
    bucket = Dictionary.get_bucket(aDictionary, key)
    # Looks for the value then deletes it
    (0...bucket.length).each do |i|
      k, v = bucket[i]
      if key == k
        bucket.delete_at(i)        
      end
    end
  end

  # Prints out the Dictionary's content
  def Dictionary.list aDictionary
    aDictionary.each do |bucket|
      if bucket
        bucket.each {|k, v| puts k, v }
      end
    end
  end
end