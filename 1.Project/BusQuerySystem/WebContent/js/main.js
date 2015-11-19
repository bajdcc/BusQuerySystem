function setTitle() {
	var title = window.frames.content.window.document.title;
	if (title.indexOf("Error") != -1) {
		$(".layout-panel-center > .panel-header > .panel-title").html("页面出现错误");
		showTip(3)("〖错误〗 - " + new Date().toLocaleString(), "抱歉，服务器出现严重错误");
	} else if (title.indexOf("临时跳转") != -1) {
	} else {
		$(".layout-panel-center > .panel-header > .panel-title").html(
				window.frames.content.window.document.title);
		showTip(5)("〖信息〗 - " + new Date().toLocaleString(),
				"打开了『" + title + "』窗口");
	}
}

$(document)
		.ready(
				function() {
					var head_ = $("head");
					var style_ = $("<style></style>");
					var class_ = '#_cc_tips{position:fixed;right:16px;width:290px;bottom:32px;z-index:100}'
							+ '#_cc_tips p{position:relative;background:rgba(0,0,0,.9);box-shadow:0 1px 2px rgba(0,0,0,.5);border-radius:2px;margin:10px 0px;padding:7px 10px 7px 5px;z-index:100}'
							+ '#_cc_tips p div{color:#FFF;padding-left:5px;border-left:5px solid #C00;font-family:"Segoe UI",Arial,"Microsoft YaHei",Sans-serif;font-size:12px;font-weight:bold;}'
							+ '#_cc_tips p div span{display:block;text-align:left;line-height:20px;z-index:100}';
					style_.attr("type", "text/css");
					style_.append(document.createTextNode(class_));

					head_.append(style_);
					var div_ = $("<div id='_cc_tips'></div>");
					$("body").append(div_);

					$(".layout-panel-center > .panel-header > .panel-title")
							.click(
									function() {
										window.frames["content"].window.location
												.reload();
									});
				});

var showTip = function(elapse) {

	var __addTips__ = function(args) {
		for (var _div_ = $("<div></div>"), i = 0; i < args.length; i++) {
			var _new_ = $("<span></span>");
			_new_.html(args[i]);
			_div_.append(_new_);
		}
		var _p_ = $("<p></p>");
		_p_.append(_div_);
		$("#_cc_tips").append(_p_);
		__hover__(_p_, elapse * 1000);
		__fadeIn__(_p_, elapse * 1000);
	};

	var __hover__ = function(element, elapse) {
		element.hover(function() {
			$(this).stop().fadeIn("fast");
		}, __fadeOut__(element, 1000));
		element.mouseover(function() {
			$(this).stop(true, false);
		});
		element.click(function() {
			$(this).stop().fadeOut("fast", function() {
				$(this).remove();
			});
		});
	}

	var __fadeIn__ = function(element, elapse) {
		element.css("opacity", 0);
		element.css("display", "none");
		element.animate({
			height : 'show'
		}, 1000, function() {
			$(this).css("display", "none");
			$(this).css("opacity", "");
		}).fadeIn(1000).delay(elapse).fadeOut(2000, function() {
			$(this).css("opacity", 0);
			$(this).css("display", "block");
		}).animate({
			height : 'hide'
		}, 1000, function() {
			$(this).remove();
		});
	};

	var __fadeOut__ = function(element, elapse) {
		return function() {
			element.css("opacity", "");
			element.css("display", "block");
			element.delay(elapse).fadeOut(2000, function() {
				$(this).css("opacity", 0);
				$(this).css("display", "block");
			}).animate({
				height : 'hide'
			}, 1000, function() {
				$(this).remove();
			})
		};
	}

	var worker = function() {
	}

	return function() {
		if (top.location != self.location)
			return;
		__addTips__(arguments);
	};
}