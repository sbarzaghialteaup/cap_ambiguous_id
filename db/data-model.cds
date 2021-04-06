namespace my.bookshop;

using {cuid} from '@sap/cds/common';

entity Books : cuid {
    @title  : 'Title'
    title  : String;
    @Common : {
        Text            : author.name,
        TextArrangement : #TextOnly
    }
    @title  : 'Author'
    author : Association to one Authors;
}

@cds.odata.valuelist
entity Authors : cuid {
    @title : 'Author'
    name    : String;
    @title : 'Place Of Birth'
    placeOfBirth : String;
}

annotate Books with {
    ID @UI.Hidden;
    author @(
        Common.ValueList                : {
            CollectionPath : 'Authors',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'author_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'placeOfBirth'
            },
            ]
        }
    )
}

annotate Authors with @(UI.Identification : [{Value : name}]) {
    ID @(
        UI.Hidden,
        Core.Computed,
        Common.Text : {
            $value                 : name,
            ![@UI.TextArrangement] : #TextOnly
        }
    );
}
