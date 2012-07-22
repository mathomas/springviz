springviz
=========

Simple XSLT/Ant project for building dot-based dependency graphs for Spring config files.To run the example, just type the following at the command-line:

ant -Dconfig.file=dataAccessContext-jta.xml

 -- or --

ant -Dconfig.file=dataAccessContext-jta-1.2.xml (demonstrating Spring's "condensed" property format).


A spring_graph.dot file is created in the current directory (override with -Dout.dir), for the named 
spring config.

Use Graphviz and/or other tools to view/export the file.

Graphviz:  http://www.graphviz.org

Have fun!
