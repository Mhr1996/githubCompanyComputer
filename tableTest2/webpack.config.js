const htmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
var webpack=require("webpack");
const path = require('path');

module.exports = {
	mode: 'development',
	entry:{
		index: "./index.js",
		productList:"./src/productList/productList.js"
	},
	output: {
	    publicPath: 'http://localhost:7000',
	    filename: 'js/[name][hash:6].js',
	    path: path.resolve(__dirname, 'dist')
	},
	module: { //这些选项决定了如何处理项目中的不同类型的模块。
		rules: [
			{
			    test:/\.scss$/,
			    use:[
			        MiniCssExtractPlugin.loader,
			        "css-loader",
			        "sass-loader"
			    ]
			},
			{
                test: /\.(js|jsx)$/,
                loader:'babel-loader',
                exclude: /node_modules/,
                query : {
		          	presets : [
		            	require.resolve('babel-preset-es2015'),
		            	require.resolve('babel-preset-react'),
		          	]	
		        }
            }
		]
	},
	plugins:[ //webpack 插件列表
		new webpack.HotModuleReplacementPlugin(),
		new webpack.ProvidePlugin({
			$: "jquery",
			jQuery: "jquery",
			"windows.jQuery": "jquery"
	    }),
		new MiniCssExtractPlugin({
	      // Options similar to the same options in webpackOptions.output  both options are optional
	      filename: 'css/[name].[hash:4].css',
	      chunkFilename: '[id].[hash:4].css'
	    }),
		new htmlWebpackPlugin({//生成js后绑定关联页面 默认为output的path位置，默认文件为index.html
			template:"./index.html",//模板文件名
			inject:"body",//指定js的html位置标签
			filename: 'index.html',
			chunks:['index','productList'],
			minify: { //压缩HTML文件
	            removeComments: false, //移除HTML中的注释
	            collapseWhitespace: false, //删除空白符与换行符
	            minifyJS: false
	            //removeScriptTypeAttributes: true, //删除<script>的type="text/javascript"
	            //removeStyleLinkTypeAttributes: true //删除<style>和<link>的type="text/css"
	        }
		}),
		new htmlWebpackPlugin(htmlTemplate("productList.html",["productList"]))
	],
	devServer: {//服务器端口地址
		historyApiFallback: true,//任意的 404 响应都可能需要被替代为 index.html
		contentBase: path.join(__dirname, './dist/'),
	    port: 7000,
	    hot: true,
	    inline: true//自动刷新
	}
}

function htmlTemplate(name,J){
	return{
		template:"./src/productList/"+name+"",
		inject:"head",
		filename: name,
		chunks:J,
		minify: { 
            removeComments: false, 
            collapseWhitespace: false, 
            minifyJS: false
        }
	}
}
//html热更新没有实现