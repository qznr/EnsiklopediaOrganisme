CREATE TABLE Kingdom
(
  ID_Kingdom VARCHAR(8) NOT NULL,
  Nama_Kingdom VARCHAR(25) NOT NULL,
  Deskripsi_Kingdom VARCHAR(200) NOT NULL,
  Gambar VARCHAR (50),
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
('KD01', 'Animalia' ,'Lorem Ipsum Dolor Sit Amet','img\Placeholder\Card-Placeholder.png'),
('KD02', 'Plantae','Lorem Ipsum Dolor Sit Amet','img\Placeholder\Card-Placeholder.png'),
('KD03', 'Fungi','Lorem Ipsum Dolor Sit Amet','img\Placeholder\Card-Placeholder.png'),
('KD04', 'Protista','Lorem Ipsum Dolor Sit Amet','img\Placeholder\Card-Placeholder.png'),
('KD05', 'Bacteria','Lorem Ipsum Dolor Sit Amet','img\Placeholder\Card-Placeholder.png'),
('KD06', 'Archaea','Lorem Ipsum Dolor Sit Amet','img\Placeholder\Card-Placeholder.png');

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
('FL0000', 'Acanthocephala', 'Characteristics of Acanthocephala phylum', 'Behavior of Acanthocephala phylum', 'KD01'),
('FL0001', 'Acoelomorpha', 'Characteristics of Acoelomorpha phylum', 'Behavior of Acoelomorpha phylum', 'KD01'),
('FL0002', 'Annelida', 'Characteristics of Annelida phylum', 'Behavior of Annelida phylum', 'KD01'),
('FL0003', 'Arthropoda', 'Characteristics of Arthropoda phylum', 'Behavior of Arthropoda phylum', 'KD01'),
('FL0004', 'Brachiopoda', 'Characteristics of Brachiopoda phylum', 'Behavior of Brachiopoda phylum', 'KD01'),
('FL0005', 'Bryozoa', 'Characteristics of Bryozoa phylum', 'Behavior of Bryozoa phylum', 'KD01'),
('FL0006', 'Chaetognatha', 'Characteristics of Chaetognatha phylum', 'Behavior of Chaetognatha phylum', 'KD01'),
('FL0007', 'Chordata', 'Characteristics of Chordata phylum', 'Behavior of Chordata phylum', 'KD01'),
('FL0008', 'Cnidaria', 'Characteristics of Cnidaria phylum', 'Behavior of Cnidaria phylum', 'KD01'),
('FL0009', 'Ctenophora', 'Characteristics of Ctenophora phylum', 'Behavior of Ctenophora phylum', 'KD01'),
('FL0010', 'Cycliophora', 'Characteristics of Cycliophora phylum', 'Behavior of Cycliophora phylum', 'KD01'),
('FL0011', 'Echinodermata', 'Characteristics of Echinodermata phylum', 'Behavior of Echinodermata phylum', 'KD01'),
('FL0012', 'Entoprocta', 'Characteristics of Entoprocta phylum', 'Behavior of Entoprocta phylum', 'KD01'),
('FL0013', 'Gastrotricha', 'Characteristics of Gastrotricha phylum', 'Behavior of Gastrotricha phylum', 'KD01'),
('FL0014', 'Gnathostomulida', 'Characteristics of Gnathostomulida phylum', 'Behavior of Gnathostomulida phylum', 'KD01'),
('FL0015', 'Hemichordata', 'Characteristics of Hemichordata phylum', 'Behavior of Hemichordata phylum', 'KD01'),
('FL0016', 'Kinorhynota', 'Characteristics of Kinorhynota phylum', 'Behavior of Kinorhynota phylum', 'KD01'),
('FL0017', 'Loricifera', 'Characteristics of Loricifera phylum', 'Behavior of Loricifera phylum', 'KD01'),
('FL0018', 'Micrognathozoa', 'Characteristics of Micrognathozoa phylum', 'Behavior of Micrognathozoa phylum', 'KD01'),
('FL0019', 'Mollusca', 'Characteristics of Mollusca phylum', 'Behavior of Mollusca phylum', 'KD01'),
('FL0020', 'Nematoda', 'Characteristics of Nematoda phylum', 'Behavior of Nematoda phylum', 'KD01'),
('FL0021', 'Nematomorpha', 'Characteristics of Nematomorpha phylum', 'Behavior of Nematomorpha phylum', 'KD01'),
('FL0022', 'Nemertea', 'Characteristics of Nemertea phylum', 'Behavior of Nemertea phylum', 'KD01'),
('FL0023', 'Onychophora', 'Characteristics of Onychophora phylum', 'Behavior of Onychophora phylum', 'KD01'),
('FL0024', 'Orthonectida', 'Characteristics of Orthonectida phylum', 'Behavior of Orthonectida phylum', 'KD01'),
('FL0025', 'Phoronida', 'Characteristics of Phoronida phylum', 'Behavior of Phoronida phylum', 'KD01'),
('FL0026', 'Placozoa', 'Characteristics of Placozoa phylum', 'Behavior of Placozoa phylum', 'KD01'),
('FL0027', 'Platyhelmithes', 'Characteristics of Platyhelmithes phylum', 'Behavior of Platyhelmithes phylum', 'KD01'),
('FL0028', 'Porifera', 'Characteristics of Porifera phylum', 'Behavior of Porifera phylum', 'KD01'),
('FL0029', 'Priapulida', 'Characteristics of Priapulida phylum', 'Behavior of Priapulida phylum', 'KD01'),
('FL0030', 'Rhombozoa', 'Characteristics of Rhombozoa phylum', 'Behavior of Rhombozoa phylum', 'KD01'),
('FL0031', 'Rotifera', 'Characteristics of Rotifera phylum', 'Behavior of Rotifera phylum', 'KD01'),
('FL0032', 'Sipuncula', 'Characteristics of Sipuncula phylum', 'Behavior of Sipuncula phylum', 'KD01'),
('FL0033', 'Tardigrada', 'Characteristics of Tardigrada phylum', 'Behavior of Tardigrada phylum', 'KD01'),
('FL0034', 'Xenoturbellida', 'Characteristics of Xenoturbellida phylum', 'Behavior of Xenoturbellida phylum', 'KD01'),

-- Fungi Kingdom
('FL3000', 'Zygomycota', 'Characteristics of Zygomycota', 'Behavior of Zygomycota', 'KD03'),
('FL3001', 'Ascomycota', 'Characteristics of Ascomycota', 'Behavior of Ascomycota', 'KD03'),
('FL3002', 'Basidiomycota', 'Characteristics of Basidiomycota', 'Behavior of Basidiomycota', 'KD03'),
('FL3003', 'Chytridiomycota', 'Characteristics of Chytridiomycota', 'Behavior of Chytridiomycota', 'KD03'),
('FL3004', 'Glomeromycota', 'Characteristics of Glomeromycota', 'Behavior of Glomeromycota', 'KD03'),
('FL3005', 'Neocallimastigomycota', 'Characteristics of Neocallimastigomycota', 'Behavior of Neocallimastigomycota', 'KD03'),

-- Protista Kingdom
('FL4000', 'Amoebozoa', 'Amoebozoa phylum description', 'Behavior of Amoebozoa', 'KD04'),
('FL4001', 'Stramenopiles', 'Stramenopiles phylum description', 'Behavior of Stramenopiles', 'KD04'),
('FL4002', 'Alveolata', 'Alveolata phylum description', 'Behavior of Alveolata', 'KD04'),
('FL4003', 'Rhizaria', 'Rhizaria phylum description', 'Behavior of Rhizaria', 'KD04'),

-- Bacteria Kingdom
('FL5000', 'Firmicutes', 'Firmicutes phylum description', 'Behavior of Firmicutes', 'KD05'),
('FL5001', 'Proteobacteria', 'Proteobacteria phylum description', 'Behavior of Proteobacteria', 'KD05'),
('FL5002', 'Actinobacteria', 'Actinobacteria phylum description', 'Behavior of Actinobacteria', 'KD05'),
('FL5003', 'Bacteroidetes', 'Bacteroidetes phylum description', 'Behavior of Bacteroidetes', 'KD05'),
('FL5004', 'Cyanobacteria', 'Cyanobacteria phylum description', 'Behavior of Cyanobacteria', 'KD05'),
('FL5005', 'Spirochaetes', 'Spirochaetes phylum description', 'Behavior of Spirochaetes', 'KD05'),

-- Archea Kingdom
('FL6000', 'Euryarchaeota', 'Euryarchaeota description', 'Euryarchaeota behavior', 'KD06'),
('FL6001', 'Crenarchaeota', 'Crenarchaeota description', 'Crenarchaeota behavior', 'KD06'),
('FL6002', 'Korarchaeota', 'Korarchaeota description', 'Korarchaeota behavior', 'KD06'),
('FL6003', 'Nanoarchaeota', 'Nanoarchaeota description', 'Nanoarchaeota behavior', 'KD06');

-- Class
INSERT INTO Class (ID_Class, Karakteristik_Class, Perilaku_Class, Nama_latin, ID_Filum, ID_Divisi, ID_Kingdom) VALUES
('CL00000', 'Class characteristics 1', 'Class behavior 1', 'Class Latin Name Acanthocephala', 'FL0000', NULL, 'KD01'),
('CL00001', 'Class characteristics 2', 'Class behavior 2', 'Class Latin Name Acoelomorpha', 'FL0001', NULL, 'KD01'),
('CL00002', 'Class characteristics 3', 'Class behavior 3', 'Class Latin Name Annelida', 'FL0002', NULL, 'KD01'),
('CL00003', 'Class characteristics 4', 'Class behavior 4', 'Class Latin Name Arthropoda', 'FL0003', NULL, 'KD01'),
('CL00004', 'Class characteristics 5', 'Class behavior 5', 'Class Latin Name Brachiopoda', 'FL0004', NULL, 'KD01'),
('CL00005', 'Class characteristics 6', 'Class behavior 6', 'Class Latin Name Bryozoa', 'FL0005', NULL, 'KD01'),
('CL00006', 'Class characteristics 7', 'Class behavior 7', 'Class Latin Name Chaetognatha', 'FL0006', NULL, 'KD01'),
('CL00007', 'Class characteristics 8', 'Class behavior 8', 'Class Latin Name Chordata', 'FL0007', NULL, 'KD01'),
('CL00008', 'Class characteristics 9', 'Class behavior 9', 'Class Latin Name Cnidaria', 'FL0008', NULL, 'KD01'),
('CL00009', 'Class characteristics 10', 'Class behavior 10', 'Class Latin Name Ctenophora', 'FL0009', NULL, 'KD01'),
('CL00010', 'Class characteristics 11', 'Class behavior 11', 'Class Latin Name Cycliophora', 'FL0010', NULL, 'KD01'),
('CL00011', 'Class characteristics 12', 'Class behavior 12', 'Class Latin Name Echinodermata', 'FL0011', NULL, 'KD01'),
('CL00012', 'Class characteristics 13', 'Class behavior 13', 'Class Latin Name Entoprocta', 'FL0012', NULL, 'KD01'),
('CL00013', 'Class characteristics 14', 'Class behavior 14', 'Class Latin Name Gastrotricha', 'FL0013', NULL, 'KD01'),
--
('CL20000', 'Characteristics of Liverworts Class', 'Behavior of Liverworts Class', 'Class Liverworts', NULL, 'DV200', 'KD02'),
('CL20001', 'Characteristics of Hornworts Class', 'Behavior of Hornworts Class', 'Class Hornworts', NULL, 'DV201', 'KD02'),
('CL20002', 'Characteristics of Mosses Class', 'Behavior of Mosses Class', 'Class Mosses', NULL, 'DV202', 'KD02'),
('CL20003', 'Characteristics of Ferns Class', 'Behavior of Ferns Class', 'Class Ferns', NULL, 'DV203', 'KD02'),
('CL20004', 'Characteristics of Horsetails Class', 'Behavior of Horsetails Class', 'Class Horsetails', NULL, 'DV204', 'KD02'),
('CL20005', 'Characteristics of Cycads Class', 'Behavior of Cycads Class', 'Class Cycads', NULL, 'DV205', 'KD02'),
('CL20006', 'Characteristics of Ginkgos Class', 'Behavior of Ginkgos Class', 'Class Ginkgos', NULL, 'DV206', 'KD02'),
('CL20007', 'Characteristics of Conifers Class', 'Behavior of Conifers Class', 'Class Conifers', NULL, 'DV207', 'KD02'),
('CL20008', 'Characteristics of Gnetophytes Class', 'Behavior of Gnetophytes Class', 'Class Gnetophytes', NULL, 'DV208', 'KD02'),
('CL20009', 'Characteristics of Flowering Plants Class', 'Behavior of Flowering Plants Class', 'Class Flowering Plants', NULL, 'DV209', 'KD02'),

--
('CL30000', 'Characteristics of Class 1', 'Behavior of Class 1', 'Class Latin Name Zygomycota', 'FL3000', NULL, 'KD03'),
('CL30001', 'Characteristics of Class 2', 'Behavior of Class 2', 'Class Latin Name Ascomycota', 'FL3001', NULL, 'KD03'),
('CL30002', 'Characteristics of Class 3', 'Behavior of Class 3', 'Class Latin Name Basidiomycota', 'FL3002', NULL, 'KD03'),
('CL30003', 'Characteristics of Class 4', 'Behavior of Class 4', 'Class Latin Name Chytridiomycota', 'FL3003', NULL, 'KD03'),
('CL30004', 'Characteristics of Class 5', 'Behavior of Class 5', 'Class Latin Name Glomeromycota', 'FL3004', NULL, 'KD03'),
('CL30005', 'Characteristics of Class 6', 'Behavior of Class 6', 'Class Latin Name Neocallimastigomycota', 'FL3005', NULL, 'KD03'),

--
('CL40000', 'Characteristics of Class 1', 'Behavior of Class 1', 'Class Latin Name Amoebozoa', 'FL4000', NULL, 'KD04'),
('CL40001', 'Characteristics of Class 2', 'Behavior of Class 2', 'Class Latin Name Stramenopiles', 'FL4000', NULL, 'KD04'),
('CL40002', 'Characteristics of Class 3', 'Behavior of Class 3', 'Class Latin Name Alveolata', 'FL4001', NULL, 'KD04'),
('CL40003', 'Characteristics of Class 4', 'Behavior of Class 4', 'Class Latin Name Rhizaria', 'FL4001', NULL, 'KD04'),

--
('CL50000', 'Characteristics of Class 1', 'Behavior of Class 1', 'Class Latin Name Firmicutes', 'FL5000', NULL, 'KD05'),
('CL50001', 'Characteristics of Class 2', 'Behavior of Class 2', 'Class Latin Name Proteobacteria', 'FL5000', NULL, 'KD05'),
('CL50002', 'Characteristics of Class 3', 'Behavior of Class 3', 'Class Latin Name Actinobacteria', 'FL5001', NULL, 'KD05'),
('CL50003', 'Characteristics of Class 4', 'Behavior of Class 4', 'Class Latin Name Bacteroidetes', 'FL5001', NULL, 'KD05'),
('CL50004', 'Characteristics of Class 5', 'Behavior of Class 5', 'Class Latin Name Cyanobacteria', 'FL5002', NULL, 'KD05'),
('CL50005', 'Characteristics of Class 6', 'Behavior of Class 6', 'Class Latin Name Spirochaetes', 'FL5002', NULL, 'KD05'),

--
('CL60000', 'Class 1 characteristics', 'Class 1 behavior', 'Class Latin Name Euryarchaeota', 'FL6000', NULL, 'KD06'),
('CL60001', 'Class 2 characteristics', 'Class 2 behavior', 'Class Latin Name Crenarchaeota', 'FL6001', NULL, 'KD06'),
('CL60002', 'Class 3 characteristics', 'Class 3 behavior', 'Class Latin Name Korarchaeota', 'FL6002', NULL, 'KD06'),
('CL60003', 'Class 4 characteristics', 'Class 4 behavior', 'Class Latin Name Nanoarchaeota', 'FL6003', NULL, 'KD06');



-- Ordo 
INSERT INTO Ordo (ID_Order, Karakteristik_Order, Perilaku_Order, Nama_latin, ID_Class) VALUES
('OD00000', 'Order 1 characteristics', 'Order 1 behavior', 'Ordo Latin 1', 'CL00000'),
('OD00001', 'Order 2 characteristics', 'Order 2 behavior', 'Ordo Latin 2', 'CL00000'),
('OD00002', 'Order 3 characteristics', 'Order 3 behavior', 'Ordo Latin 3', 'CL00001'),
('OD00003', 'Order 4 characteristics', 'Order 4 behavior', 'Ordo Latin 4', 'CL00001'),
('OD00004', 'Order 5 characteristics', 'Order 5 behavior', 'Ordo Latin 5', 'CL00002'),
('OD00005', 'Order 6 characteristics', 'Order 6 behavior', 'Ordo Latin 6', 'CL00002'),
('OD00006', 'Order 7 characteristics', 'Order 7 behavior', 'Ordo Latin 7', 'CL00003'),
('OD00007', 'Order 8 characteristics', 'Order 8 behavior', 'Ordo Latin 8', 'CL00003'),
('OD00008', 'Order 9 characteristics', 'Order 9 behavior', 'Ordo Latin 9', 'CL00004'),
('OD00009', 'Order 10 characteristics', 'Order 10 behavior', 'Ordo Latin 10', 'CL00004'),
('OD00010', 'Order 11 characteristics', 'Order 11 behavior', 'Ordo Latin 11', 'CL00005'),
('OD00011', 'Order 12 characteristics', 'Order 12 behavior', 'Ordo Latin 12', 'CL00005'),
('OD00012', 'Order 13 characteristics', 'Order 13 behavior', 'Ordo Latin 13', 'CL00006'),
('OD00013', 'Order 14 characteristics', 'Order 14 behavior', 'Ordo Latin 14', 'CL00006'), 

--
('OD20000', 'Order 1 characteristics', 'Order 1 behavior', 'Ordo1', 'CL20000'),
('OD20001', 'Order 2 characteristics', 'Order 2 behavior', 'Ordo2', 'CL20000'),
('OD20002', 'Order 3 characteristics', 'Order 3 behavior', 'Ordo3', 'CL20001'),
('OD20003', 'Order 4 characteristics', 'Order 4 behavior', 'Ordo4', 'CL20001'),
('OD20004', 'Order 5 characteristics', 'Order 5 behavior', 'Ordo5', 'CL20002'),

--
('OD30000', 'Order 1 characteristics', 'Order 1 behavior', 'Ordo1 Latin', 'CL30000'),
('OD30001', 'Order 2 characteristics', 'Order 2 behavior', 'Ordo2 Latin', 'CL30000'),
('OD30002', 'Order 3 characteristics', 'Order 3 behavior', 'Ordo3 Latin', 'CL30001'),
('OD30003', 'Order 4 characteristics', 'Order 4 behavior', 'Ordo4 Latin', 'CL30001'),
('OD30004', 'Order 5 characteristics', 'Order 5 behavior', 'Ordo5 Latin', 'CL30002'),

--
('OD40000', 'Order 1 characteristics', 'Order 1 behavior', 'Ordo Latin Name 1', 'CL40000'),
('OD40001', 'Order 2 characteristics', 'Order 2 behavior', 'Ordo Latin Name 2', 'CL40000'),
('OD40002', 'Order 3 characteristics', 'Order 3 behavior', 'Ordo Latin Name 3', 'CL40001'),
('OD40003', 'Order 4 characteristics', 'Order 4 behavior', 'Ordo Latin Name 4', 'CL40001'),
('OD40004', 'Order 5 characteristics', 'Order 5 behavior', 'Ordo Latin Name 5', 'CL40002'),

--
('OD50000', 'Order 1 characteristics', 'Order 1 behavior', 'Ordo_Latin Name 1', 'CL50000'),
('OD50001', 'Order 2 characteristics', 'Order 2 behavior', 'Ordo_Latin Name 2', 'CL50000'),
('OD50002', 'Order 3 characteristics', 'Order 3 behavior', 'Ordo_Latin Name 3', 'CL50001'),
('OD50003', 'Order 4 characteristics', 'Order 4 behavior', 'Ordo_Latin Name 4', 'CL50001'),
('OD50004', 'Order 5 characteristics', 'Order 5 behavior', 'Ordo_Latin Name 5', 'CL50002'),

--
('OD60000', 'Order 1 characteristics', 'Order 1 behavior', 'Ordo_Latin_Name 1', 'CL60000'),
('OD60001', 'Order 2 characteristics', 'Order 2 behavior', 'Ordo_Latin_Name 2', 'CL60000'),
('OD60002', 'Order 3 characteristics', 'Order 3 behavior', 'Ordo_Latin_Name 3', 'CL60001'),
('OD60003', 'Order 4 characteristics', 'Order 4 behavior', 'Ordo_Latin_Name 4', 'CL60001'),
('OD60004', 'Order 5 characteristics', 'Order 5 behavior', 'Ordo_Latin_Name 5', 'CL60002');


-- Family
INSERT INTO Family (ID_Family, Karakteristik_Family, Perilaku_Family, Nama_latin, ID_Order) VALUES 
('FM00000', 'Family 1 characteristics', 'Family 1 behavior', 'Family Latin 1', 'OD00000'),
('FM00001', 'Family 2 characteristics', 'Family 2 behavior', 'Family Latin 2', 'OD00000'),
('FM00002', 'Family 3 characteristics', 'Family 3 behavior', 'Family Latin 3', 'OD00001'),
('FM00003', 'Family 4 characteristics', 'Family 4 behavior', 'Family Latin 4', 'OD00001'),
('FM00004', 'Family 5 characteristics', 'Family 5 behavior', 'Family Latin 5', 'OD00002'),
('FM00005', 'Family 6 characteristics', 'Family 6 behavior', 'Family Latin 6', 'OD00002'),
('FM00006', 'Family 7 characteristics', 'Family 7 behavior', 'Family Latin 7', 'OD00003'),
('FM00007', 'Family 8 characteristics', 'Family 8 behavior', 'Family Latin 8', 'OD00003'),
('FM00008', 'Family 9 characteristics', 'Family 9 behavior', 'Family Latin 9', 'OD00004'),
('FM00009', 'Family 10 characteristics', 'Family 10 behavior', 'Family Latin 10', 'OD00004'),

--
('FM20000', 'Family 1 characteristics', 'Family 1 behavior', 'Family1 Latin', 'OD30000'),
('FM20001', 'Family 2 characteristics', 'Family 2 behavior', 'Family2 Latin', 'OD30000'),
('FM20002', 'Family 3 characteristics', 'Family 3 behavior', 'Family3 Latin', 'OD30001'),
('FM20003', 'Family 4 characteristics', 'Family 4 behavior', 'Family4 Latin', 'OD30001'),
('FM20004', 'Family 5 characteristics', 'Family 5 behavior', 'Family5 Latin', 'OD30002'),

--
('FM30000', 'Family 1 characteristics', 'Family 1 behavior', 'Family Latin Name 1', 'OD40000'),
('FM30001', 'Family 2 characteristics', 'Family 2 behavior', 'Family Latin Name 2', 'OD40000'),
('FM30002', 'Family 3 characteristics', 'Family 3 behavior', 'Family Latin Name 3', 'OD40001'),
('FM30003', 'Family 4 characteristics', 'Family 4 behavior', 'Family Latin Name 4', 'OD40001'),
('FM30004', 'Family 5 characteristics', 'Family 5 behavior', 'Family Latin Name 5', 'OD40002'),

--
('FM40000', 'Family 1 characteristics', 'Family 1 behavior', 'Family_Latin Name 1', 'OD50000'),
('FM40001', 'Family 2 characteristics', 'Family 2 behavior', 'Family_Latin Name 2', 'OD50000'),
('FM40002', 'Family 3 characteristics', 'Family 3 behavior', 'Family_Latin Name 3', 'OD50001'),
('FM40003', 'Family 4 characteristics', 'Family 4 behavior', 'Family_Latin Name 4', 'OD50001'),
('FM40004', 'Family 5 characteristics', 'Family 5 behavior', 'Family_Latin Name 5', 'OD50002'),

--
('FM50000', 'Family 1 characteristics', 'Family 1 behavior', 'Family_Latin_Name 1', 'OD60000'),
('FM50001', 'Family 2 characteristics', 'Family 2 behavior', 'Family_Latin_Name 2', 'OD60000'),
('FM50002', 'Family 3 characteristics', 'Family 3 behavior', 'Family_Latin_Name 3', 'OD60001'),
('FM50003', 'Family 4 characteristics', 'Family 4 behavior', 'Family_Latin_Name 4', 'OD60001'),
('FM50004', 'Family 5 characteristics', 'Family 5 behavior', 'Family_Latin_Name 5', 'OD60002'),

--
('FM60000', 'Family 1 characteristics', 'Family 1 behavior', 'Family1', 'OD60000'),
('FM60001', 'Family 2 characteristics', 'Family 2 behavior', 'Family2', 'OD60000'),
('FM60002', 'Family 3 characteristics', 'Family 3 behavior', 'Family3', 'OD60001'),
('FM60003', 'Family 4 characteristics', 'Family 4 behavior', 'Family4', 'OD60001'),
('FM60004', 'Family 5 characteristics', 'Family 5 behavior', 'Family5', 'OD60002');


-- Genus 
INSERT INTO Genus (ID_Genus, Perilaku_Genus, Karakteristik__Genus, Habitat_Genus, Nama_latin, ID_Family) VALUES
('GN00000', 'Genus 1 characteristics', 'Genus 1 behavior', 'Genus Rainforest','Genus Latin 1', 'FM00000'),
('GN00001', 'Genus 2 characteristics', 'Genus 2 behavior', 'Genus Temperate Forest','Genus Latin 2', 'FM00000'),
('GN00002', 'Genus 3 characteristics', 'Genus 3 behavior', 'Genus Taiga','Genus Latin 3', 'FM00001'),
('GN00003', 'Genus 4 characteristics', 'Genus 4 behavior', 'Genus Tundra','Genus Latin 4', 'FM00001'),
('GN00004', 'Genus 5 characteristics', 'Genus 5 behavior', 'Genus Shrubland','Genus Latin 5', 'FM00002'),
('GN00005', 'Genus 6 characteristics', 'Genus 6 behavior', 'Genus Desert','Genus Latin 6', 'FM00002'),
('GN00006', 'Genus 7 characteristics', 'Genus 7 behavior', 'Genus Grassland','Genus Latin 7', 'FM00003'),
('GN00007', 'Genus 8 characteristics', 'Genus 8 behavior', 'Genus Lentic','Genus Latin 8', 'FM00003'),
('GN00008', 'Genus 9 characteristics', 'Genus 9 behavior', 'Genus Littoral','Genus Latin 9', 'FM00004'),
('GN00009', 'Genus 10 characteristics', 'Genus 10 behavior', 'Genus Lotic', 'Genus Latin 10', 'FM00004'),

--
('GN20000', 'Genus 1 characteristics', 'Genus 1 behavior', 'Genus Rainforest','Genus1', 'FM20000'),
('GN20001', 'Genus 2 characteristics', 'Genus 2 behavior', 'Genus Temperate Forest','Genus2', 'FM20000'),
('GN20002', 'Genus 3 characteristics', 'Genus 3 behavior', 'Genus Taiga','Genus3', 'FM20001'),
('GN20003', 'Genus 4 characteristics', 'Genus 4 behavior', 'Genus Tundra','Genus4', 'FM20001'),
('GN20004', 'Genus 5 characteristics', 'Genus 5 behavior', 'Genus Shrubland','Genus5', 'FM20002'),
('GN20005', 'Genus 6 characteristics', 'Genus 6 behavior', 'Genus Desert','Genus6', 'FM20002'),

--
('GN30000', 'Genus 1 characteristics', 'Genus 1 behavior', 'Genus Rainforest','Genus1 Latin', 'FM30000'),
('GN30001', 'Genus 2 characteristics', 'Genus 2 behavior', 'Genus Temperate Forest','Genus2 Latin', 'FM30000'),
('GN30002', 'Genus 3 characteristics', 'Genus 3 behavior', 'Genus Taiga','Genus3 Latin', 'FM30001'),
('GN30003', 'Genus 4 characteristics', 'Genus 4 behavior', 'Genus Tundra','Genus4 Latin', 'FM30001'),
('GN30004', 'Genus 5 characteristics', 'Genus 5 behavior', 'Genus Shrubland','Genus5 Latin', 'FM30002'),
('GN30005', 'Genus 6 characteristics', 'Genus 6 behavior', 'Genus Desert','Genus6 Latin', 'FM30002'),

--
('GN40000', 'Genus 1 characteristics', 'Genus 1 behavior', 'Genus Rainforest','Genus Latin Name 1 ', 'FM40000'),
('GN40001', 'Genus 2 characteristics', 'Genus 2 behavior', 'Genus Temperate Forest','Genus Latin Name 2 ', 'FM40000'),
('GN40002', 'Genus 3 characteristics', 'Genus 3 behavior', 'Genus Taiga','Genus Latin Name 3 ', 'FM40001'),
('GN40003', 'Genus 4 characteristics', 'Genus 4 behavior', 'Genus Tundra','Genus Latin Name 4 ', 'FM40001'),
('GN40004', 'Genus 5 characteristics', 'Genus 5 behavior', 'Genus Shrubland','Genus Latin Name 5 ', 'FM40002'),
('GN40005', 'Genus 6 characteristics', 'Genus 6 behavior', 'Genus Desert','Genus Latin Name 6 ', 'FM40002'),

--
('GN50000', 'Genus 1 characteristics', 'Genus 1 behavior', 'Genus Rainforest','Genus_Latin Name 1 ', 'FM50000'),
('GN50001', 'Genus 2 characteristics', 'Genus 2 behavior', 'Genus Temperate Forest','Genus_Latin Name 2 ', 'FM50000'),
('GN50002', 'Genus 3 characteristics', 'Genus 3 behavior', 'Genus Taiga','Genus_Latin Name 3 ', 'FM50001'),
('GN50003', 'Genus 4 characteristics', 'Genus 4 behavior', 'Genus Tundra','Genus_Latin Name 4 ', 'FM50001'),
('GN50004', 'Genus 5 characteristics', 'Genus 5 behavior', 'Genus Shrubland','Genus_Latin Name 5 ', 'FM50002'),
('GN50005', 'Genus 6 characteristics', 'Genus 6 behavior', 'Genus Desert','Genus_Latin Name 6 ', 'FM50002'),
--
('GN60000', 'Genus 1 characteristics', 'Genus 1 behavior', 'Genus Rainforest','Genus_Latin_Name 1 ', 'FM60000'),
('GN60001', 'Genus 2 characteristics', 'Genus 2 behavior', 'Genus Temperate Forest','Genus_Latin_Name 2 ', 'FM60000'),
('GN60002', 'Genus 3 characteristics', 'Genus 3 behavior', 'Genus Taiga','Genus_Latin_Name 3 ', 'FM60001'),
('GN60003', 'Genus 4 characteristics', 'Genus 4 behavior', 'Genus Tundra','Genus_Latin_Name 4 ', 'FM60001'),
('GN60004', 'Genus 5 characteristics', 'Genus 5 behavior', 'Genus Shrubland','Genus_Latin_Name 5 ', 'FM60002'),
('GN60005', 'Genus 6 characteristics', 'Genus 6 behavior', 'Genus Desert','Genus_Latin_Name 6 ', 'FM60002');

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
('Oceanic', 'Deskrispsi Habitat Oceanic');


-- Spesies
INSERT INTO Spesies (ID_Spesies, Karakteristik_Spesies, Perilaku_Spesies, Habitat, Lokasi_Spesies, Tahun_identifikasi, Populasi, Gambar_Spesies, Genus, Spesies, ID_Genus) VALUES
('SP00000', 'Spesies 1 characteristics', 'Spesies 1 behavior', 'Rainforest', 'Lokasi spesies 1', '1970-01-01' , 12345 , 'Gambar spesies 1', 'Genus Latin 1', 'Spesies Latin 1', 'GN00000'),
('SP00001', 'Spesies 2 characteristics', 'Spesies 2 behavior', 'Temperate Forest', 'Lokasi spesies 2', '1970-01-01' , 12345 ,  'Gambar spesies 2', 'Genus Latin 1', 'Spesies Latin 2', 'GN00000'),
('SP00002', 'Spesies 3 characteristics', 'Spesies 3 behavior', 'Taiga', 'Lokasi spesies 3', '1970-01-01' , 12345 , 'Gambar spesies 3', 'Genus Latin 2', 'Spesies Latin 3', 'GN00001'),
('SP00003', 'Spesies 4 characteristics', 'Spesies 4 behavior', 'Tundra', 'Lokasi spesies 4', '1970-01-01' , 12345 , 'Gambar spesies 4', 'Genus Latin 2', 'Spesies Latin 4', 'GN00001'),
('SP00004', 'Spesies 5 characteristics', 'Spesies 5 behavior', 'Shrubland', 'Lokasi spesies 5', '1970-01-01' , 12345 , 'Gambar spesies 5', 'Genus Latin 3', 'Spesies Latin 5', 'GN00002'),
('SP00005', 'Spesies 6 characteristics', 'Spesies 6 behavior', 'Desert', 'Lokasi spesies 6', '1970-01-01' , 12345 , 'Gambar spesies 6', 'Genus Latin 3', 'Spesies Latin 6', 'GN00002'),
('SP00006', 'Spesies 7 characteristics', 'Spesies 7 behavior', 'Grassland', 'Lokasi spesies 7', '1970-01-01' , 12345 ,  'Gambar spesies 7', 'Genus Latin 4', 'Spesies Latin 7', 'GN00003'),
('SP00007', 'Spesies 8 characteristics', 'Spesies 8 behavior', 'Lentic', 'Lokasi spesies 8', '1970-01-01' , 12345 ,  'Gambar spesies 8', 'Genus Latin 4', 'Spesies Latin 8', 'GN00003'),
('SP00008', 'Spesies 9 characteristics', 'Spesies 9 behavior', 'Littoral', 'Lokasi spesies 9', '1970-01-01' , 12345 , 'Gambar spesies 9', 'Genus Latin 5', 'Spesies Latin 9', 'GN00004'),
('SP00009', 'Spesies 10 characteristics', 'Spesies 10 behavior', 'Lotic', 'Lokasi spesies 10', '1970-01-01' , 12345 ,  'Gambar spesies 10', 'Genus Latin 5', 'Spesies Latin 10', 'GN00004'),

--
('SP20000', 'Spesies 1 characteristics', 'Spesies 1 behavior', 'Rainforest', 'Lokasi spesies 1', '1970-01-01' , 12345 , 'Gambar spesies 1', 'Genus1', 'Spesies1', 'GN20000'),
('SP20001', 'Spesies 2 characteristics', 'Spesies 2 behavior', 'Temperate Forest', 'Lokasi spesies 2', '1970-01-01' , 12345 ,'Gambar spesies 2', 'Genus1', 'Spesies2', 'GN20000'),
('SP20002', 'Spesies 3 characteristics', 'Spesies 3 behavior', 'Taiga', 'Lokasi spesies 3', '1970-01-01' , 12345 ,'Gambar spesies 3', 'Genus2', 'Spesies3', 'GN20001'),
('SP20003', 'Spesies 4 characteristics', 'Spesies 4 behavior', 'Tundra', 'Lokasi spesies 4', '1970-01-01' , 12345 ,'Gambar spesies 4', 'Genus2', 'Spesies4', 'GN20001'),
('SP20004', 'Spesies 5 characteristics', 'Spesies 5 behavior', 'Shrubland', 'Lokasi spesies 5', '1970-01-01' , 12345 ,'Gambar spesies 5', 'Genus3', 'Spesies5', 'GN20002'),
('SP20005', 'Spesies 6 characteristics', 'Spesies 6 behavior', 'Desert', 'Lokasi spesies 6', '1970-01-01' , 12345 ,'Gambar spesies 6', 'Genus3', 'Spesies6', 'GN20002'),

--
('SP30000', 'Spesies 1 characteristics', 'Spesies 1 behavior', 'Rainforest', 'Lokasi spesies 1', '1970-01-01' , 12345 ,'Gambar spesies 1', 'Genus1 Latin', 'Spesies1 Latin', 'GN30000'),
('SP30001', 'Spesies 2 characteristics', 'Spesies 2 behavior', 'Temperate Forest', 'Lokasi spesies 2', '1970-01-01' , 12345 ,'Gambar spesies 2', 'Genus1 Latin', 'Spesies2 Latin', 'GN30000'),
('SP30002', 'Spesies 3 characteristics', 'Spesies 3 behavior', 'Taiga', 'Lokasi spesies 3', '1970-01-01' , 12345 ,'Gambar spesies 3', 'Genus2 Latin', 'Spesies3 Latin', 'GN30001'),
('SP30003', 'Spesies 4 characteristics', 'Spesies 4 behavior', 'Tundra', 'Lokasi spesies 4', '1970-01-01' , 12345 ,'Gambar spesies 4', 'Genus2 Latin', 'Spesies4 Latin', 'GN30001'),
('SP30004', 'Spesies 5 characteristics', 'Spesies 5 behavior', 'Shrubland', 'Lokasi spesies 5', '1970-01-01' , 12345 ,'Gambar spesies 5', 'Genus3 Latin', 'Spesies5 Latin', 'GN30002'),
('SP30005', 'Spesies 6 characteristics', 'Spesies 6 behavior', 'Desert', 'Lokasi spesies 6', '1970-01-01' , 12345 ,'Gambar spesies 6', 'Genus3 Latin', 'Spesies6 Latin', 'GN30002'),

--
('SP40000', 'Spesies 1 characteristics', 'Spesies 1 behavior', 'Rainforest', 'Lokasi spesies 1', '1970-01-01' , 12345 ,'Gambar spesies 1', 'Genus Latin Name 1', 'Spesies Latin Name 1', 'GN40000'),
('SP40001', 'Spesies 2 characteristics', 'Spesies 2 behavior', 'Temperate Forest', 'Lokasi spesies 2', '1970-01-01' , 12345 ,'Gambar spesies 2', 'Genus Latin Name 1', 'Spesies Latin Name 2', 'GN40000'),
('SP40002', 'Spesies 3 characteristics', 'Spesies 3 behavior', 'Taiga', 'Lokasi spesies 3', '1970-01-01' , 12345 ,'Gambar spesies 3', 'Genus Latin Name 2', 'Spesies Latin Name 3', 'GN40001'),
('SP40003', 'Spesies 4 characteristics', 'Spesies 4 behavior', 'Tundra', 'Lokasi spesies 4', '1970-01-01' , 12345 ,'Gambar spesies 4', 'Genus Latin Name 2', 'Spesies Latin Name 4', 'GN40001'),
('SP40004', 'Spesies 5 characteristics', 'Spesies 5 behavior', 'Shrubland', 'Lokasi spesies 5', '1970-01-01' , 12345 ,'Gambar spesies 5', 'Genus Latin Name 3', 'Spesies Latin Name 5', 'GN40002'),
('SP40005', 'Spesies 6 characteristics', 'Spesies 6 behavior', 'Desert', 'Lokasi spesies 6', '1970-01-01' , 12345 ,'Gambar spesies 6', 'Genus Latin Name 3', 'Spesies Latin Name 6', 'GN40002'),

--
('SP50000', 'Spesies 1 characteristics', 'Spesies 1 behavior', 'Rainforest', 'Lokasi spesies 1', '1970-01-01' , 12345 ,'Gambar spesies 1', 'Genus_Latin Name 1', 'Spesies_Latin Name 1', 'GN50000'),
('SP50001', 'Spesies 2 characteristics', 'Spesies 2 behavior', 'Temperate Forest', 'Lokasi spesies 2', '1970-01-01' , 12345 ,'Gambar spesies 2', 'Genus_Latin Name 1', 'Spesies_Latin Name 2', 'GN50000'),
('SP50002', 'Spesies 3 characteristics', 'Spesies 3 behavior', 'Taiga', 'Lokasi spesies 3', '1970-01-01' , 12345 ,'Gambar spesies 3', 'Genus_Latin Name 2', 'Spesies_Latin Name 3', 'GN50001'),
('SP50003', 'Spesies 4 characteristics', 'Spesies 4 behavior', 'Tundra', 'Lokasi spesies 4', '1970-01-01' , 12345 ,'Gambar spesies 4', 'Genus_Latin Name 2', 'Spesies_Latin Name 4', 'GN50001'),
('SP50004', 'Spesies 5 characteristics', 'Spesies 5 behavior', 'Shrubland', 'Lokasi spesies 5', '1970-01-01' , 12345 ,'Gambar spesies 5', 'Genus_Latin Name 3', 'Spesies_Latin Name 5', 'GN50002'),
('SP50005', 'Spesies 6 characteristics', 'Spesies 6 behavior', 'Desert', 'Lokasi spesies 6', '1970-01-01' , 12345 ,'Gambar spesies 6', 'Genus_Latin Name 3', 'Spesies_Latin Name 6', 'GN50002'),

--
('SP60000', 'Spesies 1 characteristics', 'Spesies 1 behavior', 'Rainforest', 'Lokasi spesies 1', '1970-01-01' , 12345 ,'Gambar spesies 1', 'Genus_Latin_Name 1', 'Spesies_Latin_Name 1', 'GN60000'),
('SP60001', 'Spesies 2 characteristics', 'Spesies 2 behavior', 'Temperate Forest', 'Lokasi spesies 2', '1970-01-01' , 12345 ,'Gambar spesies 2', 'Genus_Latin_Name 1', 'Spesies_Latin_Name 2', 'GN60000'),
('SP60002', 'Spesies 3 characteristics', 'Spesies 3 behavior', 'Taiga', 'Lokasi spesies 3', '1970-01-01' , 12345 ,'Gambar spesies 3', 'Genus_Latin_Name 2', 'Spesies_Latin_Name 3', 'GN60001'),
('SP60003', 'Spesies 4 characteristics', 'Spesies 4 behavior', 'Tundra', 'Lokasi spesies 4', '1970-01-01' , 12345 , 'Gambar spesies 4', 'Genus_Latin_Name 2', 'Spesies_Latin_Name 4', 'GN60001'),
('SP60004', 'Spesies 5 characteristics', 'Spesies 5 behavior', 'Shrubland', 'Lokasi spesies 5', '1970-01-01' , 12345 ,'Gambar spesies 5', 'Genus_Latin_Name 3', 'Spesies_Latin_Name 5', 'GN60002'),
('SP60005', 'Spesies 6 characteristics', 'Spesies 6 behavior', 'Desert', 'Lokasi spesies 6', '1970-01-01' , 12345 ,'Gambar spesies 6', 'Genus_Latin_Name 3', 'Spesies_Latin_Name 6', 'GN60002');




-- Konservasi
INSERT INTO Konservasi (ID_Konservasi, Lokasi_Konservasi, Tanggal_pendirian) VALUES
('KS000', 'Lokasi Konservasi 1', '1900-01-01'),
('KS001', 'Lokasi Konservasi 2', '1900-01-01'),
('KS002', 'Lokasi Konservasi 3', '1900-01-01'),
('KS003', 'Lokasi Konservasi 4', '1900-01-01'),
('KS004', 'Lokasi Konservasi 5', '1900-01-01');

-- Status
INSERT INTO Status (ID_Spesies, Indeks_Ancaman, Tanggal_deklarasi) VALUES 
('SP00000', 'Indeks Ancaman Spesies 1', '2001-09-11'),
('SP00001', 'Indeks Ancaman Spesies 2', '2001-09-11'),
('SP00002', 'Indeks Ancaman Spesies 3', '2001-09-11'),
('SP00003', 'Indeks Ancaman Spesies 4', '2001-09-11'),
('SP00004', 'Indeks Ancaman Spesies 5', '2001-09-11'),
('SP20000', 'Indeks Ancaman Spesies 6', '2001-09-11'),
('SP20001', 'Indeks Ancaman Spesies 7', '2001-09-11'),
('SP30000', 'Indeks Ancaman Spesies 8', '2001-09-11'),
('SP30001', 'Indeks Ancaman Spesies 9', '2001-09-11'),
('SP40002', 'Indeks Ancaman Spesies 10', '2001-09-11');


-- Menempati
INSERT INTO Menempati(ID_Spesies, Habitat) VALUES
('SP00000', 'Rainforest'),
('SP00001', 'Temperate Forest'),
('SP00002', 'Taiga'),
('SP00003', 'Tundra'),
('SP00004', 'Shrubland'),
('SP20000', 'Desert'),
('SP20001', 'Grassland'),
('SP30000', 'Lentic'),
('SP30001', 'Littoral'),
('SP40002', 'Lotic');

-- Melindungi
INSERT INTO Melindungi (ID_Konservasi, ID_Spesies) VALUES
('KS000', 'SP00001'),
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