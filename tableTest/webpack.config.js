var webpack=require("webpack");

module.exports = {
  entry : {
    index: './src/index.js',//如果文件, 如果有多个页面在下面多写几项就是了
  },
  output : {//打包输出文件
    filename: '[name].js',
    publicPath: 'http://localhost:7000/out',
    path: __dirname + '/out',
  },
  module : {
    rules: [//打包规则
      {test : /\.less$/, use:['style-loader', 'css-loader', 'less-loader']},
      {
        test : /\.js$/, 
        loader : 'babel-loader',
        exclude : /node_modules/,
        query : {
          presets : [
            require.resolve('babel-preset-es2015'),
            require.resolve('babel-preset-react'),
          ]
        }
      },
      {test: /\.(jpg|png|gif|svg)$/, use: ['url-loader?limit=8192&name=./[name].[ext]']}
    ],
  },
  plugins: [
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "windows.jQuery": "jquery"
    })
  ],
  devServer: {//服务器端口地址
    port: 7000,
    inline: true,//自动刷新
  }
}