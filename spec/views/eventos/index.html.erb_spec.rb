require 'spec_helper'

describe "eventos/index" do
  before(:each) do
    assign(:eventos, [
      stub_model(Evento,
        :nombre => "Nombre",
        :lugar => "Lugar",
        :direccion => "Direccion",
        :espacio => false,
        :necesidades => "MyText",
        :descripcion => "MyText",
        :web => "Web",
        :imagen => "Imagen"
      ),
      stub_model(Evento,
        :nombre => "Nombre",
        :lugar => "Lugar",
        :direccion => "Direccion",
        :espacio => false,
        :necesidades => "MyText",
        :descripcion => "MyText",
        :web => "Web",
        :imagen => "Imagen"
      )
    ])
  end

  it "renders a list of eventos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Lugar".to_s, :count => 2
    assert_select "tr>td", :text => "Direccion".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Web".to_s, :count => 2
    assert_select "tr>td", :text => "Imagen".to_s, :count => 2
  end
end
