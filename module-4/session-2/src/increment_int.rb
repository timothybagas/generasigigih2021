class IncrementInteger

  def increment(nums)
    val, n = 1, nums.length
    arr = []
    
    for i in (0...n)
      arr.push(0)
      arr[i] += nums[n - 1 - i] + val
      
      val = [0, arr[i] - 9].max
      if(arr[i] >= 10)
        arr[i] -= 10
      end
    end

    arr.push(val) if val > 0
    arr.reverse
  end

end