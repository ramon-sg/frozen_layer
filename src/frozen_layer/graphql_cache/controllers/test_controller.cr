require "redis"

module FrozenLayer
  module GraphqlCache
    class TestController < FrozenLayer::BaseController
      def content
        %({
            "data": {
                "search": {
                    "facetValues": [
                        {
                            "facetValue": {
                                "id": "52",
                                "name": "Elimina Manchas y Olores",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 7,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "50",
                                "name": "Comederos y Bebederos",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 6,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "51",
                                "name": "LickiMat",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 6,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "53",
                                "name": "Nature's Miracle",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 6,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "38",
                                "name": "Ecológico",
                                "facet": {
                                    "id": "3",
                                    "name": "tag",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 3,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "59",
                                "name": "Febreze",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 3,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "130",
                                "name": "Limpieza e Higiene",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 3,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "230",
                                "name": "Bolsas de Basura",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 2,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "129",
                                "name": "Freemet",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 2,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "97",
                                "name": "Neutralizador de Olores",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 2,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "16",
                                "name": "Pisos",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 2,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "214",
                                "name": "Sanytol",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 2,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "234",
                                "name": "Toallas Desinfectantes",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 2,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "132",
                                "name": "Alfombras y Tapicerías",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 1,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "42",
                                "name": "Arm &amp; Hammer",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 1,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "44",
                                "name": "Aromatizantes Ambientales",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 1,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "240",
                                "name": "Cleandog",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 1,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "14",
                                "name": "Dr. Beckmann",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 1,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "33",
                                "name": "Limpiadores Multiuso",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 1,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "36",
                                "name": "Productos Limpiavidrios",
                                "facet": {
                                    "id": "1",
                                    "name": "category",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 1,
                            "__typename": "FacetValueResult"
                        },
                        {
                            "facetValue": {
                                "id": "71",
                                "name": "Virutex",
                                "facet": {
                                    "id": "2",
                                    "name": "brand",
                                    "__typename": "Facet"
                                },
                                "__typename": "FacetValue"
                            },
                            "count": 1,
                            "__typename": "FacetValueResult"
                        }
                    ],
                    "prices": {
                        "rangeWithTax": {
                            "min": 219000,
                            "max": 1799000,
                            "__typename": "PriceRange"
                        },
                        "__typename": "SearchResponsePriceData"
                    },
                    "collections": [
                        {
                            "count": 16,
                            "collection": {
                                "id": "4",
                                "name": "Mundo Mascotas",
                                "slug": "mundo-mascotas",
                                "position": 2,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "4",
                                        "slug": "mundo-mascotas",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 10,
                            "collection": {
                                "id": "2",
                                "name": "Limpieza Hogar",
                                "slug": "limpieza-hogar",
                                "position": 0,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 10,
                            "collection": {
                                "id": "177",
                                "name": "Limpieza e Higiene",
                                "slug": "limpieza-e-higiene",
                                "position": 3,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "4",
                                        "slug": "mundo-mascotas",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "177",
                                        "slug": "limpieza-e-higiene",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 7,
                            "collection": {
                                "id": "179",
                                "name": "Elimina Manchas y Olores",
                                "slug": "elimina-manchas-y-olores",
                                "position": 2,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "4",
                                        "slug": "mundo-mascotas",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "177",
                                        "slug": "limpieza-e-higiene",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "179",
                                        "slug": "elimina-manchas-y-olores",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 6,
                            "collection": {
                                "id": "167",
                                "name": "Alimentos & Snacks",
                                "slug": "alimentos-snacks",
                                "position": 1,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "4",
                                        "slug": "mundo-mascotas",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "167",
                                        "slug": "alimentos-snacks",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 6,
                            "collection": {
                                "id": "170",
                                "name": "Comederos y Bebederos",
                                "slug": "comederos-y-bebederos",
                                "position": 3,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "4",
                                        "slug": "mundo-mascotas",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "167",
                                        "slug": "alimentos-snacks",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "170",
                                        "slug": "comederos-y-bebederos",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 3,
                            "collection": {
                                "id": "18",
                                "name": "Aerosoles y Aromatizantes",
                                "slug": "aerosoles-y-aromatizantes",
                                "position": 2,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "18",
                                        "slug": "aerosoles-y-aromatizantes",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 2,
                            "collection": {
                                "id": "5",
                                "name": "Accesorios de Limpieza",
                                "slug": "accesorios-de-limpieza",
                                "position": 1,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "5",
                                        "slug": "accesorios-de-limpieza",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 2,
                            "collection": {
                                "id": "6",
                                "name": "Bolsas de Basura",
                                "slug": "bolsas-de-basura",
                                "position": 1,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "5",
                                        "slug": "accesorios-de-limpieza",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "6",
                                        "slug": "bolsas-de-basura",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 2,
                            "collection": {
                                "id": "47",
                                "name": "Desinfectantes",
                                "slug": "desinfectantes",
                                "position": 5,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "47",
                                        "slug": "desinfectantes",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 2,
                            "collection": {
                                "id": "52",
                                "name": "Toallas Desinfectantes",
                                "slug": "toallas-desinfectantes",
                                "position": 5,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "47",
                                        "slug": "desinfectantes",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "52",
                                        "slug": "toallas-desinfectantes",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 2,
                            "collection": {
                                "id": "31",
                                "name": "Baño y Cocina",
                                "slug": "bano-y-cocina",
                                "position": 4,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "31",
                                        "slug": "bano-y-cocina",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 2,
                            "collection": {
                                "id": "24",
                                "name": "Neutralizador de Olores",
                                "slug": "neutralizador-de-olores",
                                "position": 6,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "18",
                                        "slug": "aerosoles-y-aromatizantes",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "24",
                                        "slug": "neutralizador-de-olores",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 1,
                            "collection": {
                                "id": "81",
                                "name": "Alfombras y Tapicerías",
                                "slug": "alfombras-y-tapicerias",
                                "position": 1,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "80",
                                        "slug": "pisos-superficies-y-muebles",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "81",
                                        "slug": "alfombras-y-tapicerias",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 1,
                            "collection": {
                                "id": "42",
                                "name": "Limpia Vidrios y Ventanas",
                                "slug": "limpia-vidrios-y-ventanas",
                                "position": 5,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "31",
                                        "slug": "bano-y-cocina",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "42",
                                        "slug": "limpia-vidrios-y-ventanas",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 1,
                            "collection": {
                                "id": "80",
                                "name": "Pisos, Superficies y Muebles",
                                "slug": "pisos-superficies-y-muebles",
                                "position": 9,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "80",
                                        "slug": "pisos-superficies-y-muebles",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 1,
                            "collection": {
                                "id": "20",
                                "name": "Aromatizantes Ambientales",
                                "slug": "aromatizantes-ambientales",
                                "position": 2,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "18",
                                        "slug": "aerosoles-y-aromatizantes",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "20",
                                        "slug": "aromatizantes-ambientales",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        },
                        {
                            "count": 1,
                            "collection": {
                                "id": "46",
                                "name": "Limpiadores Multiuso",
                                "slug": "limpiadores-multiuso",
                                "position": 9,
                                "breadcrumbs": [
                                    {
                                        "id": "1",
                                        "slug": "__root_collection__",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "2",
                                        "slug": "limpieza-hogar",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "31",
                                        "slug": "bano-y-cocina",
                                        "__typename": "CollectionBreadcrumb"
                                    },
                                    {
                                        "id": "46",
                                        "slug": "limpiadores-multiuso",
                                        "__typename": "CollectionBreadcrumb"
                                    }
                                ],
                                "__typename": "Collection"
                            },
                            "__typename": "CollectionResult"
                        }
                    ],
                    "totalItems": 23,
                    "__typename": "SearchResponse"
                }
            }
        })
      end

      def test1(ctx : Context)
        start_time = Time.monotonic

        start_write_time = Time.monotonic
        Store.set("test1", content, ex: 1.hour)

        end_write_time = Time.monotonic
        write_duration = (end_write_time - start_write_time).total_milliseconds

        start_get_time = Time.monotonic
        value = Store.get("test1")
        end_get_time = Time.monotonic

        get_duration = (end_get_time - start_get_time).total_milliseconds

        ctx.put_status(200).json({
          write_duration: write_duration,
          get_operation:  get_duration,
          value:          value,
        })
      end

      def test2(ctx : Context)
        redis = Redis.new(url: FrozenLayer.config.store_url)

        start_time = Time.monotonic

        start_write_time = Time.monotonic
        redis.set("test1", content, ex: 1.hour.to_i)

        end_write_time = Time.monotonic
        write_duration = (end_write_time - start_write_time).total_milliseconds

        start_get_time = Time.monotonic
        value = redis.get("test1")
        end_get_time = Time.monotonic

        get_duration = (end_get_time - start_get_time).total_milliseconds

        ctx.put_status(200).json({
          write_duration: write_duration,
          get_operation:  get_duration,
          value:          value,
        })
      end
    end
  end
end
