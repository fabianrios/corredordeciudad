require 'spec_helper'

describe "eventos/edit" do
  before(:each) do
    @evento = assign(:evento, stub_model(Evento,
      :nombre => "MyString",
      :lugar => "MyString",
      :direccion => "MyString",
      :espacio => false,
      :necesidades => "MyText",
      :descripcion => "MyText",
      :web => "MyString",
      :imagen => "MyString"
    ))
  end

  it "renders the edit evento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", evento_path(@evento), "post" do
      assert_select "input#evento_nombre[name=?]", "evento[nombre]"
      assert_select "input#evento_lugar[name=?]", "evento[lugar]"
      assert_select "input#evento_direccion[name=?]", "evento[direccion]"
      assert_select "input#evento_espacio[name=?]", "evento[espacio]"
      assert_select "textarea#evento_necesidades[name=?]", "evento[necesidades]"
      assert_select "textarea#evento_descripcion[name=?]", "evento[descripcion]"
      assert_select "input#evento_web[name=?]", "evento[web]"
      assert_select "input#evento_imagen[name=?]", "evento[imagen]"
    end
  end
end
