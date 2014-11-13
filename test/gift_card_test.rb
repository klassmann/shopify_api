require 'test_helper'

class GiftCardTest < Test::Unit::TestCase
  def setup
    super
    load_gift_card
  end

  def test_disable
    fake 'gift_cards/1023670/disable.json', :body => load_fixture('gift_card_disabled').encode('utf-8'), :method => :post, :extension => false

    refute @gift_card.disabled_at
    @gift_card.disable
    assert @gift_card.disabled_at
  end

  private
  def load_gift_card
    fake 'gift_cards/1023670', :body => load_fixture('gift_card').encode('utf-8')
    @gift_card = ShopifyAPI::GiftCard.find(1023670)
  end
end
