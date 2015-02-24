module.exports = {
    entry: "./src/client/index.coffee",
    output: {
        path: __dirname,
        filename: "static/js/bundle.js"
    },
    module: {
        loaders: [
            { test: /\.css$/, loader: "style!css" },
            { test: /\.coffee$/, loader: "coffee-loader" },
            { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" }
        ]
    }
};
