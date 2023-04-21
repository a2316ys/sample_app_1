require 'benchmark/ips'

STRING_HASH = { 'foo' => 'bar'}
SYMBOL_HASH = { :foo => 'bar'}
NUMBER_HASH = { 100 => 'bar'}
str, sym, num = 'foo', :foo, 100

Benchmark.ips do |x|
    x.config(:time => 5, :warmup => 2)

    #benchmark-ipsは「処理回数（イテレーション回数）/秒」を計測するため、実行回数を指定する必要はない
    x.report("String") {STRING_HASH[str] } 
    x.report("Symbol") {SYMBOL_HASH[sym] } 
    x.report("Number") {NUMBER_HASH[num] } 

    x.compare!
end