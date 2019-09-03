json.extract! @song, :id, :created_at, :updated_at
json.extract! @comment, :text
json.text @comment.text















