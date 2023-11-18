CREATE TABLE Kingdom
(
  ID_Kingdom VARCHAR(8) NOT NULL,
  Nama_Kingdom VARCHAR(25) NOT NULL,
  Deskripsi_Kingdom VARCHAR(200) NOT NULL,
  Gambar VARCHAR (500),
  PRIMARY KEY (ID_Kingdom)
);
 
CREATE TABLE Filum
(
  ID_Filum VARCHAR(8) NOT NULL,
  Nama_latin VARCHAR(80) NOT NULL,
  Karakteristik_Filum VARCHAR(250) NOT NULL,
  Perilaku_Filum VARCHAR(250) NOT NULL,
  ID_Kingdom VARCHAR(8) NOT NULL,
  PRIMARY KEY (ID_Filum),
  FOREIGN KEY (ID_Kingdom) REFERENCES Kingdom(ID_Kingdom)
);
 
CREATE TABLE Divisi
(
  ID_Divisi VARCHAR(8) NOT NULL,
  Nama_latin VARCHAR(80) NOT NULL,
  Karakteristik_Divisi VARCHAR(250) NOT NULL,
  Perilaku_Divisi VARCHAR(250) NOT NULL,
  ID_Kingdom VARCHAR(8) NOT NULL,
  PRIMARY KEY (ID_Divisi),
  FOREIGN KEY (ID_Kingdom) REFERENCES Kingdom(ID_Kingdom)
);
 
CREATE TABLE Class
(
  ID_Class VARCHAR(8) NOT NULL,
  Karakteristik_Class VARCHAR(250) NOT NULL,
  Perilaku_Class VARCHAR(250) NOT NULL,
  Nama_latin VARCHAR(80) NOT NULL,
  ID_Filum VARCHAR(8),
  ID_Divisi VARCHAR(8),
  ID_Kingdom VARCHAR(8) NOT NULL,
  PRIMARY KEY (ID_Class),
  FOREIGN KEY (ID_Filum) REFERENCES Filum(ID_Filum),
  FOREIGN KEY (ID_Divisi) REFERENCES Divisi(ID_Divisi),
  FOREIGN KEY (ID_Kingdom) REFERENCES Kingdom(ID_Kingdom)
);
 
CREATE TABLE Ordo
(
  Perilaku_Order VARCHAR(250) NOT NULL,
  Karakteristik_Order VARCHAR(250) NOT NULL,
  ID_Order VARCHAR(8) NOT NULL,
  Nama_latin VARCHAR(80) NOT NULL,
  ID_Class VARCHAR(8) NOT NULL,
  PRIMARY KEY (ID_Order),
  FOREIGN KEY (ID_Class) REFERENCES Class(ID_Class)
);
 
CREATE TABLE Family
(
  Perilaku_Family VARCHAR(250) NOT NULL,
  Karakteristik_Family VARCHAR(250) NOT NULL,
  ID_Family VARCHAR(8) NOT NULL,
  Nama_latin VARCHAR(80) NOT NULL,
  ID_Order VARCHAR(8) NOT NULL,
  PRIMARY KEY (ID_Family),
  FOREIGN KEY (ID_Order) REFERENCES Ordo(ID_Order)
);
 
CREATE TABLE Genus
(
  Habitat_Genus VARCHAR(50) NOT NULL,
  Karakteristik__Genus VARCHAR(250) NOT NULL,
  Perilaku_Genus VARCHAR(250) NOT NULL,
  ID_Genus VARCHAR(8) NOT NULL,
  Nama_latin VARCHAR(80) NOT NULL,
  ID_Family VARCHAR(8) NOT NULL,
  PRIMARY KEY (ID_Genus),
  FOREIGN KEY (ID_Family) REFERENCES Family(ID_Family)
);
 
CREATE TABLE Konservasi
(
  Lokasi_Konservasi VARCHAR(250) NOT NULL,
  ID_Konservasi VARCHAR(8) NOT NULL,
  Tanggal_pendirian DATE NOT NULL,
  PRIMARY KEY (ID_Konservasi)
);
 
CREATE TABLE Ekosistem
(
  Habitat VARCHAR(50) NOT NULL,
  Deskripsi VARCHAR(250) NOT NULL,
  PRIMARY KEY (Habitat)
);
 
CREATE TABLE Spesies
(
  ID_Spesies VARCHAR(8) NOT NULL,
  Genus VARCHAR(80) NOT NULL,
  Spesies VARCHAR(80) NOT NULL,
  Karakteristik_Spesies VARCHAR(250) NOT NULL,
  Perilaku_Spesies VARCHAR(250) NOT NULL,
  Lokasi_Spesies VARCHAR(250) NOT NULL,
  Gambar_Spesies VARCHAR(250) NOT NULL,
  Populasi INT NOT NULL,
  Tahun_identifikasi DATE NOT NULL,
  ID_Genus VARCHAR(8) NOT NULL,
  Habitat VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID_Spesies),
  FOREIGN KEY (ID_Genus) REFERENCES Genus(ID_Genus),
  FOREIGN KEY (Habitat) REFERENCES Ekosistem(Habitat)
);
 
CREATE TABLE Status
(
  ID_Spesies VARCHAR(8) NOT NULL,
  Indeks_Ancaman VARCHAR(25) NOT NULL,
  Tanggal_deklarasi DATE NOT NULL,
  PRIMARY KEY (ID_Spesies),
  FOREIGN KEY (ID_Spesies) REFERENCES Spesies(ID_Spesies)
);
 
CREATE TABLE Melestarikan
(
  ID_Konservasi VARCHAR(8) NOT NULL,
  ID_Spesies VARCHAR(8) NOT NULL,
  PRIMARY KEY (ID_Konservasi, ID_Spesies),
  FOREIGN KEY (ID_Konservasi) REFERENCES Konservasi(ID_Konservasi),
  FOREIGN KEY (ID_Spesies) REFERENCES Status(ID_Spesies)
);
 
CREATE TABLE Melindungi
(
  ID_Spesies VARCHAR(8) NOT NULL,
  ID_Konservasi VARCHAR(8) NOT NULL,
  PRIMARY KEY (ID_Spesies, ID_Konservasi),
  FOREIGN KEY (ID_Spesies) REFERENCES Spesies(ID_Spesies),
  FOREIGN KEY (ID_Konservasi) REFERENCES Konservasi(ID_Konservasi)
);
 
CREATE TABLE Menempati
(
  ID_Spesies VARCHAR(8) NOT NULL,
  Habitat VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID_Spesies, Habitat),
  FOREIGN KEY (ID_Spesies) REFERENCES Spesies(ID_Spesies),
  FOREIGN KEY (Habitat) REFERENCES Ekosistem(Habitat)
);

-- Kingdom
INSERT INTO Kingdom (ID_Kingdom, Nama_Kingdom, Deskripsi_Kingdom, Gambar) VALUES
('KD01', 'Animalia' ,'Lorem Ipsum Dolor Sit Amet','img/Placeholder/Card-Placeholder.png'),
('KD02', 'Plantae','Lorem Ipsum Dolor Sit Amet','img/Placeholder/Card-Placeholder.png'),
('KD03', 'Fungi','Lorem Ipsum Dolor Sit Amet','img/Placeholder/Card-Placeholder.png'),
('KD04', 'Protista','Lorem Ipsum Dolor Sit Amet','img/Placeholder/Card-Placeholder.png'),
('KD05', 'Bacteria','Lorem Ipsum Dolor Sit Amet','img/Placeholder/Card-Placeholder.png'),
('KD06', 'Archaea','Lorem Ipsum Dolor Sit Amet','img/Placeholder/Card-Placeholder.png');

