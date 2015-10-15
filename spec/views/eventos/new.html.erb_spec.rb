require 'spec_helper'

describe "eventos/new" do
  before(:each) do
    assign(:evento, stub_model(Evento,
      :nombre => "MyString",
      :lugar => "MyString",
      :direccion => "MyString",
      :espacio => false,
      :necesidades => "MyText",
      :descripcion => "MyText",
      :web => "MyString",
      :imagen => "MyString"
    ).as_new_record)
  end

  it "renders new evento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", eventos_path, "post" do
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
