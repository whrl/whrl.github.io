var myCallback = function() {
if (document.readyState == 'complete') {
// Document is ready when CSE element is initialized.
// Render an element with both search box and search results in div with id 'goo-search'.
google.search.cse.element.render(
{div: \"goo-search\",tag: 'search'});} else {
// Document is not ready yet, when CSE element is initialized.
google.setOnLoadCallback(function() {
// Render an element with both search box and search results in div with id 'goo-search'.
google.search.cse.element.render(
{div: \"goo-search\",tag: 'search'});}, true);}};
// Insert it before the CSE code snippet so that cse.js can take the script
// parameters, like parsetags, callbacks.
window.__gcse = {parsetags: 'explicit',callback: myCallback};    
(function() {
var cx = '015189740857710454618:i3qtwm5bgwq';
var gcse = document.createElement('script');
gcse.type = 'text/javascript';
gcse.async = true;
gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
'//cse.google.com/cse.js?cx=' + cx;var s = document.getElementsByTagName('script')[0];
s.parentNode.insertBefore(gcse, s);})();
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-73306628-1', 'auto');
ga('send', 'pageview');
