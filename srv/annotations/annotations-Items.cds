using {ServiceCatalog as call} from '../service';

annotate call.ItemsSet with {
    Name             @title: 'Name';
    Description      @title: 'Description'  @UI.MultiLineText;
    ReleaseDate      @title: 'Release Date';
    DiscontinuedDate @title: 'Discontinued Date';
    Price            @title: 'Price';
    Height           @title: 'Height';
    Width            @title: 'Width';
    Depth            @title: 'Depth';
    Quantity         @title: 'Quantity';
    UnitOfMeasure    @title: 'Unit Of Measure';
};


//Posiciones de los Items
annotate call.ItemsSet with @(
    //Contador de Items con descripcion
    UI.HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Name',
        TypeNamePlural: 'Items',
    },
    UI.LineItem  : [
        {
            $Type: 'UI.DataField',
            Value: Name,
        },
        {
            $Type: 'UI.DataField',
            Value: Description,
        },
        {
            $Type: 'UI.DataField',
            Value: ReleaseDate,
        },
        {
            $Type: 'UI.DataField',
            Value: DiscontinuedDate,
        },
        {
            $Type: 'UI.DataField',
            Value: Price,
        },
        {
            $Type: 'UI.DataField',
            Value: Height,
        },
        {
            $Type: 'UI.DataField',
            Value: Width,
        },
        {
            $Type: 'UI.DataField',
            Value: Depth,
        },
        {
            $Type: 'UI.DataField',
            Value: Quantity,
        },
        {
            $Type: 'UI.DataField',
            Value: UnitOfMeasure,
        },
    ],
    //Se agregan estos resgristro en un fielGroup
    UI.FieldGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Name,
            },
            {
                $Type: 'UI.DataField',
                Value: Description,
            },
            {
                $Type: 'UI.DataField',
                Value: ReleaseDate,
            },
            {
                $Type: 'UI.DataField',
                Value: DiscontinuedDate,
            },
            {
                $Type: 'UI.DataField',
                Value: Price,
            },
            {
                $Type: 'UI.DataField',
                Value: Height,
            },
            {
                $Type: 'UI.DataField',
                Value: Width,
            },
            {
                $Type: 'UI.DataField',
                Value: Depth,
            },
            {
                $Type: 'UI.DataField',
                Value: Quantity,
            },
            {
                $Type: 'UI.DataField',
                Value: UnitOfMeasure,
            },

        ]
    },
    //Para poder visualizar los FieldGroups, deben estar dentro de una Facet, con una referencia
    UI.Facets: [
        {
            $Type : 'UI.ReferenceFacet',
            Target : ![@UI.FieldGroup],
            Label : 'Items',
        },
    ]
);
