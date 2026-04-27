import 'package:app_pvvc/modelos/alimento.dart';
import 'package:app_pvvc/modelos/categoria.dart';

final categorias = [
  Categoria(
    nombre: "Frutas",
    imagen: "assets/bd_alimentos/categorias/frutas.png",
    maximoSeleccion: 1,
  ),
  Categoria(
    nombre: "Verduras",
    imagen: "assets/bd_alimentos/categorias/verduras.png",
    maximoSeleccion: 2,
  ),
  Categoria(
    nombre: "Cereales",
    imagen: "assets/bd_alimentos/categorias/cereales.png",
    maximoSeleccion: 1,
  ),
  Categoria(
    nombre: "Origen Animal",
    imagen: "assets/bd_alimentos/categorias/carnes.png",
    maximoSeleccion: 2,
  ),
  Categoria(
    nombre: "Lácteos",
    imagen: "assets/bd_alimentos/categorias/lacteos.png",
    maximoSeleccion: 1,
  ),
  Categoria(
    nombre: "Leguminosas",
    imagen: "assets/bd_alimentos/categorias/leguminosas.png",
    maximoSeleccion: 1,
  ),
  Categoria(
    nombre: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/categorias/grasas_sin_proteina.png",
    maximoSeleccion: 1,
  ),
  Categoria(
    nombre: "Grasas con proteína",
    imagen: "assets/bd_alimentos/categorias/grasas_con_proteina.png",
    maximoSeleccion: 1,
  ),
  Categoria(
    nombre: "Bebidas",
    imagen: "assets/bd_alimentos/categorias/bebidas.png",
    maximoSeleccion: 1,
  ),
];

