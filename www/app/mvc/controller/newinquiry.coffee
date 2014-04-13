class NewInquiryController extends Monocle.Controller
    events:
        "click a[data-action=save]": "onSave"

    elements:
        "#txt-subject"        : "subject"
        "#txt-description"    : "description"

    constructor: ->
        super
        __Model.Inquiry.bind "error", @onError

    onError: ->
        console.error arguments

    onSave: (event) ->
        console.log @subject.val(), @description.val()

        inquiry = __Model.Inquiry.create
            id: "3",
            subject: @subject.val()
            description: @description.val()

        if inquiry
            Lungo.Router.back()
            @subject.val ""
            @description.val ""

__Controller.NewInquiry = new NewInquiryController "section#send-inquiry"
