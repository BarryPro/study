/**
 * 订单业务逻辑展示模块
 */

function drawOrderLogicDialog(wiki) {
    var wikiUrl = "http://wiki.sankuai.com/plugins/viewsource/viewpagesrc.action?pageId=" + wiki.wikiId;

    var dialog = $('.order-logic-wiki-dialog-template').clone();
    dialog.removeClass('order-logic-wiki-dialog-template');
    dialog.find("#order-logic-wiki-iframe").attr("src", wikiUrl);
    dialog.find("#order-logic-wiki-title").text(wiki.desc);
    dialog.modal('show');
}