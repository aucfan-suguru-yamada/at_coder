# bit全探索の練習
# N個の整数Aiが与えられます。N個の整数から、0個以上を選び和をとった値は、何通り存在するでしょうか？
# 例：N=3, A=1,3,4
n = 3
a = [1,3,4]
sum = 0
ans = []
# (1 << n)で2**nを表す、ここでは2**3=8をbitとして|i|に渡している
(1 << n).times do |i|
  # 各桁を見るためにjでforを回す
  for j in 0..a.size-1
    # 各桁に1が立っていれば、a[j]を参照してsumに足す。010であれば3を足す。
    # 対象の数　>> 桁位置 & 1or0 == フラグ判定したい数(1or0)
    if i >> j & 1 == 1
      sum += a[j]
    end
  end
  ans << sum unless ans.include?(sum)
  sum = 0
end

p ans
# => [0, 1, 3, 4, 5, 7, 8]
# ビット全探索で、2**n通りを全て出力
# 各数字に対して、各桁に1があるかを判定
# 1があれば、桁位置に応じてa=[1,3,4]を参照して、sumに加える
# そのループのsumがansに無ければ、ansに加える（重複がないかチェック）