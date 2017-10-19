require 'test_helper'

class ItensPedidoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_pedido = itens_pedido(:one)
  end

  test "should get index" do
    get itens_pedido_url
    assert_response :success
  end

  test "should get new" do
    get new_item_pedido_url
    assert_response :success
  end

  test "should create item_pedido" do
    assert_difference('ItemPedido.count') do
      post itens_pedido_url, params: { item_pedido: { pedido_id: @item_pedido.pedido_id, produto_id: @item_pedido.produto_id } }
    end

    assert_redirected_to item_pedido_url(ItemPedido.last)
  end

  test "should show item_pedido" do
    get item_pedido_url(@item_pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_pedido_url(@item_pedido)
    assert_response :success
  end

  test "should update item_pedido" do
    patch item_pedido_url(@item_pedido), params: { item_pedido: { pedido_id: @item_pedido.pedido_id, produto_id: @item_pedido.produto_id } }
    assert_redirected_to item_pedido_url(@item_pedido)
  end

  test "should destroy item_pedido" do
    assert_difference('ItemPedido.count', -1) do
      delete item_pedido_url(@item_pedido)
    end

    assert_redirected_to itens_pedido_url
  end
end
