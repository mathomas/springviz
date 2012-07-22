springviz
=========

Simple XSLT/Ant project for building dot-based dependency graphs for Spring config files.  Requires dot to be installed on your system.

To run the example, just type the following at the command-line:

    ant -Dconfig.file=dataAccessContext-jta.xml

 -- or --

    ant -Dconfig.file=dataAccessContext-jta-1.2.xml (demonstrating Spring's "condensed" property format).

Try using the view-graph task to build the graph and pop it open in your browser (OS-specific).

    ant -Dconfig.file=dataAccessContext-jta-1.2.xml show-graph


A spring_graph.dot file for the named spring config is created in the current directory (override with -Dout.dir).

Use Graphviz and/or other tools to view/export the file.

Graphviz:  http://www.graphviz.org

Have fun!
