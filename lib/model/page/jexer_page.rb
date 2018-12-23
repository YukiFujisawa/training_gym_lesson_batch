require 'page-object'

class JexerPage
  include PageObject

  BASE_URL = 'http://www.jexer.jp/schedule/fitness/'.freeze

  select_list(:shop_select, name: 'shop')
end