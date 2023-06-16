json.id @article.id
json.title @article.title
json.body @article.body
json.author do
    json.id @article.author.id
    json.fullname @article.author.fullname
end
json.draft @article.draft
json.batch_number @article.batch_number
json.category do 
    json.id @article.article_category.id
    json.name @article.article_category.name
end
json.resource @article do
    json.id @article.resource.id
    json.name @article.resource.name
end
json.comments @comments
json.created_at @article.created_at
json.updated_at @article.updated_at