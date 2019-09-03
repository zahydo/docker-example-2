json.extract! @comment, :id, :user_id, :song_id, :text, :publication_date, :created_at, :updated_at
json.user do
	json.email @comment.user.email
end

