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
    @title  : 'Author'
    name : String;
}

annotate Books with {
    ID @UI.Hidden;
}

annotate Authors with {
    ID @(
        UI.Hidden,
        Core.Computed,
        Common.Text : {
            $value                 : name,
            ![@UI.TextArrangement] : #TextOnly
        }
    );
}