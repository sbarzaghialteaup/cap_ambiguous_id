using my.bookshop as Services from '../srv/cat-service';

annotate Services.Books with @(
	UI: {
		SelectionFields: [ title ],
		LineItem: [
			{Value: title}
		]
	}
);

annotate Services.Books with @(
	UI: {
		Identification: [
			{Value: title}
		],
		HeaderInfo: {
			TypeName: 'Book',
			TypeNamePlural: 'Books',
			Title: {Value: title},
		},
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
		],
		FieldGroup#General: {
			Data: [
				{
                    $Type : 'UI.DataField',
                    Value : author_ID,
                },
			]
		}
	}
);
