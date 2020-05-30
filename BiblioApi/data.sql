USE biblio;

Insert into biblio.pays (nom) VALUES ('Belgique'), ('France'),('Angleterre'), ('USA');


Insert into biblio.adresse (rue, numero, cp, localite, id_pays) VALUES
('chemin vert', 68,'6120','Nalinnes',(select id_pays from biblio.pays where nom='Belgique')),
('rue de mencon', 4, N'à', 'bruti', (select id_pays from biblio.pays where nom='Belgique')),
('rue leopold',7,'6000','Charleroi',(select id_pays from biblio.pays where nom='Belgique')),
('Avenue grand',9,'6001','marcinelle',(select id_pays from biblio.pays where nom='Belgique')),
('rue des sapins', 18, '71270', N'mâcon', (select id_pays from biblio.pays where nom='France')),
('chemin vert', 8,'6120','Nalinnes',(select id_pays from biblio.pays where nom='Belgique')),
('rue de mencon', 12, N'à', 'bruti', (select id_pays from biblio.pays where nom='Belgique')),
('rue leopold',17,'6000','Charleroi',(select id_pays from biblio.pays where nom='Belgique')),
('Avenue grand',19,'6001','marcinelle',(select id_pays from biblio.pays where nom='Belgique')),
('rue des sapins', 108, '71270', N'mâcon', (select id_pays from biblio.pays where nom='France'));

Insert into biblio.adresse (rue, numero, cp, localite, id_pays) VALUES
('rue des monts', 6,'6120','Nalinnes',(select id_pays from biblio.pays where nom='Belgique'));
Insert into biblio.adresse (rue, numero, cp, localite, id_pays) VALUES
('place des haies', 16,'6120','Nalinnes',(select id_pays from biblio.pays where nom='Belgique'));
Insert into biblio.adresse (rue, numero, cp, localite, id_pays) VALUES
('place du bultia', 17,'6120','Nalinnes',(select id_pays from biblio.pays where nom='Belgique'));



insert into biblio.genre (nom) VALUES (N'littérature'),('jeunesse'),('educatif'),('loisir'),('science'),('langue'),(N'santé'),('arts');

insert into biblio.auteur (nom, prenom, pseudo, id_pays) VALUES
('Lonchamp','Jacques',null,(select id_pays from biblio.pays where nom='France')),
('Richardson','Chris',null,(select id_pays from biblio.pays where nom='USA')),
('King','Stephen',null,(select id_pays from biblio.pays where nom='USA')),
('de saint-Exupery','Antoine',null,(select id_pays from biblio.pays where nom='France')),
('Poquelin','jean-baptiste', N'Molière',(select id_pays from biblio.pays where nom='France')),
('Wohlleben','Peter',null,(select id_pays from biblio.pays where nom='France')),
('Collectif',null,null,(select id_pays from biblio.pays where nom='France')),
('Gillet','Christophe',null,(select id_pays from biblio.pays where nom='Belgique')),
('Thomas','Isabelle',null,(select id_pays from biblio.pays where nom='Belgique')),
('Bourbeau','Lise',null,(select id_pays from biblio.pays where nom='France')),
('De Prelle','Aude',null,(select id_pays from biblio.pays where nom='France')),
('De Prelle','Olivia',null,(select id_pays from biblio.pays where nom='France'));

insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES ('Le petit prince', null, 'Le narrateur est un aviateur ' +
                                 N'qui, à la suite d''une panne de moteur, a dû se poser en catastrophe dans le désert du Sahara et tente seul de réparer son avion.
                                 Le lendemain de son atterrissage forcé, il est réveillé par une petite voix qui lui demande : « S''il vous plaît… dessine-moi un mouton ! » ',
        (select id_genre from biblio.genre where nom= N'littérature'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES ('Microservices Pattern', null,
        'Microservices Patterns teaches enterprise developers and architects how to build applications with the microservice architecture. Rather than simply advocating for the use the microservice architecture, this clearly-written guide takes a balanced, pragmatic approach, exploring both the benefits and drawbacks. ',
        (select id_genre from biblio.genre where nom= 'science'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES ('Conception d''applications en java/jee', 'Principes, patterns et architecture', N'Cet ouvrage s’adresse principalement aux étudiants des cycles informatiques (IUT, LP, licence deuxième et troisième années) ainsi qu’aux élèves-ingénieurs en écoles d’informatique.
La phase de conception logicielle répond aux questions « comment résout-on le problème ? comment satisfait-on les besoins ? ».',
        (select id_genre from biblio.genre where nom= 'science'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES (N'Analyse pour le développement logiciel',
        N'Recueil et spécification',
        N'Le développement logiciel commence donc logiquement par un recueil des besoins ou des exigences, se poursuit par des phases de modélisation puis de conception avant de passer à la programmation et aux tests.',
        (select id_genre from biblio.genre where nom= 'science'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES ('Shining', null,
        N'Situé dans les montagnes Rocheuses, l''Overlook Palace passe pour être l''un des plus beaux lieux du monde. Confort, luxe, volupté. L''hiver, l''hôtel est fermé. Coupé du monde par le froid et la neige. Alors, seul l''habite un gardien. Celui qui a été engagé cet hiver-là s''appelle Jack Torrance : c''est un alcoolique, un écrivain raté, qui tente d''échapper au désespoir.',
        (select id_genre from biblio.genre where nom= N'littérature'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES (N'Dôme', null,
        N'La petite ville de Chester''s Mill, dans le Maine, est soudainement coupée du monde par un dôme transparent qui apparaît aux limites de la commune, causant plusieurs accidents mortels le temps que la situation soit connue. L''armée des États-Unis se révèle incapable de détruire ce dôme et les habitants de Chester''s Mill sont donc désormais livrés à eux-mêmes.',
        (select id_genre from biblio.genre where nom= N'littérature'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES ('L''Avare', null,
        N'L''intrigue se passe à Paris. Harpagon est noble, riche et avare. Il a deux enfants : Élise qui est amoureuse de Valère, un gentilhomme napolitain au service de son père en qualité d''intendant, et Cléante qui souhaite épouser Mariane, une jeune femme vivant chez sa mère sans fortune.',
        (select id_genre from biblio.genre where nom= 'arts'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES (N'La vie secrète des animaux', null,
        N'Le talent de conteur et de vulgarisateur de Peter Wohlleben continue d''opérer avec La Vie secrète des animaux. Les droits des animaux, la prise en compte de leur intelligence et, plus récemment, de leur conscience, la question de la souffrance animale, tous ces sujets sont au coeur de l''actualité.',
        (select id_genre from biblio.genre where nom= 'loisir'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES ('Le petit Larousse 2020', N'illustré',
        N'Le numéro 1 des dictionnaires illustrés (plus de 20 millions d''exemplaires vendus), Le dictionnaire le plus actuel, le plus plébiscité et le plus complet du marché. La référence des dictionnaires dans une version bi-média.',
        (select id_genre from biblio.genre where nom= 'langue'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES ('Atlas de base', N'69 cartes à mettre entre toutes les mains',
        N'L''atlas de base a été pensé par une équipe d''inspecteurs, de pédagogues et d''enseignants sous le controle scientifique d''une géographe de l''UCL et d''un instituteur de terrain. Il propose 69 cartes savamment pensées pour aider les élèves à rester en phase avec ce monde qui change, qui bouge,...',
        (select id_genre from biblio.genre where nom= 'educatif'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES ('Dessine-moi ton pays', N'encyclopédie illustrée',
        N'Une magnifique encyclopédie illustrée par des dessins d''enfants du monde entier, qui apprend aux enfants de chez nous l''histoire, la culture et la politique de 56 pays. Les textes sont adaptés à un public de 8 à 12 ans.',
        (select id_genre from biblio.genre where nom= 'jeunesse'));
insert into biblio.livre (titre, sous_titre, resume, id_genre)
VALUES (N'Les 5 blessures qui empêchent d''être soi-même', null,
        N'cinq blessures fondamentales à l''origine de nos maux qu''ils soient physiques, émotionnels ou mentaux. Lise Bourbeau, grâce à une description très détaillée de ces blessures, nous mène vers la voie de la guérison.',
        (select id_genre from biblio.genre where nom= N'santé'));

INSERT into biblio.ecriture (id_auteur, id_livre) VALUES
((SELECT id_auteur from biblio.auteur where nom ='de saint-Exupery'),(select id_livre from biblio.livre where titre='Le petit prince')),
((SELECT id_auteur from biblio.auteur where nom ='Richardson'),(select id_livre from biblio.livre where titre='Microservices Pattern')),
((SELECT id_auteur from biblio.auteur where nom ='Lonchamp'),(select id_livre from biblio.livre where titre='Conception d''applications en java/jee')),
((SELECT id_auteur from biblio.auteur where nom ='Lonchamp'),(select id_livre from biblio.livre where titre= N'Analyse pour le développement logiciel')),
((SELECT id_auteur from biblio.auteur where nom ='King'),(select id_livre from biblio.livre where titre='Shining')),
((SELECT id_auteur from biblio.auteur where nom ='King'),(select id_livre from biblio.livre where titre= N'Dôme')),
((SELECT id_auteur from biblio.auteur where nom ='Poquelin'),(select id_livre from biblio.livre where titre='L''Avare')),
((SELECT id_auteur from biblio.auteur where nom ='Collectif'),(select id_livre from biblio.livre where titre='Le petit Larousse 2020')),
((SELECT id_auteur from biblio.auteur where nom ='Bourbeau'),(select id_livre from biblio.livre where titre= N'Les 5 blessures qui empêchent d''être soi-même')),
((SELECT id_auteur from biblio.auteur where nom ='Wohlleben'),(select id_livre from biblio.livre where titre= N'La vie secrète des animaux')),
((SELECT id_auteur from biblio.auteur where nom ='Gillet'),(select id_livre from biblio.livre where titre='Atlas de base')),
((SELECT id_auteur from biblio.auteur where nom ='Thomas'),(select id_livre from biblio.livre where titre='Atlas de base')),
((SELECT id_auteur from biblio.auteur where nom ='De Prelle' AND prenom='Aude'),(select id_livre from biblio.livre where titre='Dessine-moi ton pays')),
((SELECT id_auteur from biblio.auteur where nom ='De Prelle' AND prenom='Olivia'),(select id_livre from biblio.livre where titre='Dessine-moi ton pays'));

select * from biblio.ecriture;

insert into biblio.editeur (nom) VALUES ('Editions Gallimard');
insert into biblio.editeur (nom) VALUES ('Manning');
insert into biblio.editeur (nom) VALUES ('Dunod');
insert into biblio.editeur (nom) VALUES ('Le livre de poche');
insert into biblio.editeur (nom) VALUES ('Albin Michel');
insert into biblio.editeur (nom) VALUES ('Magnard');
insert into biblio.editeur (nom) VALUES ('Arenes');
insert into biblio.editeur (nom) VALUES ('Larousse');
insert into biblio.editeur (nom) VALUES ('Erasme editions');
insert into biblio.editeur (nom) VALUES ('Caramel');
insert into biblio.editeur (nom) VALUES ('Pocket');



insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('1999-02-23','2070408504',97,null,(SELECT id_livre from biblio.livre WHERE titre='Le petit prince'),(SELECT id_editeur from biblio.editeur WHERE nom='Editions Gallimard'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2018-10-01','9781617294549',520,null,(SELECT id_livre from biblio.livre WHERE titre='Microservices Pattern'),(SELECT id_editeur from biblio.editeur WHERE nom='Manning'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2019-01-01','9782100790456',448,null,(SELECT id_livre from biblio.livre WHERE titre='Conception d''applications en java/jee'),(SELECT id_editeur from biblio.editeur WHERE nom='Dunod'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2015-07-01', '9782100727148', 320, null,(SELECT id_livre from biblio.livre WHERE titre= N'Analyse pour le développement logiciel'), (SELECT id_editeur from biblio.editeur WHERE nom='Dunod'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2007-06-01','9782253151623',576,null,(SELECT id_livre from biblio.livre WHERE titre='Shining'),(SELECT id_editeur from biblio.editeur WHERE nom='Le livre de poche'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2011-08-01','2226220593',576,null,(SELECT id_livre from biblio.livre WHERE titre=N'Dôme'),(SELECT id_editeur from biblio.editeur WHERE nom='Albin Michel'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2011-03-01','9782210755581',144,null,(SELECT id_livre from biblio.livre WHERE titre='L''Avare'),(SELECT id_editeur from biblio.editeur WHERE nom='Magnard'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2018-11-06','9782352049777',335,null,(SELECT id_livre from biblio.livre WHERE titre=N'La vie secrète des animaux'),(SELECT id_editeur from biblio.editeur WHERE nom='Arenes'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2019-10-09','9782035938565',2048,null,(SELECT id_livre from biblio.livre WHERE titre='Le petit Larousse 2020'),(SELECT id_editeur from biblio.editeur WHERE nom='Larousse'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2017-04-26','9782874385766',109,null,(SELECT id_livre from biblio.livre WHERE titre='Atlas de base'),(SELECT id_editeur from biblio.editeur WHERE nom='Erasme editions'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2017-01-12','9789461983206',87,null,(SELECT id_livre from biblio.livre WHERE titre='Dessine-moi ton pays'),(SELECT id_editeur from biblio.editeur WHERE nom='Caramel'));
insert into biblio.edition (date_publi, ISBN, nbre_pages, image, id_livre, id_editeur) VALUES ('2018-08-29','9782266229487',87,null,(SELECT id_livre from biblio.livre WHERE titre=N'Les 5 blessures qui empêchent d''être soi-même'),(SELECT id_editeur from biblio.editeur WHERE nom='Pocket'));


insert into biblio.bibliotheque (nom, actif, id_adresse) VALUES (N'bibliothèque du centre', 1, (select id_adresse from biblio.adresse where rue='rue des monts' AND numero=6) );
insert into biblio.bibliotheque (nom, actif, id_adresse) VALUES (N'bibliothèque des haies', 1, (select id_adresse from biblio.adresse where rue='place des haies' AND numero=16) );
insert into biblio.bibliotheque (nom, actif, id_adresse) VALUES (N'bibliothèque du bultia', 1, (select id_adresse from biblio.adresse where rue='place du bultia' AND numero=17) );



insert into biblio.exemplaire (etat, prix_achat, format, en_stock, actif, id_edition, id_bibliotheque, id_emprunteur, id_emprunt)
VALUES ('neuf', 36.49, 'papier', 1, 1,(SELECT id_edition from biblio.edition where id_livre=(SELECT id_livre from biblio.livre WHERE titre='Le petit prince')),
        (select id_bibliotheque from biblio.bibliotheque where nom= N'bibliothèque du centre'), null, null);
insert into biblio.exemplaire (etat, prix_achat, format, en_stock, actif, id_edition, id_bibliotheque, id_emprunteur, id_emprunt)
VALUES (N'abimé', 36.49, 'papier', 1, 1, (SELECT id_edition from biblio.edition where id_livre= (SELECT id_livre from biblio.livre WHERE titre='Le petit prince')),
        (select id_bibliotheque from biblio.bibliotheque where nom= N'bibliothèque des haies'), null, null);
insert into biblio.exemplaire (etat, prix_achat, format, en_stock, actif, id_edition, id_bibliotheque, id_emprunteur, id_emprunt)
VALUES ('perdu', 36.49, 'papier', 1, 1,(SELECT id_edition from biblio.edition where id_livre=(SELECT id_livre from biblio.livre WHERE titre='Le petit prince')),
        (select id_bibliotheque from biblio.bibliotheque where nom= N'bibliothèque du bultia'), null, null);
insert into biblio.exemplaire (etat, prix_achat, format, en_stock, actif, id_edition, id_bibliotheque, id_emprunteur, id_emprunt)
VALUES ('neuf', 45.49, N'numérique', 1, 1, (SELECT id_edition from biblio.edition where id_livre= (SELECT id_livre from biblio.livre WHERE titre='Microservices Pattern')),
        (select id_bibliotheque from biblio.bibliotheque where nom= N'bibliothèque du centre'), null, null);
insert into biblio.exemplaire (etat, prix_achat, format, en_stock, actif, id_edition, id_bibliotheque, id_emprunteur, id_emprunt)
VALUES (N'abimé', 45.49, 'papier', 1, 1, (SELECT id_edition from biblio.edition where id_livre= (SELECT id_livre from biblio.livre WHERE titre='Microservices Pattern')),
        (select id_bibliotheque from biblio.bibliotheque where nom= N'bibliothèque du centre'), null, null);

insert into biblio.theme (nom) VALUES ('informatique'), ('java'), ('analyse'), (N'littérature française'), (N'theâtre'), ('nature'),
                                      ('animaux'), ('psychologie'), (N'encyclopédie'), ('horreur'), ('science-fiction'),
                                      (N'géographie');

insert into biblio.tag (nom) VALUES ('king'), ('horreur'), ('sf'), (N'molière'), ('cheval'), ('psycho'), ('java'), ('pattern'),
                                    ('uml'), ('c#'), ('microservice'), ('angular'), ('agile'), ('extra-terrestre'), ('et'),
                                    ('dessin'), ('enfant'), ('dictionnaire'), ('harpagon'), ('mouton'), ('atlas');

select id_livre from biblio.livre where titre='Microservices Pattern';

insert into biblio.organisation (id_theme, id_livre) VALUES
((select id_theme from biblio.theme where nom='informatique'), (select id_livre from biblio.livre where titre='Microservices Pattern')),
((select id_theme from biblio.theme where nom='java'), (select id_livre from biblio.livre where titre='Microservices Pattern')),
((select id_theme from biblio.theme where nom='informatique'), (select id_livre from biblio.livre where titre='Conception d''applications en java/jee')),
((select id_theme from biblio.theme where nom='java'), (select id_livre from biblio.livre where titre='Conception d''applications en java/jee')),
((select id_theme from biblio.theme where nom='informatique'), (select id_livre from biblio.livre where titre= N'Analyse pour le développement logiciel')),
((select id_theme from biblio.theme where nom='analyse'), (select id_livre from biblio.livre where titre= N'Analyse pour le développement logiciel')),
((select id_theme from biblio.theme where nom= N'littérature française'), (select id_livre from biblio.livre where titre='L''Avare')),
((select id_theme from biblio.theme where nom= N'theâtre'), (select id_livre from biblio.livre where titre='L''Avare')),
((select id_theme from biblio.theme where nom='nature'), (select id_livre from biblio.livre where titre= N'La vie secrète des animaux')),
((select id_theme from biblio.theme where nom='animaux'), (select id_livre from biblio.livre where titre= N'La vie secrète des animaux')),
((select id_theme from biblio.theme where nom='psychologie'), (select id_livre from biblio.livre where titre= N'Les 5 blessures qui empêchent d''être soi-même')),
((select id_theme from biblio.theme where nom= N'encyclopédie'), (select id_livre from biblio.livre where titre='Dessine-moi ton pays')),
((select id_theme from biblio.theme where nom= N'encyclopédie'), (select id_livre from biblio.livre where titre='Le petit Larousse 2020')),
((select id_theme from biblio.theme where nom= N'géographie'), (select id_livre from biblio.livre where titre='Atlas de base')),
((select id_theme from biblio.theme where nom='horreur'), (select id_livre from biblio.livre where titre='shining')),
((select id_theme from biblio.theme where nom='horreur'), (select id_livre from biblio.livre where titre= N'Dôme')),
((select id_theme from biblio.theme where nom='science-fiction'), (select id_livre from biblio.livre where titre= N'Dôme')),
((select id_theme from biblio.theme where nom= N'littérature française'), (select id_livre from biblio.livre where titre='Le petit prince'));

Select * from biblio.tag;

insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'java'),
        (select id_livre from biblio.livre where titre = 'Microservices Pattern'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'pattern'),
        (select id_livre from biblio.livre where titre = 'Microservices Pattern'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'microservice'),
        (select id_livre from biblio.livre where titre = 'Microservices Pattern'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'c#'),
        (select id_livre from biblio.livre where titre = 'Microservices Pattern'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'angular'),
        (select id_livre from biblio.livre where titre = 'Microservices Pattern'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'java'),
        (select id_livre from biblio.livre where titre = 'Conception d''applications en java/jee'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'angular'),
        (select id_livre from biblio.livre where titre = 'Conception d''applications en java/jee'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'uml'),
        (select id_livre from biblio.livre where titre = N'Analyse pour le développement logiciel'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'agile'),
        (select id_livre from biblio.livre where titre = N'Analyse pour le développement logiciel'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = N'molière'),
        (select id_livre from biblio.livre where titre = 'L''Avare'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'harpagon'),
        (select id_livre from biblio.livre where titre = 'L''Avare'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'psycho'),
        (select id_livre from biblio.livre where titre = N'Les 5 blessures qui empêchent d''être soi-même'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'cheval'),
        (select id_livre from biblio.livre where titre = N'La vie secrète des animaux'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'mouton'),
        (select id_livre from biblio.livre where titre = N'La vie secrète des animaux'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'enfant'),
        (select id_livre from biblio.livre where titre = N'La vie secrète des animaux'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'dessin'),
        (select id_livre from biblio.livre where titre = 'Dessine-moi ton pays'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'enfant'),
        (select id_livre from biblio.livre where titre = 'Dessine-moi ton pays'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'dictionnaire'),
        (select id_livre from biblio.livre where titre = 'Le petit Larousse 2020'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'atlas'),
        (select id_livre from biblio.livre where titre = 'Atlas de base'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'mouton'),
        (select id_livre from biblio.livre where titre = 'Le petit prince'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'king'), (select id_livre from biblio.livre where titre = 'Shining'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'horreur'),
        (select id_livre from biblio.livre where titre = 'Shining'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'psycho'),
        (select id_livre from biblio.livre where titre = 'Shining'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'king'), (select id_livre from biblio.livre where titre = N'Dôme'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'horreur'), (select id_livre from biblio.livre where titre = N'Dôme'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'extra-terrestre'),
        (select id_livre from biblio.livre where titre = N'Dôme'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'et'), (select id_livre from biblio.livre where titre = N'Dôme'));
insert into biblio.etiquete (id_tag, id_livre)
VALUES ((select id_tag from biblio.tag where nom = 'sf'), (select id_livre from biblio.livre where titre = N'Dôme'));

insert into biblio.role (nom) VALUES ('ADMIN'),('BM'),('BIBLIO');
insert into biblio.role (nom) VALUES ('USER');

insert into biblio.bibliothecaire (nom, prenom, mail, mdp, actif, id_role) VALUES
('Piret', 'Seb', 'sebpiret@hotmail.com','$2a$08$yjXJup5ztlWHiuQY.J7eJ.d6zfs.DkcJk6vM697DpvckvXvAG61CO',1,(select id_role from biblio.role where role.nom='ADMIN'));

insert into biblio.emprunteur (nom, mail, mdp, actif, id_adresse, prenom) VALUES
('Piret', 'sebpiret@gmail.com','$2a$08$yjXJup5ztlWHiuQY.J7eJ.d6zfs.DkcJk6vM697DpvckvXvAG61CO',1,(select id_adresse from biblio.adresse where rue='chemin vert' AND numero=68), 'Seb');

select u.* from biblio.emprunteur u where u.mail='sebpiret@gmail.com';

