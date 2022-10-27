<style>
      #blur {
        filter: blur(1px);
        -webkit-filter: blur(1px);
      }
</style>

# Testing blur

<pre>
<code>
SELECT *
FROM table
</code>
</pre>


<pre>
<code>
<span id="blur">
SELECT *
FROM table </span>
JOIN other_table USING key
</code>
</pre>

<style>
      #old {
        color: grey;
      }
</style>

# Testing colors

<pre><code>SELECT *
FROM table</code></pre>


<pre><code><span id="old">SELECT *
FROM table </span>
JOIN other_table USING key</code></pre>


<pre><code><span id="old">SELECT *
FROM table
JOIN other_table USING key</span>
WHERE condition = TRUE</code></pre>