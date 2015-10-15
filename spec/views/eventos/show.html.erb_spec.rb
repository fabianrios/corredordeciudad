require 'spec_helper'

describe "eventos/show" do
  before(:each) do
    @evento = assign(:evento, stub_model(Evento,
      :nombre => "Nombre",
      :lugar => "Lugar",
      :direccion => "Direccion",
      :espacio => false,
      :necesidades => "MyText",
      :descripcion => "MyText",
      :web => "Web",
      :imagen => "Imagen"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/Lugar/)
    rendered.should match(/Direccion/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Web/)
    rendered.should match(/Imagen/)
  end
end