-- Division
INSERT INTO Divisi (ID_Divisi, Nama_latin, Karakteristik_Divisi, Perilaku_Divisi, ID_Kingdom) VALUES
('DV200', 'Marchantiophyta', 'Marchantiophyta is a division of non-vascular land plants commonly referred to as liverworts. They are small, liver-shaped plants with a simple structure.', 'Liverworts reproduce both sexually and asexually through specialized structures called gemmae cups.', 'KD02'),
('DV201', 'Anthocerotophyta', 'Anthocerotophyta, commonly known as hornworts, are a group of bryophytes characterized by their unique horn-shaped sporophyte.', 'Hornworts have symbiotic relationships with cyanobacteria that help fix nitrogen from the atmosphere.', 'KD02'),
('DV202', 'Bryophyta', 'Bryophyta includes mosses, which are small, non-vascular plants that lack true roots, stems, and leaves.', 'Mosses reproduce via spores and have a crucial role in ecosystems as soil stabilizers and moisture retainers.', 'KD02'),
('DV203', 'Filicophyta', 'Filicophyta, commonly known as ferns, are vascular plants with compound leaves called fronds.', 'Ferns reproduce via spores and are known for their diverse forms and habitats, ranging from terrestrial to epiphytic.', 'KD02'),
('DV204', 'Sphenophyta', 'Sphenophyta, or horsetails, are plants with jointed stems and tiny leaves arranged in whorls.', 'Horsetails reproduce through spores and have a high silica content, making them useful for scouring and polishing.', 'KD02'),
('DV205', 'Cycadophyta', 'Cycadophyta includes cycads, which are palm-like plants with large compound leaves and stout trunks.', 'Cycads are gymnosperms and have cones for reproduction. They are often considered living fossils.', 'KD02'),
('DV206', 'Ginkgophyta', 'Ginkgophyta consists of ginkgo trees, characterized by fan-shaped leaves and distinctive foul-smelling seeds.', 'Ginkgo trees are dioecious and produce seeds directly on the branches. They are often planted as ornamental trees.', 'KD02'),
('DV207', 'Pinophyta', 'Pinophyta, or conifers, are cone-bearing trees and shrubs with needle-like or scale-like leaves.', 'Conifers are gymnosperms and produce seeds in cones. They are important timber sources and contribute to various ecosystems.', 'KD02'),
('DV208', 'Gnetophyta', 'Gnetophyta comprises gnetophytes, which are diverse plants including tropical vines, shrubs, and small trees.', 'Gnetophytes have vessels in their xylem and produce cones or seeds. They have features similar to both angiosperms and gymnosperms.', 'KD02'),
('DV209', 'Magnoliophyta', 'Magnoliophyta, commonly known as angiosperms or flowering plants, are the most diverse group of land plants.', 'Angiosperms have enclosed seeds, which are protected within fruits. They dominate terrestrial ecosystems and have various reproductive strategies.', 'KD02');

-- Phyla
INSERT INTO Filum (ID_Filum, Nama_latin, Karakteristik_Filum, Perilaku_Filum, ID_Kingdom) VALUES
-- Animalia Kingdom
('FL1000', 'Acanthocephala', 'Characteristics of Acanthocephala phylum', 'Behavior of Acanthocephala phylum', 'KD01'),
('FL1001', 'Acoelomorpha', 'Characteristics of Acoelomorpha phylum', 'Behavior of Acoelomorpha phylum', 'KD01'),
('FL1002', 'Annelida', 'Characteristics of Annelida phylum', 'Behavior of Annelida phylum', 'KD01'),
('FL1003', 'Arthropoda', 'Characteristics of Arthropoda phylum', 'Behavior of Arthropoda phylum', 'KD01'),
('FL1004', 'Brachiopoda', 'Characteristics of Brachiopoda phylum', 'Behavior of Brachiopoda phylum', 'KD01'),
('FL1005', 'Bryozoa', 'Characteristics of Bryozoa phylum', 'Behavior of Bryozoa phylum', 'KD01'),
('FL1006', 'Chaetognatha', 'Characteristics of Chaetognatha phylum', 'Behavior of Chaetognatha phylum', 'KD01'),
('FL1007', 'Chordata', 'Characteristics of Chordata phylum', 'Behavior of Chordata phylum', 'KD01'),
('FL1008', 'Cnidaria', 'Characteristics of Cnidaria phylum', 'Behavior of Cnidaria phylum', 'KD01'),
('FL1009', 'Ctenophora', 'Characteristics of Ctenophora phylum', 'Behavior of Ctenophora phylum', 'KD01'),
('FL1010', 'Cycliophora', 'Characteristics of Cycliophora phylum', 'Behavior of Cycliophora phylum', 'KD01'),
('FL1011', 'Echinodermata', 'Characteristics of Echinodermata phylum', 'Behavior of Echinodermata phylum', 'KD01'),
('FL1012', 'Entoprocta', 'Characteristics of Entoprocta phylum', 'Behavior of Entoprocta phylum', 'KD01'),
('FL1013', 'Gastrotricha', 'Characteristics of Gastrotricha phylum', 'Behavior of Gastrotricha phylum', 'KD01'),
('FL1014', 'Gnathostomulida', 'Characteristics of Gnathostomulida phylum', 'Behavior of Gnathostomulida phylum', 'KD01'),
('FL1015', 'Hemichordata', 'Characteristics of Hemichordata phylum', 'Behavior of Hemichordata phylum', 'KD01'),
('FL1016', 'Kinorhynota', 'Characteristics of Kinorhynota phylum', 'Behavior of Kinorhynota phylum', 'KD01'),
('FL1017', 'Loricifera', 'Characteristics of Loricifera phylum', 'Behavior of Loricifera phylum', 'KD01'),
('FL1018', 'Micrognathozoa', 'Characteristics of Micrognathozoa phylum', 'Behavior of Micrognathozoa phylum', 'KD01'),
('FL1019', 'Mollusca', 'Characteristics of Mollusca phylum', 'Behavior of Mollusca phylum', 'KD01'),
('FL1020', 'Nematoda', 'Characteristics of Nematoda phylum', 'Behavior of Nematoda phylum', 'KD01'),
('FL1021', 'Nematomorpha', 'Characteristics of Nematomorpha phylum', 'Behavior of Nematomorpha phylum', 'KD01'),
('FL1022', 'Nemertea', 'Characteristics of Nemertea phylum', 'Behavior of Nemertea phylum', 'KD01'),
('FL1023', 'Onychophora', 'Characteristics of Onychophora phylum', 'Behavior of Onychophora phylum', 'KD01'),
('FL1024', 'Orthonectida', 'Characteristics of Orthonectida phylum', 'Behavior of Orthonectida phylum', 'KD01'),
('FL1025', 'Phoronida', 'Characteristics of Phoronida phylum', 'Behavior of Phoronida phylum', 'KD01'),
('FL1026', 'Placozoa', 'Characteristics of Placozoa phylum', 'Behavior of Placozoa phylum', 'KD01'),
('FL1027', 'Platyhelmithes', 'Characteristics of Platyhelmithes phylum', 'Behavior of Platyhelmithes phylum', 'KD01'),
('FL1028', 'Porifera', 'Characteristics of Porifera phylum', 'Behavior of Porifera phylum', 'KD01'),
('FL1029', 'Priapulida', 'Characteristics of Priapulida phylum', 'Behavior of Priapulida phylum', 'KD01'),
('FL1030', 'Rhombozoa', 'Characteristics of Rhombozoa phylum', 'Behavior of Rhombozoa phylum', 'KD01'),
('FL1031', 'Rotifera', 'Characteristics of Rotifera phylum', 'Behavior of Rotifera phylum', 'KD01'),
('FL1032', 'Sipuncula', 'Characteristics of Sipuncula phylum', 'Behavior of Sipuncula phylum', 'KD01'),
('FL1033', 'Tardigrada', 'Characteristics of Tardigrada phylum', 'Behavior of Tardigrada phylum', 'KD01'),
('FL1034', 'Xenoturbellida', 'Characteristics of Xenoturbellida phylum', 'Behavior of Xenoturbellida phylum', 'KD01'),


