class __Model.Inquiry extends Monocle.Model
    @fields "id", "subject", "description"

    validate: ->
        unless @subject
            "subject is required"
