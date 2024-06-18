using {ServiceCatalog as call} from '../service';
using from './annotations-Items';

annotate call.OrdersSet @odata.draft.enabled;

//Title
annotate call.OrdersSet with {
    //Imageurl     @title: 'Imageurl';
    ID           @title: 'ID';
    Email        @title: 'Email';
    Firsname     @title: 'Firs name';
    Lastname     @title: 'Last name';
    Country      @title: 'Country';
    Createon     @title: 'Create on';
    Deliverydate @title: 'Delivery date';
    Orderstatus  @title: 'Order status';
    ToItems      @title: 'Items';
};

//fields para la seleccion de registros de Sale Orders
annotate call.OrdersSet with @(
    UI.SelectionFields   : [
        Createon,
        Orderstatus
    ],
    //Contador de Sale Orders con descripcion
    UI.HeaderInfo        : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID,
        }
    },
    // Posiciones de los Sale Orders
    UI.LineItem          : [
        {
            $Type                : 'UI.DataField',
            Value                : Imageurl,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '6rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Value: Email
        },
        {
            $Type: 'UI.DataField',
            Value: Firsname
        },
        {
            $Type: 'UI.DataField',
            Value: Lastname
        },
        {
            $Type: 'UI.DataField',
            Value: Country
        },
        {
            $Type: 'UI.DataField',
            Value: Createon
        },
        {
            $Type: 'UI.DataField',
            Value: Deliverydate
        },
        {
            $Type: 'UI.DataField',
            Value: Orderstatus
        },

    ],
    //Image en la cabecera tras la navegacion de un Sale order
    UI.FieldGroup #Image : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: ' UI.DataField',
            Value: ImageUrl,
        }, ],
    },
    //Permite agregar registros de Sale Ordes
    UI.FieldGroup #Orders: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: Email,
            },
            {
                $Type: 'UI.DataField',
                Value: Firsname,
            },
            {
                $Type: 'UI.DataField',
                Value: Lastname,
            },
            {
                $Type: 'UI.DataField',
                Value: Country,
            },
            {
                $Type: 'UI.DataField',
                Value: Createon,
            },
            {
                $Type: 'UI.DataField',
                Value: Deliverydate,
            },
            {
                $Type: 'UI.DataField',
                Value: Orderstatus,
            },
        ],

    },

    //Para poder visualizar los FieldGroups, deben estar dentro de una Facet, con una referencia
    UI.HeaderFacets      : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Image',
            Label : 'Orders',
        },

        //Agrupamos las Facets
        {
            $Type : 'UI.CollectionFacet',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Target: 'ToItems/@UI.LineItem',
            }]
        }
    ]
);
