# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self == []
            return nil
        else
            return self.max - self.min 
        end
    end

    def average
        if self == []
            return nil
        else
            return self.sum/self.length.to_f
        end
    end

    def median
        if self == []
            return nil
        elsif self.length.even?
            return (self.sort[self.length/2] + self.sort[self.length/2 - 1])/2.to_f
        else
            return self.sort[self.length/2]
        end
    end

    def counts 
        h = Hash.new(0)
        self.each do |ele|
            h[ele] += 1
        end
        h
    end
    

    def my_count(val)
        count = 0
        self.each do |ele|
            if ele==val
                count+=1
            end
        end
        count
    end

    def my_index(val)
        self.each_with_index do |ele, i|
            if ele == val
                return i
            end
        end
        nil
    end

    def my_uniq
        uniq = []
        self.each do |ele|
            if !uniq.include?(ele)
                uniq << ele
            end
        end
        uniq
    end

    def my_transpose
        transposed = []
        (0...self.length).each do |i|
            row = []
            (0...self.length).each do |j|
                row << self[j][i]
            end
            transposed << row
        end
        transposed       
    end

end