-- Fungi Kingdom
('FL3000', 'Zygomycota', 'Characteristics of Zygomycota', 'Behavior of Zygomycota', 'KD03'),
('FL3001', 'Ascomycota', 'Characteristics of Ascomycota', 'Behavior of Ascomycota', 'KD03'),
('FL3002', 'Basidiomycota', 'Characteristics of Basidiomycota', 'Behavior of Basidiomycota', 'KD03'),
('FL3003', 'Chytridiomycota', 'Characteristics of Chytridiomycota', 'Behavior of Chytridiomycota', 'KD03'),
('FL3004', 'Glomeromycota', 'Characteristics of Glomeromycota', 'Behavior of Glomeromycota', 'KD03'),
('FL3005', 'Neocallimastigomycota', 'Characteristics of Neocallimastigomycota', 'Behavior of Neocallimastigomycota', 'KD03'),
('FL3006', 'Mucoromycota', 'Characteristics of Mucoromycota', 'Behavior of Mucoromycota', 'KD03'),

-- Protista Kingdom
('FL4000', 'Amoebozoa', 'Amoebozoa phylum description', 'Behavior of Amoebozoa', 'KD04'),
('FL4001', 'Myzozoa', 'Myzozoa phylum description', 'Behavior of Myzozoa', 'KD04'),
('FL4002', 'Ciliophora', 'Ciliophora phylum description', 'Behavior of Ciliophora', 'KD04'),
('FL4003', 'Rhizaria', 'Rhizaria phylum description', 'Behavior of Rhizaria', 'KD04'),
('FL4004', 'Euglenozoa', 'Euglenozoa phylum description', 'Behavior of Euglenozoa', 'KD04'),
('FL4005', 'Mycetozoa', 'Mycetozoa phylum description', 'Behavior of Mycetozoa', 'KD04'),
('FL4006', 'Ochrophyta', 'Ochrophyta phylum description', 'Behavior of Ochrophyta', 'KD04'),

-- Bacteria Kingdom
('FL5000', 'Firmicutes', 'Firmicutes phylum description', 'Behavior of Firmicutes', 'KD05'),
('FL5001', 'Proteobacteria', 'Proteobacteria phylum description', 'Behavior of Proteobacteria', 'KD05'),
('FL5002', 'Actinobacteria', 'Actinobacteria phylum description', 'Behavior of Actinobacteria', 'KD05'),
('FL5003', 'Bacteroidetes', 'Bacteroidetes phylum description', 'Behavior of Bacteroidetes', 'KD05'),
('FL5004', 'Cyanobacteria', 'Cyanobacteria phylum description', 'Behavior of Cyanobacteria', 'KD05'),
('FL5005', 'Spirochaetes', 'Spirochaetes phylum description', 'Behavior of Spirochaetes', 'KD05'),
('FL5006', 'Thermoproteota', 'Thermoproteota phylum description', 'Behavior of Thermoproteota', 'KD05'),

-- Archea Kingdom
('FL6000', 'Euryarchaeota', 'Euryarchaeota description', 'Euryarchaeota behavior', 'KD06'),
('FL6001', 'Crenarchaeota', 'Crenarchaeota description', 'Crenarchaeota behavior', 'KD06'),
('FL6002', 'Korarchaeota', 'Korarchaeota description', 'Korarchaeota behavior', 'KD06'),
('FL6003', 'Nanoarchaeota', 'Nanoarchaeota description', 'Nanoarchaeota behavior', 'KD06'),
('FL6004', 'Halobacteriota', 'Halobacteriota description', 'Halobacteriota behavior', 'KD06'),
('FL6005', 'Methanobacteriota_A', 'Methanobacteriota_A description', 'Methanobacteriota_A behavior', 'KD06'),
('FL6006', 'Methanobacteriota_B', 'Methanobacteriota_B description', 'Methanobacteriota_B behavior', 'KD06');

-- Class
INSERT INTO Class (ID_Class, Karakteristik_Class, Perilaku_Class, Nama_latin, ID_Filum, ID_Divisi, ID_Kingdom) VALUES
('CL10000', 'Class characteristics Mammalia', 'Class behavior Mammalia', 'Mammalia', 'FL1007', NULL, 'KD01'),
('CL10001', 'Class characteristics Aves', 'Class behavior Aves', 'Aves', 'FL1007', NULL, 'KD01'),
('CL10002', 'Class characteristics Reptilia', 'Class behavior Reptilia', 'Reptilia', 'FL1007', NULL, 'KD01'),
('CL10003', 'Class characteristics Malacostraca', 'Class behavior Malacostraca', 'Malacostraca', 'FL1003', NULL, 'KD01'),
('CL10004', 'Class characteristics Actinopterygii', 'Class behavior Actinopterygii', 'Actinopterygii', 'FL1007', NULL, 'KD01'),
('CL10005', 'Class characteristics Insecta', 'Class behavior Insecta', 'Insecta', 'FL1003', NULL, 'KD01'),
('CL10006', 'Class characteristics Arachnida', 'Class behavior Arachnida', 'Arachnida', 'FL1003', NULL, 'KD01'),
('CL10007', 'Class characteristics Copepoda', 'Class behavior Copepoda', 'Copepoda', 'FL1003', NULL, 'KD01'),
('CL10008', 'Class characteristics Gastropoda', 'Class behavior Gastropoda', 'Gastropoda', 'FL1019', NULL, 'KD01'),
('CL10009', 'Class characteristics Bivalvia', 'Class behavior Bivalvia', 'Bivalvia', 'FL1019', NULL, 'KD01'),
('CL10010', 'Class characteristics Amphibia', 'Class behavior Amphibia', 'Amphibia', 'FL1010', NULL, 'KD01'),
('CL10011', 'Class characteristics Asteroidea', 'Class behavior Asteroidea', 'Asteroidea', 'FL1007', NULL, 'KD01'),
('CL10012', 'Class characteristics Echinoidea', 'Class behavior Echinoidea', 'Echinoidea', 'FL1011', NULL, 'KD01'),
('CL10013', 'Class characteristics Demospongiae', 'Class behavior Demospongiae', 'Demospongiae', 'FL1028', NULL, 'KD01'),
--
('CL20000', 'Characteristics of Magnoliopsida', 'Behavior of Magnoliopsida', 'Magnoliopsida', NULL, 'DV209', 'KD02'),
('CL20001', 'Characteristics of Pinopsida', 'Behavior of Pinopsida', 'Pinopsida', NULL, 'DV209', 'KD02'),
('CL20002', 'Characteristics of Liliopsida', 'Behavior of Liliopsida', 'Liliopsida', NULL, 'DV209', 'KD02'),
('CL20003', 'Characteristics of Polypodiopsida', 'Behavior of Polypodiopsida', 'Polypodiopsida', NULL, 'DV209', 'KD02'),
('CL20004', 'Characteristics of Ginkgoopsida', 'Behavior of Ginkgoopsida', 'Ginkgoopsida', NULL, 'DV209', 'KD02'),
('CL20005', 'Characteristics of Marchantiopsida', 'Behavior of Marchantiopsida', 'Marchantiopsida', NULL, 'DV200', 'KD02'),
('CL20006', 'Characteristics of Lycopodiopsida', 'Behavior of Lycopodiopsida', 'Lycopodiopsida', NULL, 'DV209', 'KD02'),
('CL20007', 'Characteristics of Bryopsida', 'Behavior of Bryopsida', 'Bryopsida', NULL, 'DV202', 'KD02'),
('CL20008', 'Characteristics of Jungermanniopsida', 'Behavior of Jungermanniopsida', 'Jungermanniopsida', NULL, 'DV202', 'KD02'),
('CL20009', 'Characteristics of Cycadopsida', 'Behavior of Cycadopsida', 'Cycadopsida', NULL, 'DV205', 'KD02'),