final alimentos = [
  Alimento(
    nombre: "Plátano",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/platano.png",
  ),
  Alimento(
    nombre: "Manzana roja",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/manzana_roja.png",
  ),
  Alimento(
    nombre: "Fresa",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/fresa.png",
  ),
  Alimento(
    nombre: "Guayaba",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/guayaba.png",
  ),
  Alimento(
    nombre: "Kiwi",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/kiwi.png",
  ),
  Alimento(
    nombre: "Mandarina",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/mandarina.png",
  ),
  Alimento(
    nombre: "Manzana verde",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/manzana_verde.png",
  ),
  Alimento(
    nombre: "Melon",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/melon.png",
  ),
  Alimento(
    nombre: "Moras",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/moras.png",
  ),
  Alimento(
    nombre: "Naranja",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/naranja.png",
  ),
  Alimento(
    nombre: "Papaya",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/papaya.png",
  ),
  Alimento(
    nombre: "Pera",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/pera.png",
  ),
  Alimento(
    nombre: "Piña",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/piña.png",
  ),
  Alimento(
    nombre: "Sandia",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/sandia.png",
  ),
  Alimento(
    nombre: "Uva",
    categoria: "Frutas",
    imagen: "assets/bd_alimentos/alimentos/frutas/uva.png",
  ),

  Alimento(
    nombre: "Tomate",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/tomate.png",
  ),
  Alimento(
    nombre: "Cebolla",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/cebolla.png",
  ),
  Alimento(
    nombre: "Calabaza",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/calabaza.png",
  ),
  Alimento(
    nombre: "Espinaca",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/espinaca.png",
  ),
  Alimento(
    nombre: "Lechuga",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/lechuga.png",
  ),
  Alimento(
    nombre: "Pimiento rojo",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/pimiento_rojo.png",
  ),
  Alimento(
    nombre: "Pimiento verde",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/pimiento_verde.png",
  ),
  Alimento(
    nombre: "Pimiento amarillo",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/pimiento_amarillo.png",
  ),
  Alimento(
    nombre: "Pepino",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/pepino.png",
  ),
  Alimento(
    nombre: "Brocoli",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/brocoli.png",
  ),
  Alimento(
    nombre: "Zanahoria",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/zanahoria.png",
  ),
  Alimento(
    nombre: "Coliflor",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/coliflor.png",
  ),
  Alimento(
    nombre: "Ejotes",
    categoria: "Verduras",
    imagen: "assets/bd_alimentos/alimentos/verduras/ejote.png",
  ),

  Alimento(
    nombre: "Arroz",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/arroz.png",
  ),
  Alimento(
    nombre: "Pasta",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/pasta.png",
  ),
  Alimento(
    nombre: "Pan Integral",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/pan_integral.png",
  ),
  Alimento(
    nombre: "Elote",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/elote.png",
  ),
  Alimento(
    nombre: "Avena",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/avena.png",
  ),
  Alimento(
    nombre: "Papa",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/papa.png",
  ),
  Alimento(
    nombre: "Tortilla harina",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/tortilla_harina.png",
  ),
  Alimento(
    nombre: "Tortilla maiz",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/tortilla_maiz.png",
  ),
  Alimento(
    nombre: "Galletas de arroz",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/galletas_arroz.png",
  ),
  Alimento(
    nombre: "Tostadas horneadas",
    categoria: "Cereales",
    imagen: "assets/bd_alimentos/alimentos/cereales/tostada.png",
  ),

  Alimento(
    nombre: "Atun",
    categoria: "Origen Animal",
    imagen: "assets/bd_alimentos/alimentos/animal/atun.png",
  ),
  Alimento(
    nombre: "Camarones",
    categoria: "Origen Animal",
    imagen: "assets/bd_alimentos/alimentos/animal/camarones.png",
  ),
  Alimento(
    nombre: "Cerdo",
    categoria: "Origen Animal",
    imagen: "assets/bd_alimentos/alimentos/animal/cerdo.png",
  ),
  Alimento(
    nombre: "Huevo",
    categoria: "Origen Animal",
    imagen: "assets/bd_alimentos/alimentos/animal/huevo.png",
  ),
  Alimento(
    nombre: "Pescado",
    categoria: "Origen Animal",
    imagen: "assets/bd_alimentos/alimentos/animal/pescado.png",
  ),
  Alimento(
    nombre: "Pollo",
    categoria: "Origen Animal",
    imagen: "assets/bd_alimentos/alimentos/animal/pollo.png",
  ),
  Alimento(
    nombre: "Queso",
    categoria: "Origen Animal",
    imagen: "assets/bd_alimentos/alimentos/animal/queso.png",
  ),
  Alimento(
    nombre: "Res",
    categoria: "Origen Animal",
    imagen: "assets/bd_alimentos/alimentos/animal/res.png",
  ),

  Alimento(
    nombre: "Kéfir",
    categoria: "Lácteos",
    imagen: "assets/bd_alimentos/alimentos/lacteos/kefir.png",
  ),
  Alimento(
    nombre: "Leche semidescremada",
    categoria: "Lácteos",
    imagen: "assets/bd_alimentos/alimentos/lacteos/leche.png",
  ),
  Alimento(
    nombre: "Yogurt natural",
    categoria: "Lácteos",
    imagen: "assets/bd_alimentos/alimentos/lacteos/yogur.png",
  ),

  Alimento(
    nombre: "Frijol",
    categoria: "Leguminosas",
    imagen: "assets/bd_alimentos/alimentos/leguminosas/frijol.png",
  ),
  Alimento(
    nombre: "Garbanzo",
    categoria: "Leguminosas",
    imagen: "assets/bd_alimentos/alimentos/leguminosas/garbanzo.png",
  ),
  Alimento(
    nombre: "Lentejas",
    categoria: "Leguminosas",
    imagen: "assets/bd_alimentos/alimentos/leguminosas/lentejas.png",
  ),
  Alimento(
    nombre: "Soya",
    categoria: "Leguminosas",
    imagen: "assets/bd_alimentos/alimentos/leguminosas/soya.png",
  ),

  Alimento(
    nombre: "Aceite de canola",
    categoria: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas/aceite-de-canola.png",
  ),
  Alimento(
    nombre: "Aceite de aguacate",
    categoria: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas/aceite_de_aguacate.png",
  ),
  Alimento(
    nombre: "Aceite de oliva",
    categoria: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas/aceite-de-oliva.png",
  ),
  Alimento(
    nombre: "Aderezo",
    categoria: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas/aderezo.png",
  ),
  Alimento(
    nombre: "Aguacate",
    categoria: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas/aguacate.png",
  ),
  Alimento(
    nombre: "Crema",
    categoria: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas/crema.png",
  ),
  Alimento(
    nombre: "Mantequilla",
    categoria: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas/mantequilla.png",
  ),
  Alimento(
    nombre: "Mayonesa",
    categoria: "Grasas sin proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas/mayonesa.png",
  ),

  Alimento(
    nombre: "Almendras",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/almendra.png",
  ),
  Alimento(
    nombre: "Cacahuate",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/cacahuate.png",
  ),
  Alimento(
    nombre: "Linaza",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/linaza.png",
  ),
  Alimento(
    nombre: "Nueces",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/nueces.png",
  ),
  Alimento(
    nombre: "Pepitas",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/pepitas.png",
  ),
  Alimento(
    nombre: "Pistache",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/pistacho.png",
  ),
  Alimento(
    nombre: "Semilla de girasol",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/semilla-de-girasol.png",
  ),
  Alimento(
    nombre: "Cacao",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/cacao.png",
  ),
  Alimento(
    nombre: "Chia",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/chia.png",
  ),
  Alimento(
    nombre: "Crema de almendras",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/crema_de-almendras.png",
  ),
  Alimento(
    nombre: "Crema de cacahuate",
    categoria: "Grasas con proteína",
    imagen: "assets/bd_alimentos/alimentos/grasas_proteina/crema-de-cacahuate.png",
  ),

  Alimento(
    nombre: "Agua natural",
    categoria: "Bebidas",
    imagen: "assets/bd_alimentos/alimentos/bebidas/natural.png",
  ),
  Alimento(
    nombre: "Jamaica",
    categoria: "Bebidas",
    imagen: "assets/bd_alimentos/alimentos/bebidas/jamaica.png",
  ),
  Alimento(
    nombre: "Limon y pepino",
    categoria: "Bebidas",
    imagen: "assets/bd_alimentos/alimentos/bebidas/pepino_limon.png",
  ),
  Alimento(
    nombre: "Fresa con albaca",
    categoria: "Bebidas",
    imagen: "assets/bd_alimentos/alimentos/bebidas/fresa.png",
  ),
  Alimento(
    nombre: "Limon",
    categoria: "Bebidas",
    imagen: "assets/bd_alimentos/alimentos/bebidas/limon.png",
  ),
  Alimento(
    nombre: "Sandia con menta ",
    categoria: "Bebidas",
    imagen: "assets/bd_alimentos/alimentos/bebidas/sandia.png",
  ),
];
