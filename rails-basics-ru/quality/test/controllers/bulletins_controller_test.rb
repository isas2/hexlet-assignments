# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bulletins_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'should get show' do
    bulletin = bulletins(:bull_1)
    get bulletin_path(bulletin.id)
    assert_response :success
    assert_select 'h1', 'Bulletin 1'
    assert_select 'p', 'Продам сгоревший Xbox 360. Дорого!'
  end
end
