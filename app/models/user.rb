class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_taggable
  has_many :eventos, dependent: :destroy
  
  mount_uploader :logo, LogoUploader
  mount_uploader :imagen, PicUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def self.elbarrio(neighbor)  
    if @sectores[neighbor].present?
      where({ barrio: @sectores[neighbor]})
    else
      all
    end
  end 
  
  @nororiental = ["El Chagualo",
  "Estación Villa",
  "Aranjuez",
  "Berlín",
  "La Piñuela",
  "San Isidro",
  "Palermo",
  "Bermejal",
  "San Pedro",
  "Sevilla",
  "Brasilia",
  "Manrique Central 1",
  "Manrique 1 Central 2",
  "Campo Valdés 1",
  "Campo Valdés 2",
  "Popular 1 y 2",
  "Santo Domingo Savio 1",
  "y 2",
  "Moscú 1",
  "Moscú 2",
  "Granizal",
  "La Isla",
  "El Raizal",
  "El Playón de los",
  "Comuneros 1 (La",
  "Frontera)",
  "Moravia",
  "El Jardín",
  "Las Nieves",
  "María Cano",
  "Carambolas",
  "Villa Roca",
  "La Esperanza",
  "La Avanzada",
  "El Compromiso",
  "Carpinelo",
  "Versalles 1",
  "Versalles 2",
  "San José la Cima 1",
  "San José La Cima 2",
  "Bello Horizonte",
  "Oriente",
  "La Cruz",
  "Villa Guadalupe",
  "San Pablo",
  "La Francia",
  "Andalucía",
  "La Rosa",
  "Santa Cruz",
  "La Salle",
  "Las Granjas",
  "Manrique 1 Oriental",
  "El Pomar",
  "Las Esmeraldas",
  "Santa Inés",
  "San Blas",
  "Niza Norte (Villa Niza)"
  ]

  @noroccidental = [
  "Robledo",
  "Cerro El Volador",
  "El Cucaracho",
  "Palenque 1 y 2",
  "San Germán",
  "La Pilanca",
  "El Progreso",
  "Iguaná",
  "Lenin",
  "Aures",
  "Mirador del 12",
  "Picacho",
  "Picachito",
  "Salvador",
  "Allende",
  "Jorge Eliécer",
  "Gaitán",
  "La Torre",
  "Santa Teresa de",
  "Jesús",
  "Armero II",
  "Búcaros",
  "El Paraíso",
  "El Bosque",
  "El Triunfo",
  "Brasil",
  "Los Arrayanes",
  "El Progreso",
  "La Minita",
  "San Nicolás",
  "María Auxiliadora",
  "F.Gómez",
  "Castilla",
  "Caribe",
  "Belalcázar",
  "El Día",
  "San Martín",
  "La Esperanza",
  "Kennedy",
  "Castillita",
  "Miramar",
  "Santa Margarita",
  "Alfonso López",
  "Pedregal",
  "Florencia",
  "Boyacá",
  "Las Brisas",
  "Antonio Zea",
  "López de Mesa",
  "Córdoba",
  "Téjelo",
  "Santander",
  "12 de Octubre",
  "Tricentenario",
  "Bello Horizonte",
  "La Pola",
  "Monteverde",
  "Villaflora",
  "Vallejuelos",
  "Villa Sofía",
  "Romeral",
  "Doña María",
  "Robledo",
  "Nebraska",
  "El Cortijo",
  "Candelaria"
  ]

  @centroriental = [
   "Guayaquil",
   "Colón",
   "Sucre",
   "La Ladera",
   "El Salvador",
   "Loreto",
   "Villa Hermosa",
   "Enciso",
   "La Milagrosa",
   "Alejandro",
   "Echavarría",
   "La Mansión",
   "Caicedo",
   "La Toma",
   "San Diego",
   "Las Palmas",
   "La Independencia",
   "Perpetuo Socorro",
   "Corazón de Jesús",
   "Barrio Nuevo",
   "Llanaditas",
   "Buenos Aires",
   "Boston",
   "Prado",
   "Villa Nueva",
   "San Benito",
   "Candelaria",
   "Corazón de Jesús",
   "Bomboná",
   "Los Ángeles",
   "San Miguel",
   "Villatina",
   "Llanaditas",
   "Lomas de",
   "Llanaditas",
   "Julio Rincón",
   "Manuel Morales",
   "Villa Turbay",
   "Juan Pablo II",
   "San Antonio ",
   "Las Estancias",
   "Santa. Lucía",
   "8 de Marzo",
   "13 de Noviembre",
   "La Libertad",
   "La Primavera",
   "El Edén",
   "La Sierra",
   "Golondrinas",
   "Brisas de Oriente",
   "El Vergel",
   "Enciso",
   "Loyola",
   "Los Cerros",
   "Diego Echavarría",
   "La Colina",
   "Pinar del Cerro",
   "Caunces de Oriente",
   "Cataluña",
   "Colinas de La",
   "Candelaria",
   "Quintas de la Playa",
   "Urbanización Los",
   "Cerros",
   "Urbanización El",
   "Carmelo",
   "Urbanización La",
   "Palma",
   "Isaac Gaviria "
  ]

  @centroccidental = [
   "El Salado",
   "Betania",
   "La Puerta",
   "La Loma",
   "El Corazón",
   "Belencito",
   "El Coco",
   "El Socorro",
   "Campo Alegre",
   "La América",
   "San Javier",
   "Floresta",
   "El Danubio",
   "Barrio Cristóbal",
   "Lorena",
   "Laureles",
   "Miravalle",
   "Florida",
   "Ferrini",
   "La Independencia 1,",
   "2, 3",
   "Nuevos",
   "Conquistadores",
   "La Colina",
   "Fuente Clara",
   "Blanquizal",
   "La Quiebra",
   "Santa Rosa de Lima",
   "La Pradera",
   "Los Alcázares",
   "Antonio Nariño",
   "Metropolitano",
   "20 de Julio",
   "San Joaquín",
   "Carlos E. Restrepo",
   "Santa Mónica",
   "Santa Lucía",
   "Calasanz",
   "Conquistadores",
   "Velódromo",
   "Unidad Deportiva",
   "Florida Nueva",
   "Simón Bolívar",
   "Bolivariana",
   "Suramericana "
  ]

  @suroriental = [
    "Loma de los Parra",
    "Loma de Los",
    "González",
    "El Garabato",
    "El Tesoro",
    "Loma de Los",
    "Mangos",
    "La Chacona",
    "El Poblado",
    "Aguacatala",
    "Castropol",
    "Patio Bonito",
    "LLeras",
    "Santa María de los",
    "Ángeles",
    "Villa Carlota",
    "Barrio Colombia",
    "Manila",
    "Astorga",
    "Provenza",
    "Alejandría",
    "Los Balsos",
    "Las Lomas",
    "Altos del Poblado",
    "San Lucas",
    "Florida",
    "El Castillo",
    "El Diamante",
    "Los Naranjos",
    "El Remanso",
    "El Futuro",
    "Guadalajara",
    "Vegas del Poblado"
  ]

  @suroccidental = ["Cristo Rey",
   "Nutibara",
   "Barrio Antioquia",
   "El Rodeo",
   "Altavista",
   "El Rincón",
   "Las Mercedes",
   "Belén",
   "Guayabal",
   "Alpinos",
   "Trinidad",
   "San Bernardo",
   "Las Playas",
   "Granada",
   "Betania",
   "Sucre",
   "Zafra",
   "Apolo",
   "Las Violetas",
   "Las Playas",
   "Rafael Uribe Uribe",
   "Los Libertadores",
   "La Castellana",
   "Santa fe",
   "Colina del Sur",
   "Coimita",
   "Shellmar",
   "Noel",
   "Campo Amor",
   "San Pablo",
   "Manzanares",
   "Mallorca",
   "Aliadas",
   "Rosales",
   "Fátima",
   "La Nubia",
   "Los Alpes",
   "La Palma",
   "La Castellana",
   "La Mota",
   "El Enclave",
   "Kalamarí",
   "El Rodeo",
   "Loma de los Bernal"]
 
  @rural = [
   "Altavista",
   "Palmitas",
   "Santa Elena",
   "San Cristóbal",
   "San Antonio de Prado"
   ] 
   
   @sectores = {
   "nororiental" => @nororiental.sort,

   "noroccidental" => @noroccidental.sort,

   "centroriental" => @centroriental.sort,

   "centroccidental" => @centroccidental.sort,

   "suroriental" => @suroriental.sort,

   "suroccidental" =>  @suroccidental.sort,
 
    "rural" => @rural.sort 
   }
   
end