--
('CL30000', 'Characteristics of Agaricomycetes', 'Behavior of Agaricomycetes', 'Agaricomycetes', 'FL3002', NULL, 'KD03'),
('CL30001', 'Characteristics of Sordariomycetes', 'Behavior of Sordariomycetes', 'Sordariomycetes', 'FL3001', NULL, 'KD03'),
('CL30002', 'Characteristics of Eurotiomycetes', 'Behavior of Eurotiomycetes', 'Eurotiomycetes', 'FL3001', NULL, 'KD03'),
('CL30003', 'Characteristics of Mucoromycetes', 'Behavior of Mucoromycetes', 'Mucoromycetes', 'FL3006', NULL, 'KD03'),
('CL30004', 'Characteristics of Dothideomycetes', 'Behavior of Dothideomycetes', 'Dothideomycetes', 'FL3001', NULL, 'KD03'),
('CL30005', 'Characteristics of Lecanoromycetes', 'Behavior of Lecanoromycetes', 'Lecanoromycetes', 'FL3001', NULL, 'KD03'),

--
('CL40000', 'Characteristics of Kinetoplastea', 'Behavior of Kinetoplastea', 'Kinetoplastea', 'FL4004', NULL, 'KD04'),
('CL40001', 'Characteristics of Dictyosteliomycetes', 'Behavior of Dictyosteliomycetes', 'Dictyosteliomycetes', 'FL4005', NULL, 'KD04'),
('CL40002', 'Characteristics of Lobosa', 'Behavior of Lobosa', 'Lobosa', 'FL4000', NULL, 'KD04'),
('CL40003', 'Characteristics of Bacillariophyceae', 'Behavior of Bacillariophyceae', 'Bacillariophyceae', 'FL4006', NULL, 'KD04'),
('CL40004', 'Characteristics of Dinophyceae', 'Behavior of Dinophyceae', 'Dinophyceae', 'FL4001', NULL, 'KD04'),
('CL40005', 'Characteristics of Oligohymenophorea', 'Behavior of Oligohymenophorea', 'Oligohymenophorea', 'FL4002', NULL, 'KD04'),

--
('CL50000', 'Characteristics of Gammaproteobacteria', 'Behavior of Gammaproteobacteria', 'Gammaproteobacteria', 'FL5001', NULL, 'KD05'),
('CL50001', 'Characteristics of Cyanobacteriia', 'Behavior of Cyanobacteriia', 'Cyanobacteriia', 'FL5004', NULL, 'KD05'),
('CL50002', 'Characteristics of Nitrososphaeria', 'Behavior of Nitrososphaeria', 'Nitrososphaeria', 'FL5006', NULL, 'KD05'),
('CL50003', 'Characteristics of Alphaproteobacteria', 'Behavior of Alphaproteobacteria', 'Alphaproteobacteria', 'FL5001', NULL, 'KD05'),
('CL50004', 'Characteristics of Actinomycetia', 'Behavior of Actinomycetia', 'Actinomycetia', 'FL5002', NULL, 'KD05'),
('CL50005', 'Characteristics of Coriobacteriia', 'Behavior of Coriobacteriia', 'Coriobacteriia', 'FL5002', NULL, 'KD05'),

--
('CL60000', 'Class Halobacteria characteristics', 'Class Halobacteria behavior', 'Halobacteria', 'FL6004', NULL, 'KD06'),
('CL60001', 'Class Methanococci characteristics', 'Class Methanococci behavior', 'Methanococci', 'FL6005', NULL, 'KD06'),
('CL60002', 'Class Thermococci characteristics', 'Class Thermococci behavior', 'Thermococci', 'FL6006', NULL, 'KD06'),
('CL60003', 'Class Methanopyri characteristics', 'Class Methanopyri behavior', 'Methanopyri', 'FL6005', NULL, 'KD06'),
('CL60004', 'Class Nanoarchaeia characteristics', 'Class Nanoarchaeia behavior', 'Nanoarchaeia', 'FL6003', NULL, 'KD06');


-- Ordo 
INSERT INTO Ordo (ID_Order, Karakteristik_Order, Perilaku_Order, Nama_latin, ID_Class) VALUES
('OD10000', 'Characteristics of Carnivora', 'Behavior of Carnivora', 'Carnivora', 'CL10000'),
('OD10001', 'Characteristics of Strigiformes', 'Behavior of Strigiformes', 'Strigiformes', 'CL10001'),
('OD10002', 'Characteristics of Artiodactyla', 'Behavior of Artiodactyla', 'Artiodactyla', 'CL10000'),
('OD10003', 'Characteristics of Squamata', 'Behavior of Squamata', 'Squamata', 'CL10002'),
('OD10004', 'Characteristics of Testudines', 'Behavior of Testudines', 'Testudines', 'CL10002'),
('OD10005', 'Characteristics of Decapoda', 'Behavior of Decapoda', 'Decapoda', 'CL10003'),
('OD10006', 'Characteristics of Salmoniformes', 'Behavior of Salmoniformes', 'Salmoniformes', 'CL10004'),
('OD10007', 'Characteristics of Primates', 'Behavior of Primates', 'Primates', 'CL10000'),
('OD10008', 'Characteristics of Rodentia', 'Behavior of Rodentia', 'Rodentia', 'CL10000'),
('OD10009', 'Characteristics of Chiroptera', 'Behavior of Chiroptera', 'Ordo Latin Chiroptera', 'CL10000'),
('OD10010', 'Characteristics of Passeriformes', 'Behavior of Passeriformes', 'Passeriformes', 'CL10001'),
('OD10011', 'Characteristics of Hymenoptera', 'Behavior of Hymenoptera', 'Hymenoptera', 'CL10005'),
('OD10012', 'Characteristics of Lepidoptera', 'Behavior of Lepidoptera', 'Lepidoptera', 'CL10005'),
('OD10013', 'Characteristics of Coleoptera', 'Behavior of Coleoptera', 'Coleoptera', 'CL10005'), 

--
('OD20000', 'Characteristics of Malvales', 'Behavior of Malvales', 'Malvales', 'CL20000'),
('OD20001', 'Characteristics of Cupressales', 'Behavior of Cupressales', 'Cupressales', 'CL20001'),
('OD20002', 'Characteristics of Pinales', 'Behavior of Pinales', 'Pinales', 'CL20001'),
('OD20003', 'Characteristics of Ericales', 'Behavior of Ericales', 'Ericales', 'CL20000'),
('OD20004', 'Characteristics of Lamiales', 'Behavior of Lamiales', 'Lamiales', 'CL20000'),
('OD20005', 'Characteristics of Asparagales', 'Behavior of Asparagales', 'Asparagales', 'CL20002'),
('OD20006', 'Characteristics of Poales', 'Behavior of Poales', 'Poales', 'CL20002'),
('OD20007', 'Characteristics of Brassicales', 'Behavior of Brassicales', 'Brassicales', 'CL20000'),
('OD20008', 'Characteristics of Rosales', 'Behavior of Rosales', 'Rosales', 'CL20000'),

--
('OD30000', 'Characteristics of Agaricales', 'Behavior of Agaricales', 'Agaricales', 'CL30000'),
('OD30001', 'Characteristics of Hypocreales', 'Behavior of Hypocreales', 'Hypocreales', 'CL30001'),
('OD30002', 'Characteristics of Aspergillales', 'Behavior of Aspergillales', 'Aspergillales', 'CL30002'),
('OD30003', 'Characteristics of Eurotiales', 'Behavior of Eurotiales', 'Eurotiales', 'CL30002'),
('OD30004', 'Characteristics of Mucorales', 'Behavior of Mucorales', 'Mucorales', 'CL30002'),

--
('OD40000', 'Characteristics of Trypanosomatida', 'Behavior of Trypanosomatida', 'Trypanosomatida', 'CL40000'),
('OD40001', 'Characteristics of Dictyosteliales', 'Behavior of Dictyosteliales', 'Dictyosteliales', 'CL40001'),
('OD40002', 'Characteristics of Amoebida', 'Behavior of Amoebida', 'Amoebida', 'CL40002'),
('OD40003', 'Characteristics of Thalassiosirales', 'Behavior of Thalassiosirales', 'Thalassiosirales', 'CL40003'),
('OD40004', 'Characteristics of Gonyaulacales', 'Behavior of Gonyaulacales', 'Gonyaulacales', 'CL40004'),
('OD40005', 'Characteristics of Peniculida', 'Behavior of Peniculida', 'Peniculida', 'CL40005'),
('OD40006', 'Characteristics of Gymnodiniales', 'Behavior of Gymnodiniales', 'Gymnodiniales', 'CL40004'),

