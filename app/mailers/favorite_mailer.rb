class FavoriteMailer < ApplicationMailer
    default from: "savemyday15@aol.com"

    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"

        @user = user
        @post = post
        @comment = comment

        mail(to: user.email, subject: "New comment on #{post.title}")
    end

    def new_post(user, post)
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"

        @user = user
        @post = post

        mail(to: user.email, subject: "New favorite on #{post.title}")
    end

end
