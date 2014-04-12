class __Model.Notice extends Monocle.Model
    @fields "id", "subject", "description", "date"

    validate: ->
        unless @subject
            "subject is required"
