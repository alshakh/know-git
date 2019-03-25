Reveal.initialize({
    history: true,
    width: '100%',
    height: '100%',
    /*dependencies: [
        //{ src: 'plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
        //{ src: 'plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
    */
});

//
hljs.initHighlightingOnLoad();
//
initializeTerminals()
//
const socketUrl = `${(location.protocol === 'https:') ? 'wss://' : 'ws://'}${location.hostname}${location.port ? `:${location.port}` : ''}/malafat`;
document.querySelectorAll('[data-malafat]').forEach((el) => {
    Malafat.fromElement(el, socketUrl)
})
//
