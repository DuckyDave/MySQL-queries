/* Base de dades Tienda. */
USE tienda;
/* Si us plau, efectua les siguentes consultes: */
/* 1. Llista el nom de tots els productos que hi ha en la taula producto. */
SELECT nombre AS 'Productes disponibles' FROM tienda.producto;
/* 2. Llista els noms i els preus de tots els productos de la taula producto. */
SELECT nombre AS 'Productes disponibles', precio AS 'Preu' FROM tienda.producto;
/* 3. Llista totes les columnes de la taula producto. */
SHOW COLUMNS FROM tienda.producto;
/* 4. Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans (USD). */
SELECT nombre, concat(precio,'€'), concat('$',precio) FROM tienda.producto;
/* 5. Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars nord-americans. */
SELECT nombre AS 'nom de producto', concat(precio,' €') AS 'euros', concat('$',precio) AS 'dòlars nord-americans' FROM tienda.producto;
/* 6. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula. */
SELECT ucase(nombre) AS 'PRODUCTES DISPONIBLES', precio FROM tienda.producto;
/* 7. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula. */
SELECT lcase(nombre) as 'productes disponibles', precio FROM tienda.producto;
/* 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant. */
SELECT nombre As 'Fabricant', ucase(left(nombre,2)) AS 'Codi fabricant' FROM tienda.fabricante;
/* 9. Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu. */
SELECT nombre AS 'Producte', ceil(precio) AS 'Preu' FROM tienda.producto;
/* 10. Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal. */
SELECT nombre AS 'Producte', truncate(precio,0) AS 'Preu' FROM tienda.producto;
/* 11. Llista el codi dels fabricants que tenen productos en la taula producto. */
SELECT codigo_fabricante AS 'Codi fabricant' FROM tienda.fabricante, tienda.producto WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo;
/* 12. Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits. */
SELECT DISTINCT codigo_fabricante AS 'Codi fabricant' FROM tienda.fabricante, tienda.producto WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo;
/* 13. Llista els noms dels fabricants ordenats de manera ascendent. */
SELECT nombre AS 'Fabricant' FROM tienda.fabricante ORDER BY nombre ASC;
/* 14. Llista els noms dels fabricants ordenats de manera descendent. */
SELECT nombre AS 'Fabricant' FROM tienda.fabricante ORDER BY nombre DESC;
/* 15. Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent. */
SELECT nombre AS 'Producte' FROM tienda.producto ORDER BY nombre ASC, precio DESC;
/* 16. Retorna una llista amb les 5 primeres files de la taula fabricante. */
SELECT codigo AS 'Codi', nombre AS 'Fabricant' FROM tienda.fabricante LIMIT 5;
/* 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta. */
SELECT codigo AS 'Codi', nombre AS 'Fabricant' FROM tienda.fabricante LIMIT 2 OFFSET 3;
/* 18. Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY */
SELECT nombre AS 'Producte', precio AS 'Preu' FROM tienda.producto ORDER BY precio ASC LIMIT 1;
/* 19. Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY. */
SELECT nombre AS 'Producte', precio AS 'Preu' FROM tienda.producto ORDER BY precio DESC LIMIT 1;
/* 20. Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2. */
SELECT nombre AS 'Productes codi fabricant igual a 2' FROM tienda.producto WHERE codigo_fabricante = '2';
/* 21. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. */
SELECT tienda.producto.nombre AS 'Producte', precio AS 'Preu', tienda.fabricante.nombre AS 'Fabricant' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante;
/* 22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricant, per ordre alfabètic. */
SELECT tienda.producto.nombre AS 'Producte', precio AS 'Preu', tienda.fabricante.nombre AS 'Fabricant' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante ORDER BY tienda.fabricante.nombre ASC;
/* 23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades. */
SELECT tienda.producto.codigo AS 'Codi producte', tienda.producto.nombre AS 'Producte',tienda.fabricante.codigo AS 'Codi fabricant', tienda.fabricante.nombre AS 'Fabricant' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante;
/* 24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat. */
SELECT tienda.producto.nombre AS 'Producte', precio AS 'Preu', tienda.fabricante.nombre AS 'Fabricant' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante ORDER BY tienda.producto.precio ASC LIMIT 1;
/* 25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car. */
SELECT tienda.producto.nombre AS 'Producte', precio AS 'Preu', tienda.fabricante.nombre AS 'Fabricant' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante ORDER BY tienda.producto.precio DESC LIMIT 1;
/* 26. Retorna una llista de tots els productes del fabricant Lenovo. */
SELECT tienda.producto.nombre AS 'Productes Lenovo' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND tienda.fabricante.nombre = 'Lenovo';
/* 27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€. */
SELECT tienda.producto.nombre AS 'Productes Crucial amb preu major que 200€' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND (tienda.fabricante.nombre = 'Crucial' AND tienda.producto.precio > 200);
/* 28. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN. */
SELECT tienda.producto.nombre AS 'Productes Asus, Hewlett-Packard i Seagate disponibles' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND (tienda.fabricante.nombre = 'Asus' OR tienda.fabricante.nombre = 'Hewlett-Packard' OR tienda.fabricante.nombre = 'Seagate');
/* 29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN. */
SELECT tienda.producto.nombre AS 'Productes Asus, Hewlett-Packard i Seagate disponibles' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND tienda.fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
/* 30. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e. */
SELECT tienda.producto.nombre AS 'Productes', precio AS 'Preu' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND tienda.fabricante.nombre LIKE '%e';
/* 31. Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom. */
SELECT tienda.producto.nombre AS 'Productes', precio AS 'Preu' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND tienda.fabricante.nombre LIKE '%w%';
/* 32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent) */
SELECT tienda.producto.nombre AS 'Producte', tienda.producto.precio AS 'Preu', tienda.fabricante.nombre AS 'Fabricant' FROM tienda.producto, tienda.fabricante WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND (tienda.producto.precio >= 180) ORDER BY tienda.producto.precio DESC, tienda.producto.nombre ASC;
/* 33. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades. */
SELECT DISTINCT tienda.fabricante.codigo AS 'Codi fabricant', tienda.fabricante.nombre AS 'Nom fabricant' FROM tienda.fabricante INNER JOIN tienda.producto ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo;
/* 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats. */
SELECT tienda.fabricante.nombre AS 'Fabricant', tienda.producto.nombre AS 'Producte' FROM tienda.fabricante LEFT JOIN tienda.producto ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante;
/* 35. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat. */
SELECT tienda.fabricante.nombre AS 'Fabricants sense productes associats' FROM tienda.fabricante LEFT JOIN tienda.producto ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante WHERE tienda.producto.nombre IS NULL;
/* 36. Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN). */
SELECT tienda.producto.nombre AS 'Productes fabricats per Lenovo' FROM tienda.producto WHERE codigo_fabricante = ANY (SELECT codigo FROM tienda.fabricante WHERE nombre LIKE 'Lenovo');
/* 37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense utilitzar INNER JOIN). */
SELECT tienda.producto.codigo AS 'Codi producte', tienda.producto.nombre AS 'Producte', precio AS 'Preu', codigo_fabricante AS 'codi fabricant' FROM tienda.producto WHERE precio = ANY (SELECT max(precio) FROM tienda.producto RIGHT JOIN tienda.fabricante ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND tienda.fabricante.nombre LIKE 'Lenovo');
/* 38. Llista el nom del producte més car del fabricant Lenovo. */
SELECT tienda.producto.nombre AS 'Producte Lenovo amb el preu més car' FROM tienda.producto WHERE precio = ANY (SELECT max(precio) FROM tienda.producto RIGHT JOIN tienda.fabricante ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante WHERE tienda.fabricante.codigo = ANY (SELECT tienda.fabricante.codigo FROM tienda.fabricante WHERE tienda.fabricante.nombre LIKE 'Lenovo'));
/* 39. Llista el nom del producte més barat del fabricant Hewlett-Packard. */
SELECT tienda.producto.nombre AS 'Producte Hewlett-Packard amb el preu més barat' FROM tienda.producto WHERE precio = ANY (SELECT min(precio) FROM tienda.producto RIGHT JOIN tienda.fabricante ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante WHERE tienda.fabricante.codigo = ANY (SELECT tienda.fabricante.codigo FROM tienda.fabricante WHERE tienda.fabricante.nombre LIKE 'Hewlett-Packard'));
/* 40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo. */
SELECT tienda.producto.nombre AS 'Productes amb preu major o igual que el més car de Lenovo' FROM tienda.producto WHERE precio >= ANY (SELECT max(precio) FROM tienda.producto RIGHT JOIN tienda.fabricante ON (tienda.fabricante.codigo = tienda.producto.codigo_fabricante AND tienda.fabricante.nombre LIKE 'Lenovo'));
/* 41. Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes. */
SELECT tienda.producto.nombre AS 'Productes del fabricant Asus amb preu superior al preu mitjà de tots els seus productes' FROM tienda.producto INNER JOIN tienda.fabricante ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo WHERE tienda.producto.precio > ANY (SELECT avg(precio) FROM tienda.fabricante) AND tienda.fabricante.codigo = ANY (SELECT tienda.fabricante.codigo FROM tienda.fabricante WHERE tienda.fabricante.nombre LIKE 'Asus');

