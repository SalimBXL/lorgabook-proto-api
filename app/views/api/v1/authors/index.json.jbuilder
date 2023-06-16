json.length @authors.length
json.authors do
    @authors.each do |author|
        json.id author.id
        json.fullname author.fullname
        json.email author.email
    end
end