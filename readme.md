### Building instaderp


You can find our application here: http://ma-gangstagram.herokuapp.com/

for the secrets thingy on heroku I was missing

```bin/rake heroku:secrets RAILS_ENV=production```

```rails g resource Post```

* Then error happens
* Implementation
* Error
* Implement controller method
* Error
* Implement ```posts/index.html.erb```
* Implement controller method
* generate form at ```posts/new.html.erb```
* Error
* Implement error messages
* All green


Photos uploading

* Install Paperclip
* Write a spect


```ruby

describe "uploading photos" do

# Rails.root refers to home directory

  it "should display a picture" do
    visit /posts/new
    fill_in 'description', with: "sss"
    attach_file 'Picture', Rails.root.join('spec/images/old-man1.jpg')
    click_button 'create Post'

    expect(page).to have_css 'img.uploaded-pic'
  end
end
```

Will raise ```unable to find file```

so We implement

```ruby

class Post
  # ...
  has_attached_file :picture
end
```

So we need to run a migration for it with paperclip

```rails g paperclip post picture```

Might throw an error, always check for an alternative fix!

```ruby
#Gemfile

gem 'paperclip', github: 'thoughtbot/paperclip'
```

So running again

```rails g paperclip post picture```

Generates the paperclip.

There's a limit size for HTTP requests, so in our code we need to split
big requests, like uploading a picture to several requests. we do that by
specifying it in our view:

```ruby
# app/views/posts/new.html.erb
<% form_for @post, html: { multipart: true }
#...
<%= f.file_field %>
```

And we need to show it!

```ruby
# app/views/posts/index/html.erb
# ...
<%= image_tag post.picture.url %>
```

then we specify the class on the img tag so our capybara.

Our test then passes, but the image will look huge, but thanks to paperclip
We're allowed  to specify dimensions on our model

```ruby
class Post
# ...
has_attached_file. :picture, styles: {  }
end
```
