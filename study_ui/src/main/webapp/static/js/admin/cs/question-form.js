/**
 * 问题咨询单
 */

function showQuestionForm() {
    var dialog = $('.question-form-dialog-template').clone();
    dialog.removeClass('question-form-dialog-template');

    dialog.find(".form-btn-submit").on("click", function () {
        _submitQuestionInfo(dialog);
    });

    dialog.modal('show');
}

function _submitQuestionInfo(dialog) {
    var title = dialog.find('.form-field-title').val();
    var desc = dialog.find('.form-field-desc').val();
    if (!title || !desc) {
        return alert("所有输入都为必填项!");
    }
    if (title.length > 100 || desc.length > 200) {
        return alert("字符长度不符合规范!");
    }

    $.ajax({
        url: "/cs/submitquestioninfo",
        data: {
            "title": title,
            "desc": desc
        },
        type: "json",
        method: "post",
        success: function(data){
            var _data = $.parseJSON(data);
            var msg = _data.result;
            if (msg == "failed") {
                return alert(_data.data);
            } else {
                alert("提交成功，RD会第一时间联系您，请耐心等待！");
                dialog.modal('hide');
            }
        },
        error: function(err){
            return alert("提交咨询信息出错!访问服务出错!");
        }
    });

}