--
('OD50000', 'Characteristics of Pseudomonadales', 'Behavior of Pseudomonadales', 'Pseudomonadales', 'CL50000'),
('OD50001', 'Characteristics of Cyanobacteriales', 'Behavior of Cyanobacteriales', 'Cyanobacteriales', 'CL50001'),
('OD50002', 'Characteristics of Nitrososphaerales', 'Behavior of Nitrososphaerales', 'Nitrososphaerales', 'CL50002'),
('OD50003', 'Characteristics of Enterobacterales', 'Behavior of Enterobacterales', 'Enterobacterales', 'CL50000'),
('OD50004', 'Characteristics of Francisellales', 'Behavior of Francisellales', 'Francisellales', 'CL50000'),
('OD50005', 'Characteristics of Rhizobiales', 'Behavior of Rhizobiales', 'Rhizobiales', 'CL50003'),
('OD50006', 'Characteristics of Pelagibacterales', 'Behavior of Pelagibacterales', 'Pelagibacterales', 'CL50003'),

--
('OD60000', 'Characteristics of Halobacteriales', 'Behavior of Halobacteriales', 'Halobacteriales', 'CL60000'),
('OD60001', 'Characteristics of Methanococcales', 'Behavior of Methanococcales', 'Methanococcales', 'CL60001'),
('OD60002', 'Characteristics of Thermococcales', 'Behavior of Thermococcales', 'Thermococcales', 'CL60002'),
('OD60003', 'Characteristics of Methanopyrales', 'Behavior of Methanopyrales', 'Methanopyrales', 'CL60003'),
('OD60004', 'Characteristics of Methanofastidiosales', 'Behavior of Methanofastidiosales', 'Methanofastidiosales', 'CL60002'),
('OD60005', 'Characteristics of Nanoarchaeales', 'Behavior of Nanoarchaeales', 'Nanoarchaeales', 'CL60004');


-- Family
INSERT INTO Family (ID_Family, Karakteristik_Family, Perilaku_Family, Nama_latin, ID_Order) VALUES 
('FM10000', 'Characteristics of Felidae', 'Behavior of Felidae', 'Felidae', 'OD10000'),
('FM10001', 'Characteristics of Canidae', 'Behavior of Canidae', 'Canidae', 'OD10000'),
('FM10002', 'Characteristics of Ursidae', 'Behavior of Ursidae', 'Ursidae', 'OD10000'),
('FM10003', 'Characteristics of Strigidae', 'Behavior of Strigidae', 'Strigidae', 'OD10001'),
('FM10004', 'Characteristics of Cervidae', 'Behavior of Cervidae', 'Cervidae', 'OD10002'),
('FM10005', 'Characteristics of Viperidae', 'Behavior of Viperidae', 'Viperidae', 'OD10003'),
('FM10006', 'Characteristics of Giraffidae', 'Behavior of Giraffidae', 'Giraffidae', 'OD10002'),
('FM10007', 'Characteristics of Emydidae', 'Behavior of Emydidae', 'Emydidae', 'OD10004'),
('FM10008', 'Characteristics of Ocypodidae', 'Behavior of Ocypodidae', 'Ocypodidae', 'OD10005'),
('FM10009', 'Characteristics of Salmonidae', 'Behavior of Salmonidae', 'Salmonidae', 'OD10006'),
--
('FM20000', 'Characteristics of Malvaceae', 'Behavior of Malvaceae', 'Malvaceae', 'OD20000'),
('FM20001', 'Characteristics of Cupressaceae', 'Behavior of Cupressaceae', 'Cupressaceae', 'OD20001'),
('FM20002', 'Characteristics of Pinaceae', 'Behavior of Pinaceae', 'Pinaceae', 'OD20002'),
('FM20003', 'Characteristics of Ericaceae', 'Behavior of Ericaceae', 'Ericaceae', 'OD20003'),
('FM20004', 'Characteristics of Lamiaceae', 'Behavior of Lamiaceae', 'Lamiaceae', 'OD20004'),
('FM20005', 'Characteristics of Asparagaceae', 'Behavior of Asparagaceae', 'Asparagaceae', 'OD20005'),

--
('FM30000', 'Characteristics of Pleurotaceae', 'Behavior of Pleurotaceae', 'Pleurotaceae', 'OD30000'),
('FM30001', 'Characteristics of Amanitaceae', 'Behavior of Amanitaceae', 'Amanitaceae', 'OD30000'),
('FM30002', 'Characteristics of Cortinariaceae', 'Behavior of Cortinariaceae', 'Cortinariaceae', 'OD30000'),
('FM30003', 'Characteristics of Tricholomataceae', 'Behavior of Tricholomataceae', 'Tricholomataceae', 'OD30000'),
('FM30004', 'Characteristics of Ophiocordycipitaceae', 'Behavior of Ophiocordycipitaceae', 'Ophiocordycipitaceae', 'OD30001'),
('FM30005', 'Characteristics of Agaricaceae', 'Behavior of Agaricaceae', 'Agaricaceae', 'OD30000'),

--
('FM40000', 'Characteristics of Trypanosomatidae', 'Behavior of Trypanosomatidae', 'Trypanosomatidae', 'OD40000'),
('FM40001', 'Characteristics of Dictyosteliidae', 'Behavior of Dictyosteliidae', 'Dictyosteliidae', 'OD40001'),
('FM40002', 'Characteristics of Amoebidae', 'Behavior of Amoebidae', 'Amoebidae', 'OD40002'),
('FM40003', 'Characteristics of Thalassiosiraceae', 'Behavior of Thalassiosiraceae', 'Thalassiosiraceae', 'OD40003'),
('FM40004', 'Characteristics of Ceratiaceae', 'Behavior of Ceratiaceae', 'Ceratiaceae', 'OD40004'),
('FM40005', 'Characteristics of Parameciidae', 'Behavior of Parameciidae', 'Parameciidae', 'OD40005'),

--
('FM50000', 'Characteristics of Oceanospirillaceae', 'Behavior of Oceanospirillaceae', 'Oceanospirillaceae', 'OD50000'),
('FM50001', 'Characteristics of Prochloraceae', 'Behavior of Prochloraceae', 'Prochloraceae', 'OD50001'),
('FM50002', 'Characteristics of Nitrosopumilaceae', 'Behavior of Nitrosopumilaceae', 'Nitrosopumilaceae', 'OD50002'),
('FM50003', 'Characteristics of Vibrionaceae', 'Behavior of Vibrionaceae', 'Vibrionaceae', 'OD50003'),
('FM50004', 'Characteristics of Francisellaceae', 'Behavior of Francisellaceae', 'Francisellaceae', 'OD50004'),
('FM50005', 'Characteristics of Rhizobiaceae', 'Behavior of Rhizobiaceae', 'Rhizobiaceae', 'OD50005'),

--
('FM60000', 'Characteristics of Halobacteriaceae', 'Behavior of Halobacteriaceae', 'Halobacteriaceae', 'OD60000'),
('FM60001', 'Characteristics of Methanococcaceae', 'Behavior of Methanococcaceae', 'Methanococcaceae', 'OD60001'),
('FM60002', 'Characteristics of Thermococcaceae', 'Behavior of Thermococcaceae', 'Thermococcaceae', 'OD60002'),
('FM60003', 'Characteristics of Methanopyraceae', 'Behavior of Methanopyraceae', 'Methanopyraceae', 'OD60003'),
('FM60004', 'Characteristics of Methanofastidiosaceae', 'Behavior of Methanofastidiosaceae', 'Methanofastidiosaceae', 'OD60002'),
('FM60005', 'Characteristics of Nanoarchaeaceae', 'Behavior of Nanoarchaeaceae', 'Nanoarchaeaceae', 'OD60002');


