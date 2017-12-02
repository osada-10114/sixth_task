100.times do |i|
	Post.seed_once(:id) do |post|
		post.user_id = 1
		post.name = "サンプルデータ"
		post.price = i + 1
		post.body = "#{i + 1}回目のこんにちは"
		post.stock = i
	end
end
