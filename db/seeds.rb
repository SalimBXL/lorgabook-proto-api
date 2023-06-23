# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# USERS
    
    # GROUPES
    groupe_operator = Groupe.create!(name: "Operator")
    groupe_manager = Groupe.create!(name: "Manager")
    groupe_admin = Groupe.create!(name: "Admin")
    

    # AUTHORS
    salim = User.create!(
        fullname: "Salim", 
        email: "anthony.joly@hubruxelles.be",
        groupe: groupe_admin
    )
    john = User.create!(
        fullname: "John", 
        email: "john.vannaemen@hubruxelles.be",
        groupe: groupe_admin
    )
    etienne = User.create!(
        fullname: "Etienne", 
        email: "Etienne@hubruxelles.be",
        groupe: groupe_operator
    )
    orian = User.create!(
        fullname: "Orian", 
        email: "orian@hubruxelles.be",
        groupe: groupe_operator
    )



# RESOURCES 
    
    # CATEGORIES
    resource_category_mesuring = ResourceCategory.create!(name: "Mesuring")

    # LOCATIONS
    resource_location_labo1 = ResourceLocation.create!(name: "Labo_1")

    # RESOURCES
    resource_app1 = Resource.create!(
        name: "App_1",
        description: "App number 1",
        resource_category: resource_category_mesuring,
        resource_location: resource_location_labo1,
        reference_person: john
    )
    resource_app2 = Resource.create!(
        name: "App_2",
        description: "App number 2",
        resource_category: resource_category_mesuring,
        resource_location: resource_location_labo1,
        reference_person: john
    )


# ARTICLES

    # ARTICLES CATEGORIES
    article_category_misc = ArticleCategory.create!(name: "Misc")
    article_category_incident = ArticleCategory.create!(name: "Incident")

    # ARTICLE
    article_1 = Article.create!(
        title: "My First Article",
        body: "This is my very first article in this logbook.",
        draft: true,
        batch_number: "FDG_0002_UZ",
        user: salim,
        article_category: article_category_misc,
        resource: resource_app1
    )
    article_2 = Article.create!(
        title: "I had some trouble",
        body: "Well, it did not go very well...",
        draft: true,
        batch_number: "FDG_0003_UZ",
        user: etienne,
        article_category: article_category_incident,
        resource: resource_app2
    )
# COMMENTS

    comment_1 = Comment.create!(
        article: article_1,
        user: salim,
        body: "This is a comment..."
    )