-- Genus 
INSERT INTO Genus (ID_Genus, Perilaku_Genus, Karakteristik__Genus, Habitat_Genus, Nama_latin, ID_Family) VALUES
('GN10000', 'Characteristics of Panthera Genus', 'Behavior of Panthera Genus', 'Rainforest','Genus Panthera', 'FM10000'),
('GN10001', 'Characteristics of Vulpes Genus', 'Behavior of Vulpes Genus', 'Temperate Forest','Genus Vulpes', 'FM10001'),
('GN10002', 'Characteristics of Ursus Genus', 'Behavior of Ursus Genus', 'Taiga','Genus Ursus', 'FM10002'),
('GN10003', 'Characteristics of Bubo Genus', 'Behavior of Bubo Genus', 'Tundra','Genus Bubo', 'FM10003'),
('GN10004', 'Characteristics of Muntiacus Genus', 'Behavior of Muntiacus Genus', 'Shrubland','Genus Muntiacus', 'FM10004'),
('GN10005', 'Characteristics of Crotalus Genus', 'Behavior of Crotalus Genus', 'Desert','Genus Crotalus', 'FM10005'),
('GN10006', 'Characteristics of Giraffa Genus', 'Behavior of Giraffa Genus', 'Grassland','Genus Giraffa', 'FM10006'),
('GN10007', 'Characteristics of Trachemys Genus', 'Behavior of Trachemys Genus', 'Lentic','Genus Trachemys', 'FM10007'),
('GN10008', 'Characteristics of Uca Genus', 'Behavior of Uca Genus', 'Littoral','Genus Uca', 'FM10008'),
('GN10009', 'Characteristics of Salmo Genus', 'Behavior of Salmo Genus', 'Lotic', 'Genus Salmo', 'FM10009'),

--
('GN20000', 'Characteristics of Theobroma Genus', 'Behavior of Theobroma Genus', 'Rainforest','Genus Theobroma', 'FM20000'),
('GN20001', 'Characteristics of Sequoia Genus', 'Behavior of Sequoia Genus', 'Temperate Forest','Genus Sequoia', 'FM20001'),
('GN20002', 'Characteristics of Pinus Genus', 'Behavior of Pinus Genus', 'Taiga','Genus Pinus', 'FM20002'),
('GN20003', 'Characteristics of Cassiope Genus', 'Behavior of Cassiope Genus', 'Tundra','Genus Cassiope', 'FM20003'),
('GN20004', 'Characteristics of Salvia Genus', 'Behavior of Salvia Genus', 'Shrubland','Genus Salvia', 'FM20004'),
('GN20005', 'Characteristics of Yucca Genus', 'Behavior of Yucca Genus', 'Desert','Genus Yucca', 'FM20005'),

--
('GN30000', 'Characteristics of Pleurotus Genus', 'Behavior of Pleurotus Genus', 'Rainforest','Genus Pleurotus', 'FM30000'),
('GN30001', 'Characteristics of Amanita Genus', 'Behavior of Amanita Genus', 'Temperate Forest','Genus Amanita', 'FM30001'),
('GN30002', 'Characteristics of Cortinarius Genus', 'Behavior of Cortinarius Genus', 'Taiga','Genus Cortinarius', 'FM30002'),
('GN30003', 'Characteristics of Tricholoma Genus', 'Behavior of Tricholoma Genus', 'Tundra','Genus Tricholoma', 'FM30003'),
('GN30004', 'Characteristics of Ophiocordyceps Genus', 'Behavior of Ophiocordyceps Genus', 'Shrubland','Genus Ophiocordyceps', 'FM30004'),
('GN30005', 'Characteristics of Podaxis Genus', 'Behavior of Podaxis Genus', 'Desert','Genus Podaxis', 'FM30005'),

--
('GN40000', 'Characteristics of Leishmania Genus', 'Behavior of Leishmania Genus', 'Rainforest','Genus Leishmania', 'FM40000'),
('GN40001', 'Characteristics of Dictyostelium Genus', 'Behavior of Dictyostelium Genus', 'Temperate Forest','Genus Dictyostelium', 'FM40001'),
('GN40002', 'Characteristics of Amoeba Genus', 'Behavior of Amoeba Genus', 'Freshwater','Genus Amoeba', 'FM40002'),
('GN40003', 'Characteristics of Thalassiosira Genus', 'Behavior of Thalassiosira Genus', 'Oceanic','Genus Thalassiosira', 'FM40003'),
('GN40004', 'Characteristics of Ceratium Genus', 'Behavior of Ceratium Genus', 'Oceanic','Genus Ceratium', 'FM40004'),
('GN40005', 'Characteristics of Paramecium Genus', 'Behavior of Paramecium Genus', 'Freshwater','Genus Paramecium', 'FM40005'),

--
('GN50000', 'Characteristics of Motiliproteus Genus', 'Behavior of Motiliproteus Genus', 'Coral Reef','Genus Motiliproteus', 'FM50000'),
('GN50001', 'Characteristics of Prochlorococcus Genus', 'Behavior of Prochlorococcus Genus', 'Oceanic','Genus Prochlorococcus', 'FM50001'),
('GN50002', 'Characteristics of Nitrosopumilus Genus', 'Behavior of Nitrosopumilus Genus', 'Oceanic','Genus Nitrosopumilus', 'FM50002'),
('GN50003', 'Characteristics of Vibrio Genus', 'Behavior of Vibrio Genus', 'Oceanic','Genus Vibrio', 'FM50003'),
('GN50004', 'Characteristics of Francisella Genus', 'Behavior of Francisella Genus', 'Grassland','Genus Francisella', 'FM50004'),
('GN50005', 'Characteristics of Rhizobium Genus', 'Behavior of Rhizobium Genus', 'Shrubland','Genus Rhizobium', 'FM50005'),
--
('GN60000', 'Characteristics of Halobacterium Elazari-Volcani Genus', 'Behavior of Halobacterium Elazari-Volcani Genus', 'Rainforest','Halobacterium Elazari-Volcani Genus', 'FM60000'),
('GN60001', 'Characteristics of Methanococcus Genus', 'Behavior of Methanococcus Genus', 'Oceanic','Genus Methanococcus', 'FM60001'),
('GN60002', 'Characteristics of Pyrococcus Genus', 'Behavior of Pyrococcus Genus', 'Oceanic','Genus Pyrococcus', 'FM60002'),
('GN60003', 'Characteristics of Methanopyrus Genus', 'Behavior of Methanopyrus Genus', 'Oceanic','Genus Methanopyrus', 'FM60003'),
('GN60004', 'Characteristics of Thermococcus Genus', 'Behavior of Thermococcus Genus', 'Oceanic','Genus Thermococcus', 'FM60002'),
('GN60005', 'Characteristics of Nanoarchaeum Genus', 'Behavior of Nanoarchaeum Genus', 'Oceanic','Genus Nanoarchaeum', 'FM60005');

-- Ekosistem
INSERT INTO Ekosistem (Habitat, Deskripsi) VALUES
('Rainforest', 'Deskrispsi Habitat Rainforest'),
('Temperate Forest', 'Deskrispsi Habitat Temperate Forest'),
('Taiga', 'Deskrispsi Habitat Taiga'),
('Tundra', 'Deskrispsi Habitat Tundra'),
('Shrubland', 'Deskrispsi Habitat Shrubland'),
('Desert', 'Deskrispsi Habitat Desert'),
('Grassland', 'Deskrispsi Habitat Grassland'),
('Lentic', 'Deskrispsi Habitat Lentic'),
('Littoral', 'Deskrispsi Habitat Littoral'),
('Lotic', 'Deskrispsi Habitat Lotic'),
('Coral Reef', 'Deskrispsi Habitat Coral Reefs'),
('Oceanic', 'Deskrispsi Habitat Oceanic'),
('Freshwater', 'Deskripsi Habitat Freshwater');


