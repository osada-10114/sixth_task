def calcurate_tax_included_price(price, rate)
	price ||= 0
	rate ||= 0
	return (price * (1 + rate)).floor
end

RSpec.describe '税込価格を計算する' do
	context '金額と税率(100分率表記)が存在する場合' do
		it '税込価格が取得できる' do
			expect(calcurate_tax_included_price(100, 0.08)).to eq(108)
		end

		it '1円未満切り捨ての税込価格が取得できる' do
			expect(calcurate_tax_included_price(107, 0.08)).to eq(115)
		end
	end

	context '金額がない場合' do
		it '0円が出力される' do
			expect(calcurate_tax_included_price(nil, 0.08)).to eq(0)
		end
	end

	context '税率がない場合' do
		it '金額そのままの数字が出力される' do
			expect(calcurate_tax_included_price(100, nil)).to eq(100)
		end
	end
end