class ComplexNum
    attr_accessor :real, :imag
    @@state ={
        "+" => 0,
        "*" => 0,
        "bulk_add" => 0,
        "bulk_mul" => 0
    }
    def initialize(real,imag)
        @real =0.0 + real
        @imag =0.0 + imag
    end

    def +(other)
        @@state["+"] += 1
        ComplexNum.new(
            real = @real + other.real,
            imag = @imag + other.imag
        )
        
        
    end

    def *(other)
        @@state["*"] += 1
        ComplexNum.new(
            @real * other.real - @imag * other.imag,
            @real * other.imag + @imag * other.real
        )
        
       
    end

    def self.bulk_add(comps)
        @@state["bulk_add"] += 1
        sum = comps.first;
        comps.drop(1).each do |comp|
            sum = sum+comp
        end
        sum
    end

    def self.bulk_mul(comps)
        @@state["bulk_mul"] += 1
        product = comps.first;
        comps.drop(1).each do |comp|
            product=product*comp
        end
        product
    end

    def self.get_stats
        puts @@state
    end

    def to_s
        return "(#{self.real} + #{self.imaginary}i)"

    end

end

comp1 = ComplexNum.new(3,2)
comp2 = ComplexNum.new(1,7)
comp3 = comp1 + comp2
comp4 = comp1 * comp2

compBulk = ComplexNum.bulk_add([comp1,comp2])
compMul = ComplexNum.bulk_mul([comp1,comp2])
puts comp3
puts comp4
puts compBulk
puts compMul

puts ComplexNum.get_stats()