-- Spesies
INSERT INTO Spesies (ID_Spesies, Karakteristik_Spesies, Perilaku_Spesies, Habitat, Lokasi_Spesies, Tahun_identifikasi, Populasi, Gambar_Spesies, Genus, Spesies, ID_Genus) VALUES
('SP10000', 'Characteristics of Panthera onca', 'Behavior of Panthera onca', 'Rainforest', 'Location of Panthera onca', '1970-01-01' , 12345 , 'Picture of Panthera onca', 'Genus Panthera', 'Panthera onca', 'GN10000'),
('SP10001', 'Characteristics of Vulpes vulpes', 'Behavior of Vulpes vulpes', 'Temperate Forest', 'Location of Vulpes vulpes', '1970-01-01' , 12345 ,  'Picture of Vulpes vulpes', 'Genus Vulpes', 'Vulpes vulpes', 'GN10001'),
('SP10002', 'Characteristics of Ursus arctos', 'Behavior of Ursus arctos', 'Taiga', 'Location of Ursus arctos', '1970-01-01' , 12345 , 'Picture of Ursus arctos', 'Genus Ursus', 'Ursus arctos', 'GN10002'),
('SP10003', 'Characteristics of Bubo scandiacus', 'Behavior of Bubo scandiacus', 'Tundra', 'Location of Bubo scandiacus', '1970-01-01' , 12345 , 'Picture of Bubo scandiacus', 'Genus Bubo', 'Bubo scandiacus', 'GN10003'),
('SP10004', 'Characteristics of Muntiacus muntjak', 'Behavior of Muntiacus muntjak', 'Shrubland', 'Location of Muntiacus muntjak', '1970-01-01' , 12345 , 'Picture of Muntiacus muntjak', 'Genus Muntiacus', 'Muntiacus muntjak', 'GN10004'),
('SP10005', 'Characteristics of Crotalus cerastes', 'Behavior of Crotalus cerastes', 'Desert', 'Location of Crotalus cerastes', '1970-01-01' , 12345 , 'Picture of Crotalus cerastes', 'Genus Crotalus', 'Crotalus cerastes', 'GN10005'),
('SP10006', 'Characteristics of Giraffa camelopardalis', 'Behavior of Giraffa camelopardalis', 'Grassland', 'Location of Giraffa camelopardalis', '1970-01-01' , 12345 ,  'Picture of Giraffa camelopardalis', 'Genus Giraffa', 'Giraffa camelopardalis', 'GN10006'),
('SP10007', 'Characteristics of Trachemys scripta', 'Behavior of Trachemys scripta', 'Lentic', 'Location of Trachemys scripta', '1970-01-01' , 12345 ,  'Picture of Trachemys scripta', 'Genus Trachemys', 'Trachemys scripta', 'GN10007'),
('SP10008', 'Characteristics of Uca pugilator', 'Behavior of Uca pugilator', 'Littoral', 'Location of Uca pugilator', '1970-01-01' , 12345 , 'Picture of Uca pugilator', 'Genus Uca', 'Uca pugilator', 'GN10008'),
('SP10009', 'Characteristics of Salmo trutta', 'Behavior of Salmo trutta', 'Lotic', 'Location of Salmo trutta', '1970-01-01' , 12345 ,  'Picture of Salmo trutta', 'Genus Salmo', 'Salmo trutta', 'GN10009'),


--
('SP20000', 'Characteristics of Theobroma cacao', 'Behavior of Theobroma cacao', 'Rainforest', 'Location of Theobroma cacao', '1970-01-01' , 12345 , 'Picture of Theobroma cacao', 'Theobroma', 'Theobroma cacao', 'GN20000'),
('SP20001', 'Characteristics of Sequoia sempervirens', 'Behavior of Sequoia sempervirens', 'Temperate Forest', 'Location of Sequoia sempervirens', '1970-01-01' , 12345 ,'Picture of Sequoia sempervirens', 'Genus Sequoia', 'Sequoia sempervirens', 'GN20001'),
('SP20002', 'Characteristics of Pinus sylvestris', 'Behavior of Pinus sylvestris', 'Taiga', 'Location of Pinus sylvestris', '1970-01-01' , 12345 ,'Picture of Pinus sylvestris', 'Genus Pinus', 'Pinus sylvestris', 'GN20002'),
('SP20003', 'Characteristics of Cassiope mertensiana', 'Behavior of Cassiope mertensiana', 'Tundra', 'Location of Cassiope mertensiana', '1970-01-01' , 12345 ,'Picture of Cassiope mertensiana', 'Genus Cassiope', 'Cassiope mertensiana', 'GN20003'),
('SP20004', 'Characteristics of Salvia apiana', 'Behavior of Salvia apiana', 'Shrubland', 'Location of Salvia apiana', '1970-01-01' , 12345 ,'Picture of Salvia apiana', 'Genus Salvia', 'Salvia apiana', 'GN20004'),
('SP20005', 'Characteristics of Yucca schidigera', 'Behavior of Yucca schidigera', 'Desert', 'Location of Yucca schidigera', '1970-01-01' , 12345 ,'Picture of Yucca schidigera', 'Yucca', 'Yucca schidigera', 'GN20005'),

--
('SP30000', 'Characteristics of Pleurotus djamor', 'Behavior of Pleurotus djamor', 'Rainforest', 'Location of Pleurotus djamor', '1970-01-01' , 12345 ,'Picture of Pleurotus djamor', 'Genus Pleurotus', 'Pleurotus djamor', 'GN30000'),
('SP30001', 'Characteristics of Amanita phalloidesn', 'Behavior of Amanita phalloidesn', 'Temperate Forest', 'Location of Amanita phalloidesn', '1970-01-01' , 12345 ,'Picture of Amanita phalloidesn', 'Genus Amanita', 'Amanita phalloidesn', 'GN30001'),
('SP30002', 'Characteristics of Cortinarius violaceus', 'Behavior of Cortinarius violaceus', 'Taiga', 'Location of Cortinarius violaceus', '1970-01-01' , 12345 ,'Picture of Cortinarius violaceus', 'Genus Cortinarius', 'Cortinarius violaceus', 'GN30002'),
('SP30003', 'Characteristics of Tricholoma matsutake', 'Behavior of Tricholoma matsutake', 'Tundra', 'Location of Tricholoma matsutake', '1970-01-01' , 12345 ,'Picture of Tricholoma matsutake', 'Genus Tricholoma', 'Tricholoma matsutake', 'GN30003'),
('SP30004', 'Characteristics of Ophiocordyceps sinensis', 'Behavior of Ophiocordyceps sinensis', 'Shrubland', 'Location of Ophiocordyceps sinensis', '1970-01-01' , 12345 ,'Picture of Ophiocordyceps sinensis', 'Genus Ophiocordyceps', 'Ophiocordyceps sinensis', 'GN30004'),
('SP30005', 'Characteristics of Podaxis pistillaris', 'Behavior of Podaxis pistillaris', 'Desert', 'Location of Podaxis pistillaris', '1970-01-01' , 12345 ,'Picture of Podaxis pistillaris', 'Genus Podaxis', 'Podaxis pistillaris', 'GN30005'),

