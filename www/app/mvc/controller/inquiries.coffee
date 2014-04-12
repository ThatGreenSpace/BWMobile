class InquiryController extends Monocle.Controller
    constructor: ->
        super
        __Model.Inquiry.bind "create", @bindInquiryCreate

    bindInquiryCreate: (inquiry) ->
        console.log "You've created #{inquiry.subject}!"
        view = new __View.InquiryView model: inquiry
        view.append inquiry

    onLoad: (event) ->
        console.log "Loaded Inquiries"

    events:
        "load section#inquiry-list": "onLoad"

__Controller.Inquiries = new InquiryController ("section#inquiry-list")


Lungo.ready ->
    __Model.Inquiry.create id: "1", subject: "Inquiry 1", description: "Inquiry 1 description"
    __Model.Inquiry.create id: "2", subject: "Inquiry 2", description: "Inquiry 2 description"
