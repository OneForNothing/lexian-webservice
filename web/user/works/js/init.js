// 对所有移动端页面进行基本的初始化
function setRemFontSize() {
	let doc = document.documentElement
	doc.style.fontSize = doc.clientWidth / 375 * 20 + 'px';
}

$(document).ready(function(){
	// 设置rem大小
	setRemFontSize();
})
export {setRemFontSize}