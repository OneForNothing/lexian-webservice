// import './banner.css'

class Banner {
	constructor(options) {
		for (const key in options) {
			this.key = options.key;
		}
		// 内部数据
		this.imgLength = options.images.length; //图片数量
		this.index = 0;
		this.timer = null; //自动播放定时器
		// 组件节点
		this.slider = _.html2node(template); //视口容器
		this.sliders = this.buildSlider(); //ul
		this.cursors = this.buildCursor(); //指示器
		// 初始化动作
		this.container.appendChild(this.slider); //将slider置入 <div class="m-banner"></div>
		this.nav(this.initIndex || 0);
		this.fade();
		this.autoPlay();
	}
	buildSlider() {
		let sliders = document.createElement("ul");
		//创建li其中加入图片，要注意不管有多少图片，都是只需要三个li
		for (let i = 0; i < this.imgLength; i++) {
			let sliderImg = document.createElement("li");
			sliderImg.className = "slider_img";
			let img = document.createElement("img");
			img.src = this.images[i];
			// 镶嵌元素
			sliderImg.appendChild(img);
			sliders.appendChild(sliderImg);
		}
		this.slider.appendChild(sliders);
		return sliders; //返回并进行 ul 并进行缓存
	}
	buildCursor() {
		let cursor = document.createElement('ul'),
			html = '';
		cursor.className = 'm-cursor';
		//根据图片的个数插入li
		for (let i = 0; i < this.imgLength; i++) {
			html += ('<li data-index = ' + i + '></li>');
		}
		cursor.innerHTML = html;
		this.slider.appendChild(cursor);
		return cursor;
	}
	next() {
		let index = (this.index + 1) % this.imgLength;
		this.last = this.index;
		this.index = index;
		this.fade();
		this.setCurrent();
	}
	// 设置当前选中状态
	setCurrent() {
		// 去掉之前选中节点的选中状态
		if (this.last !== undefined) {
			this.cursors.children[this.last].classList.remove('z-active');
			this.sliders.children[this.last].classList.remove('z-active');
		}
		// 添加当前选中节点的选中状态
		// _.addClassName(this.sliders.children[this.index], 'z-active');
		// _.addClassName(this.cursors.children[this.index], 'z-active');
		this.cursors.children[this.index].classList.add('z-active');
		this.cursors.children[this.index].classList.add('z-active');
	}

	fade() {
		if (this.last !== undefined) {
			//设置旧的图片和指示器的显示样式
			this.sliders.children[this.last].style.opacity = 0;
			this.cursors.children[this.last].style.backgroundColor = 'rgb(222,222,222)';
		}
		// 设置 index 的图片和只是器的显示样式
		this.sliders.children[this.index].style.opacity = 1;
		this.cursors.children[this.index].style.backgroundColor = '#5ed0ba';
	}
	autoPlay() {
		this.timer = setInterval(function () {
			this.next();
		}.bind(this), 2000);
	}
}

export {
	Banner
}