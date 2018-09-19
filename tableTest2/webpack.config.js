const htmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const path = require('path');

module.exports = {
	mode: 'development',
	entry:"./index.js",
	output: {
	    publicPath: 'http://localhost:7000',
	    filename: 'js/[name][hash:6].js',
	    path: path.resolve(__dirname, 'dist')
	},
	module: {
		rules: [
			{
			    test:/\.scss$/,
			    use:[
			        MiniCssExtractPlugin.loader,
			        "css-loader",
			        "sass-loader"
			    ]
			}
		]
	},
	plugins:[
		new MiniCssExtractPlugin({
	      // Options similar to the same options in webpackOptions.output
	      // both options are optional
	      filename: '[name].[hash].css',
	      chunkFilename: '[id].[hash].css'
	    }),
		new htmlWebpackPlugin({//生成js后绑定关联页面 默认为output的path位置，默认文件为index.html
			templete:"./index.html",//模板文件名
			inject:"head"//指定js的html位置标签
			/*minify:{ //压缩html文件
				removeComments: true, //删除注释
				collapseWhitespace: true,//删除空格
			}*/
		})
	],
	devServer: {//服务器端口地址
	    port: 7000,
	    inline: true//自动刷新
	}
}
