# HexletCode

[![CI](https://github.com/Egor1007-del/rails-project-63/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/Egor1007-del/rails-project-63/actions/workflows/main.yml)
![hexlet-check](https://img.shields.io/badge/hexlet--check-passing-brightgreen)

## Description

A form generator is a DSL that makes it easy to generate forms. This library handles tasks that typically require a lot of boilerplate code, such as error handling. In the Rails world, Simple Form is used for this purpose. Our generator is conceptually similar, but significantly simpler.

## Installation

Install the gem and add to the application's Gemfile by executing:

Gemfile:
```bash

gem 'hexlet_code'

```

```bash

bundle intall

```
If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install hexlet_code
```

## Usage

Our form generator relies on ROPO (Ruby Old Plain Object)—entity objects from which data can be extracted to fill out a form. To generate the entity, we'll use Struct.

Create a User class with name and job fields
User = Struct.new(:name, :job, keyword_init: true)
Create a specific user and fill in the name
user = User.new name: 'rob'

This user is then used to generate an HTML form:

HexletCode.form_for user do |f|
end

# <form action="#" method="post"></form>
The generator can accept various form attributes as a hash:

HexletCode.form_for user, class: 'hexlet-form' do |f|
end

# <form action="#" method="post" class="hexlet-form"></form>

If the url key is passed, it will be used as the address when submitting the form:

HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |f|
end

# <form action="/profile" method="post" class="hexlet-form"></form>


Generating specific fields based on the data of the passed object

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>

## Exaples

# exaples_1
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Save">
# </form>

# exaples_2

HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Wow">
# </form>


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