/* Base de dades Univiersidad. */
USE universidad;
/* afegim una professora sense departament assignat */
INSERT INTO persona VALUES (25, '48302359J', 'Helena', 'Torres', 'Lopez', 'Almería', 'C/ Sol', '625741264', '1982/06/12', 'M', 'profesor');
INSERT INTO departamento VALUES (10, 'SIN ASIGNAR');
INSERT INTO profesor VALUES (25, 10);
/* Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes: */
/* 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom. */
SELECT apellido1 AS 'Primer cognom', apellido2 AS 'Segon cognom', nombre AS 'Nom' FROM universidad.persona WHERE tipo LIKE 'alumno' ORDER BY apellido1, Apellido2, nombre ASC;
/* 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades. */
SELECT apellido1 AS 'Primer cognom', apellido2 AS 'Segon cognom', nombre AS 'Nom' FROM universidad.persona WHERE tipo LIKE 'alumno' AND telefono IS null;
/* 3. Retorna el llistat dels alumnes que van néixer en 1999. */
SELECT apellido1 AS 'Primer cognom', apellido2 AS 'Segon cognom', nombre AS 'Nom' FROM universidad.persona Where tipo LIKE 'alumno' AND fecha_nacimiento between '1999/01/01' and '1999/12/31';
/* 4. Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K. */
SELECT apellido1 AS 'Primer cognom', apellido2 AS 'Segon cognom', nombre AS 'Nom'  FROM universidad.persona WHERE tipo LIKE 'profesor' AND (telefono IS null) AND (nif like '%K');
/* 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7. */
SELECT nombre FROM universidad.asignatura WHERE id_grado = 7 AND (cuatrimestre = 1 AND curso = 3);
/* 6. Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom. */
SELECT apellido1 AS 'Primer cognom', apellido2 AS 'Segon cognom', universidad.persona.nombre AS 'Nom', universidad.departamento.nombre AS 'Nom Departament' FROM universidad.persona, universidad.profesor, universidad.departamento WHERE id_profesor = universidad.persona.id AND id_departamento = universidad.departamento.id ORDER BY apellido1, apellido2, universidad.persona.nombre ASC;
/* 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M. */
SELECT universidad.asignatura.nombre AS 'Assignatura', universidad.curso_escolar.anyo_inicio AS 'Any inici', universidad.curso_escolar.anyo_fin AS 'Any final' FROM universidad.curso_escolar, universidad.asignatura, universidad.alumno_se_matricula_asignatura, universidad.persona WHERE universidad.persona.nif = '26902806M' AND (universidad.persona.id = universidad.alumno_se_matricula_asignatura.id_alumno AND universidad.alumno_se_matricula_asignatura.id_asignatura = universidad.asignatura.id AND universidad.alumno_se_matricula_asignatura.id_curso_escolar = universidad.curso_escolar.id);
/* 8. Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015). */
SELECT DISTINCT universidad.departamento.nombre AS 'Departaments amb professors que imparteixen alguna assignatura del Grau en Enginyeria Informàtica (Pla 2015)'FROM universidad.departamento, universidad.profesor, universidad.asignatura, universidad.grado WHERE universidad.departamento.id = universidad.profesor.id_departamento AND universidad.profesor.id_profesor = universidad.asignatura.id_profesor AND universidad.asignatura.id_grado = universidad.grado.id AND universidad.grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/* 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019. */
SELECT persona.apellido1 AS 'Primer cognom', persona.apellido2 AS 'Segon cognom', persona.nombre AS 'Nom' FROM universidad.alumno_se_matricula_asignatura INNER JOIN universidad.persona ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE id_curso_escolar LIKE '1' GROUP BY persona.id, id_curso_escolar HAVING count(id_asignatura) > 0;
/* Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN. */
/* 1. Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom. */
SELECT universidad.departamento.nombre AS 'Departament', universidad.persona.apellido1 AS 'Primer cognom', universidad.persona.apellido2 AS 'Segon cognom', universidad.persona.nombre AS 'Nom' FROM universidad.persona RIGHT JOIN universidad.profesor ON universidad.persona.id = universidad.profesor.id_profesor LEFT JOIN universidad.departamento ON universidad.profesor.id_departamento = universidad.departamento.id ORDER BY universidad.departamento.nombre, universidad.persona.apellido1, universidad.persona.apellido2, universidad.persona.nombre ASC;
/* 2. Retorna un llistat amb els professors que no estan associats a un departament. */
SELECT universidad.persona.apellido1 AS 'Primer cognom', universidad.persona.apellido2 AS 'Segon cognom', universidad.persona.nombre AS 'Nom' FROM universidad.persona RIGHT JOIN universidad.profesor ON universidad.persona.id = universidad.profesor.id_profesor WHERE universidad.profesor.id_departamento LIKE '10';
/* 3. Retorna un llistat amb els departaments que no tenen professors associats. */
SELECT universidad.departamento.nombre AS 'Departament' FROM universidad.departamento LEFT JOIN universidad.profesor ON universidad.departamento.id = universidad.profesor.id_departamento WHERE universidad.profesor.id_profesor IS NULL;
/* 4 . Retorna un llistat amb els professors que no imparteixen cap assignatura. */
SELECT universidad.persona.apellido1 AS 'Primer cognom', universidad.persona.apellido2 AS 'Segon cognom', universidad.persona.nombre AS 'Nom' FROM universidad.persona RIGHT JOIN universidad.profesor ON universidad.persona.id = universidad.profesor.id_profesor LEFT JOIN universidad.asignatura ON universidad.profesor.id_profesor = universidad.asignatura.id_profesor WHERE universidad.asignatura.id IS NULL;
/* 5. Retorna un llistat amb les assignatures que no tenen un professor assignat. */
SELECT nombre AS 'Assignaturews sense professor assignat' FROM universidad.asignatura WHERE id_profesor IS NULL;
/* 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar. */
/* consultes resum */
/* 1. Retorna el nombre total d'alumnes que hi ha. */
SELECT count(universidad.persona.id) AS 'Total alumnat' FROM universidad.persona WHERE tipo = 'alumno';
/* 2. Calcula quants alumnes van néixer en 1999. */
SELECT count(universidad.persona.id) AS 'Alumnat nascut el 1999' FROM universidad.persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999/01/01' AND '1999/12/31';
/* 3. Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors. */
SELECT universidad.departamento.nombre AS 'Departament', count(universidad.profesor.id_profesor) AS 'Professors' FROM universidad.profesor INNER JOIN universidad.departamento ON  universidad.departamento.id = universidad.profesor.id_departamento GROUP BY universidad.departamento.nombre ORDER BY count(universidad.profesor.id_profesor) DESC;
/* 4. Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat. */
SELECT universidad.departamento.nombre AS 'Departament', count(universidad.profesor.id_profesor) AS 'Professors' FROM universidad.departamento LEFT JOIN universidad.profesor ON universidad.departamento.id = universidad.profesor.id_departamento GROUP BY universidad.departamento.nombre;
/* 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures. */
SELECT universidad.grado.nombre AS 'Grau', count(universidad.asignatura.nombre) AS 'Assignatures' FROM universidad.grado LEFT JOIN universidad.asignatura ON universidad.grado.id = universidad.asignatura.id_grado GROUP BY universidad.grado.nombre ORDER BY count(universidad.asignatura.nombre) DESC;
/* 6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades. */
SELECT universidad.grado.nombre AS 'Grau', count(universidad.asignatura.nombre) AS 'Assignatures' FROM universidad.grado LEFT JOIN universidad.asignatura ON universidad.grado.id = universidad.asignatura.id_grado GROUP BY universidad.grado.nombre HAVING count(universidad.asignatura.nombre) > 40;
/* 7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus. */
SELECT universidad.grado.nombre AS 'Grau', universidad.asignatura.tipo AS 'Tipus assignatura', sum(universidad.asignatura.creditos) AS 'Total crèdits' FROM universidad.grado INNER JOIN universidad.asignatura ON universidad.asignatura.id_grado = universidad.grado.id GROUP BY universidad.grado.nombre, universidad.asignatura.tipo;
/* 8. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats. */
/* 9. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures. */
/* 10. Retorna totes les dades de l'alumne més jove. */
SELECT nif AS 'NIF', nombre AS 'Nom', apellido1 AS 'Primer cognom', apellido2 AS 'Segon cognom', direccion AS 'Adreça', ciudad AS 'Ciutat', telefono AS 'Telèfon' FROM universidad.persona WHERE fecha_nacimiento = ANY (SELECT min(fecha_nacimiento) FROM universidad.persona WHERE tipo LIKE 'alumno');
/* 11. Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura. */
/* Donem de baixa a la professora sense departament associat */
DELETE FROM profesor WHERE id_profesor LIKE '25' LIMIT 1;
DELETE FROM departamento WHERE id LIKE '10' LIMIT 1;
DELETE FROM persona WHERE id LIKE '25' LIMIT 1;