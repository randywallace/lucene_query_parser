module LuceneQueryParser
  class Transform < Parslet::Transform
    class Entry < Struct.new(:key, :val); end

    rule :group => subtree(:l),
         :required => simple(:r) do
      l
    end

    rule :group => subtree(:l) do
      if l.is_a? Array
        l[0]
      else
        l
      end
    end

    rule :term => simple(:t),
         :required => simple(:r),
         :field => simple(:f) do
      {f.to_sym => t.to_s}
    end

    rule :term => simple(:t),
         :prohibited => simple(:p),
         :field => simple(:f) do
      nil
    end

    rule :term => simple(:t),
         :field => simple(:f) do
      {f.to_sym => t.to_s}
    end

    rule :op => simple(:o) do
      o.to_s
    end

  end
end