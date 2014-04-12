class NoticeController extends Monocle.Controller

    events:
        "load section#notices": "onLoadSection"
        "click li": "onClick"

    onClick: (event) =>
        console.log event

    onLoadSection: (event) =>
        # Here we will call the REST to obtain the notices
        console.log "Loaded Notices"

    constructor: ->
        super
        __Model.Notice.bind "create", @bindNoticeCreate

    bindNoticeCreate: (notice) ->
        console.log "You've created #{notice.subject}!"
        view = new __View.NoticeView model: notice
        view.append notice

NoticesList = new NoticeController "section#notices"


Lungo.ready ->
    __Model.Notice.create id: "1", subject: "Notice 1", description: "Notice 1 description", date: "15.04.2014"
    __Model.Notice.create id: "2", subject: "Notice 2", description: "Notice 2 description", date: "16.04.2014"
