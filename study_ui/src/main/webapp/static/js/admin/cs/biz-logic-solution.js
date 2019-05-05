/**
 * 业务逻辑解决方案
 */

function drawSolutionDialog(bizLogicId) {
    var dialog = $('.biz-logic-dialog-template').clone();
    dialog.removeClass('biz-logic-dialog-template');

    dialog.find("#requirement-form-button").on("click", function () {
        genAnswerByOrderId(dialog, bizLogicId);
    });

    dialog.modal('show');
}

function genAnswerByOrderId(dialog, bizLogicId) {

    var orderId = dialog.find("#requirement-form-input").val();
    if (!orderId) {
        alert("参数不能为空!");
        return;
    }

	// get answer
    $.ajax({
         url: "/cs/getanswer4bizlogic",
         data: {
         	"logicId": bizLogicId,
			"wmOrderId": orderId
         },
         type: "json",
         method: "get",
         success: function(data){
             var _data = $.parseJSON(data);
             var msg = _data.result;
             if (msg == "failed") {
                 alert(_data.data);
                 return;
             }
             var solution = _data.data;
             showSolution(dialog, solution);
         },
         error: function(err){
             alert("获取解决方案出错!访问服务出错!");
         }
	});
}

function showSolution(dialog, solution) {
	clearDialog(dialog);

    var wikiId = solution.wikiId;

    var answer = solution.answer;

    // show error
    if (answer.errorMsg) {
        showErrorMsg(dialog, answer.errorMsg);
        return;
    }

    // show conclusion
    showConclusion(dialog, answer.solution.conclusion);

    // wiki
    showWiki(dialog, wikiId);

    // show proofDatas
    showProofDatas(dialog, answer.solution.proofDatas);

    var messure = answer.solution.measure;
    if (!messure) {
        return;
    }

    // messure - suggestion
    showMessureSuggestion(dialog, messure.suggestion);

    // messure - resolver
    showMessureResolver(dialog, messure.resolver);

}

function clearDialog(dialog) {
	// messure
	dialog.find(".messure-resolver-div").each(function (i, obj) {
		if (obj.style.display != "none")
			obj.remove();
	});
    // error
	dialog.find(".answer-error-div").each(function (i, obj) {
		if (obj.style.display != "none")
			obj.remove();
	});
    // conclusion
	dialog.find(".conclusion-div").each(function (i, obj) {
		if (obj.style.display != "none")
			obj.remove();
	});
    // wiki
	dialog.find(".wiki-div").each(function (i, obj) {
		if (obj.style.display != "none")
			obj.remove();
	});
    // proof-datas
    dialog.find(".proof-datas-div").each(function (i, obj) {
    	if (obj.style.display != "none")
    		obj.remove();
    });
    // messure
    dialog.find(".messure-suggestion-div").each(function (i, obj) {
    	if (obj.style.display != "none")
        	obj.remove();
    });
	dialog.find(".messure-resolver-div").each(function (i, obj) {
		if (obj.style.display != "none")
			obj.remove();
	});
}

function showMessureResolver(dialog, resolver) {
    if (!resolver) {
        return;
    }

    var div = dialog.find("#messure-resolver-div").clone();
    div.removeAttr('id');
    div.show();
    div.find("#messure-resolver-form-button").text(resolver.name);

    div.find("#messure-resolver-form-button").on("click", function () {
        showResolveResult(dialog, resolver);
    });

    dialog.find(".modal-body").append(div);
}

function showResolveResult(dialog, resolver) {

	var params = {};
	resolver.params.forEach(function(obj, i){
		params[obj.field] = obj.value;
    });

    $.ajax({
         url: resolver.apiUrl,
         data: params,
         type: "json",
         method: "get",
         success: function(data){
             var _data = $.parseJSON(data);
             var msg = _data.result;
             if (msg == "failed") {
                 alert(_data.data);
                 return;
             }
             alert("成功!");
         },
         error: function(err){
             alert("解决过程出错!");
         }
	});
}

function showErrorMsg(dialog, errorMsg) {
    var div = dialog.find("#answer-error-div").clone();
    div.removeAttr('id');
    div.show();
    div.find("#answer-error-span").text(errorMsg);
    dialog.find(".modal-body").append(div);
}

function showConclusion(dialog, conclusion) {
    if (!conclusion) {
        return;
    }

    var div = dialog.find("#conclusion-div").clone();
    div.removeAttr('id');
    div.show();
    div.find("#conclusion-span").text(conclusion);

    dialog.find(".modal-body").append(div);
}

function showProofDatas(dialog, proofDatas) {
    if (!proofDatas || proofDatas.length==0) {
        return;
    }

    var div = dialog.find("#proof-datas-div").clone();
	div.removeAttr('id');
    div.show();

    proofDatas.forEach(function(obj, i){
        var li = dialog.find("#proff-datas-li").clone();
        li.removeAttr('id');
        li.text(obj);
        li.show();
        div.find("#proof-datas-ul").append(li);
    });

    dialog.find(".modal-body").append(div);
}

function showWiki(dialog, wikiId) {
    if (!wikiId) {
        return;
    }

    var wikiUrl = "http://wiki.sankuai.com/plugins/viewsource/viewpagesrc.action?pageId=" + wikiId;

    var div = dialog.find("#wiki-div").clone();
    div.removeAttr('id');
    div.show();
    var wikiIframeDiv = div.find("#wiki-iframe-div");
    wikiIframeDiv.find("#wiki-iframe").attr("src", wikiUrl);
    div.find("#wiki-href").on("click", function () {
        if (wikiIframeDiv.css('display') == 'none') {
			div.find("#wiki-href-i").removeClass("fa-plus-square-o");
			div.find("#wiki-href-i").addClass("fa-minus-square-o");
            wikiIframeDiv.show();
        } else {
        	div.find("#wiki-href-i").removeClass("fa-minus-square-o");
        	div.find("#wiki-href-i").addClass("fa-plus-square-o");
            wikiIframeDiv.hide();
        }
    });

    dialog.find(".modal-body").append(div);
}

function showMessureSuggestion(dialog, suggestion) {
    if (!suggestion) {
        return;
    }
    var div = dialog.find("#messure-suggestion-div").clone();
    div.removeAttr('id');
    div.show();
    div.find("#messure-suggestion-content-span").text(suggestion);

    dialog.find(".modal-body").append(div);
}