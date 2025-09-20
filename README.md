# HexletCode

[![CI](https://github.com/Egor1007-del/rails-project-63/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/Egor1007-del/rails-project-63/actions/workflows/main.yml)
![Hexlet Check](https://img.shields.io/badge/hexlet--check-passing-brightgreen)

## 📖 Описание

HexletCode — это генератор форм (DSL), упрощающий создание HTML-форм.  
Он избавляет от шаблонного кода (валидация, ошибки и т. д.).  
В экосистеме Rails схожую задачу решает [Simple Form](https://github.com/heartcombo/simple_form),  
однако HexletCode значительно проще.

---

## 🚀 Установка

Добавьте гем в Gemfile:

```ruby
gem 'hexlet_code'

```

Установите зависимости:

```bush 
bundle install
```

Либо напрямую:

```bush 
gem install hexlet_code
```

## 🛠 Использование

Генератор работает с объектами (например, Struct).

Пример:
```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new name: 'rob'

HexletCode.form_for user do |f|
end
# <form action="#" method="post"></form>
```

Можно указывать атрибуты формы:

```ruby
HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |f|
end
# <form action="/profile" method="post" class="hexlet-form"></form>
```

## 📝 Примеры

### Пример 1

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end
```

Результат:

```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="">
  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet">
  <input type="submit" value="Save">
</form>
```

### Пример 2
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :name
  f.input :job
  f.submit 'Wow'
end
```

Результат:

```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="">
  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet">
  <input type="submit" value="Wow">
</form>
```
## 📜 Лицензия

Проект распространяется под лицензией [MIT](https://opensource.org/licenses/MIT).

## 🤝 Code of Conduct

См. [Code of Conduct](https://github.com/Egor1007-del/rails-project-63/blob/main/CODE_OF_CONDUCT.md).