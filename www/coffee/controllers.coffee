class NoticesController extends Monocle.Controller
    constructor: ->
        super
        __Model.Notice.bind "create", @bindNoticeCreate

    bindNoticeCreate: (notice) ->
        console.log "You've created #{notice.title}!"
        view = new __View.NoticeItem model: notice
        view.append notice

    onLoad: (event) ->
        console.log "Loaded Notices"

    events:
        "load section#notices": "onLoad"


__Controller.NoticesList = new NoticesController ("section#notices")

Lungo.ready ->
    __Model.Notice.create id: "1", subject: "Notice 1", description: "Notice 1 description", date: "15.04.2014"
    __Model.Notice.create id: "2", subject: "Notice 2", description: "Notice 2 description", date: "16.04.2014"