--
('SP40000', 'Characteristics of Leishmania donovani', 'Behavior of Leishmania donovani', 'Rainforest', 'Location of Leishmania donovani', '1970-01-01' , 12345 ,'Picture of Leishmania donovani', 'Genus Leishmania', 'Leishmania donovani', 'GN40000'),
('SP40001', 'Characteristics of Dictyostelium discoideum', 'Behavior of Dictyostelium discoideum', 'Temperate Forest', 'Location of Dictyostelium discoideum', '1970-01-01' , 12345 ,'Picture of Dictyostelium discoideum', 'Genus Dictyostelium', 'Dictyostelium discoideum', 'GN40001'),
('SP40002', 'Characteristics of Amoeba proteus', 'Behavior of Amoeba proteus', 'Freshwater', 'Location of Amoeba proteus', '1970-01-01' , 12345 ,'Picture of Amoeba proteus', 'Genus Amoeba', 'Amoeba proteus', 'GN40002'),
('SP40003', 'Characteristics of Thalassiosira pseudonana', 'Behavior of Thalassiosira pseudonana', 'Oceanic', 'Location of Thalassiosira pseudonana', '1970-01-01' , 12345 ,'Picture of Thalassiosira pseudonana', 'Genus Thalassiosira', 'Thalassiosira pseudonana', 'GN40003'),
('SP40004', 'Characteristics of Ceratium hirundinella', 'Behavior of Ceratium hirundinella', 'Oceanic', 'Location of Ceratium hirundinella', '1970-01-01' , 12345 ,'Picture of Ceratium hirundinella', 'Genus Ceratium', 'Ceratium hirundinella', 'GN40004'),
('SP40005', 'Characteristics of Paramecium caudatum', 'Behavior of Paramecium caudatum', 'Freshwater', 'Location of Paramecium caudatum', '1970-01-01' , 12345 ,'Picture of Paramecium caudatum', 'Genus Paramecium', 'Paramecium caudatum', 'GN40005'),

--
('SP50000', 'Characteristics of Motiliproteus coralliicola', 'Behavior of Motiliproteus coralliicola', 'Coral Reef', 'Location of Motiliproteus coralliicola', '1970-01-01' , 12345 ,'Picture of Motiliproteus coralliicola', 'Genus Motiliproteus', 'Motiliproteus coralliicola', 'GN50000'),
('SP50001', 'Characteristics of Prochlorococcus marinus', 'Behavior of Prochlorococcus marinus', 'Oceanic', 'Location of Prochlorococcus marinus', '1970-01-01' , 12345 ,'Picture of Prochlorococcus marinus', 'Genus Prochlorococcus', 'Prochlorococcus marinus', 'GN50001'),
('SP50002', 'Characteristics of Nitrosopumilus maritimus', 'Behavior of Nitrosopumilus maritimus', 'Oceanic', 'Location of Nitrosopumilus maritimus', '1970-01-01' , 12345 ,'Picture of Nitrosopumilus maritimus', 'Genus Nitrosopumilus', 'Nitrosopumilus maritimus', 'GN50002'),
('SP50003', 'Characteristics of Vibrio cholerae', 'Behavior of Vibrio cholerae', 'Oceanic', 'Location of Vibrio cholerae', '1970-01-01' , 12345 ,'Picture of Vibrio cholerae', 'Genus Vibrio', 'Vibrio cholerae', 'GN50003'),
('SP50004', 'Characteristics of Francisella tularensis', 'Behavior of Francisella tularensis', 'Grassland', 'Location of Francisella tularensis', '1970-01-01' , 12345 ,'Picture of Francisella tularensis', 'Genus Francisella', 'Francisella tularensis', 'GN50004'),
('SP50005', 'Characteristics of Rhizobium leguminosarum', 'Behavior of Rhizobium leguminosarum', 'Shrubland', 'Location of Rhizobium leguminosarum', '1970-01-01' , 12345 ,'Picture of Rhizobium leguminosarum', 'Genus Rhizobium', 'Rhizobium leguminosarum', 'GN50005'),

--
('SP60000', 'Characteristics of Halobacterium halobium', 'Behavior of Halobacterium halobium', 'Rainforest', 'Location of Halobacterium halobium', '1970-01-01' , 12345 ,'Picture of Halobacterium halobium', 'Genus Halobacterium halobium', 'Halobacterium halobium aurantifolia', 'GN60000'),
('SP60001', 'Characteristics of Methanococcus jannaschii', 'Behavior of Methanococcus jannaschii', 'Oceanic', 'Location of Methanococcus jannaschii', '1970-01-01' , 12345 ,'Picture of Methanococcus jannaschii', 'Genus Methanococcus', 'Methanococcus jannaschii', 'GN60001'),
('SP60002', 'Characteristics of Pyrococcus furiosu', 'Behavior of Pyrococcus furiosu', 'Oceanic', 'Location of Pyrococcus furiosu', '1970-01-01' , 12345 ,'Picture of Pyrococcus furiosu', 'Genus Pyrococcus', 'Pyrococcus furiosu', 'GN60002'),
('SP60003', 'Characteristics of Methanopyrus kandleri', 'Behavior of Methanopyrus kandleri', 'Oceanic', 'Location of Methanopyrus kandleri', '1970-01-01' , 12345 , 'Picture of Methanopyrus kandleri', 'Genus Methanopyrus', 'Methanopyrus kandleri', 'GN60003'),
('SP60004', 'Characteristics of Thermococcus kodakarensis', 'Behavior of Thermococcus kodakarensis', 'Oceanic', 'Location of Thermococcus kodakarensis', '1970-01-01' , 12345 ,'Picture of Thermococcus kodakarensis', 'Genus Thermococcus', 'Thermococcus kodakarensis', 'GN60004'),
('SP60005', 'Characteristics of Nanoarchaeum equitans', 'Behavior of Nanoarchaeum equitans', 'Oceanic', 'Location of Nanoarchaeum equitans', '1970-01-01' , 12345 ,'Picture of Nanoarchaeum equitans', 'Genus Nanoarchaeum', 'Nanoarchaeum equitans', 'GN60005');




-- Konservasi
INSERT INTO Konservasi (ID_Konservasi, Lokasi_Konservasi, Tanggal_pendirian) VALUES
('KS000', 'Lokasi Konservasi 1', '1900-01-01'),
('KS001', 'Lokasi Konservasi 2', '1900-01-01'),
('KS002', 'Lokasi Konservasi 3', '1900-01-01'),
('KS003', 'Lokasi Konservasi 4', '1900-01-01'),
('KS004', 'Lokasi Konservasi 5', '1900-01-01');

-- Status
INSERT INTO Status (ID_Spesies, Indeks_Ancaman, Tanggal_deklarasi) VALUES 
('SP10000', 'Indeks Ancaman Spesies 1', '2001-09-11'),
('SP10001', 'Indeks Ancaman Spesies 2', '2001-09-11'),
('SP10002', 'Indeks Ancaman Spesies 3', '2001-09-11'),
('SP10003', 'Indeks Ancaman Spesies 4', '2001-09-11'),
('SP10004', 'Indeks Ancaman Spesies 5', '2001-09-11'),
('SP20000', 'Indeks Ancaman Spesies 6', '2001-09-11'),
('SP20001', 'Indeks Ancaman Spesies 7', '2001-09-11'),
('SP30000', 'Indeks Ancaman Spesies 8', '2001-09-11'),
('SP30001', 'Indeks Ancaman Spesies 9', '2001-09-11'),
('SP40002', 'Indeks Ancaman Spesies 10', '2001-09-11');


-- Menempati
INSERT INTO Menempati(ID_Spesies, Habitat) VALUES
('SP10000', 'Rainforest'),
('SP10001', 'Temperate Forest'),
('SP10002', 'Taiga'),
('SP10003', 'Tundra'),
('SP10004', 'Shrubland'),
('SP10005', 'Desert'),
('SP10006', 'Grassland'),
('SP10007', 'Lentic'),
('SP10008', 'Littoral'),
('SP10009', 'Lotic');

-- Melindungi
INSERT INTO Melindungi (ID_Konservasi, ID_Spesies) VALUES
('KS000', 'SP10001'),
('KS000', 'SP20001'),
('KS000', 'SP30002'),
('KS001', 'SP20002'),
('KS001', 'SP30001'),
('KS001', 'SP30004'),
('KS002', 'SP30001'),
('KS002', 'SP30002'),
('KS002', 'SP40003'),
('KS003', 'SP40000'),
('KS003', 'SP40002'),
('KS003', 'SP50003'),
('KS004', 'SP40001'),
('KS004', 'SP60002'),
('KS004', 'SP60003');