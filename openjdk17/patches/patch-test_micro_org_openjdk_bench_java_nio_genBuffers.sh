$NetBSD$

Shell portability fixes.

--- test/micro/org/openjdk/bench/java/nio/genBuffers.sh.orig	2022-09-21 10:16:05.000000000 +0000
+++ test/micro/org/openjdk/bench/java/nio/genBuffers.sh
@@ -33,7 +33,7 @@ genBin() {
         for RO in "RO" ""
         do
         extraArgs=""
-        if [ "$RO" == "RO" ] ; then
+        if [ "$RO" = "RO" ] ; then
           extraArgs="-KRO"
         fi
         java build.tools.spp.Spp -be -nel -K$1 -Dtype=$1 -DType=$2 -DFulltype=$3 \
@@ -60,7 +60,7 @@ gen() {
     java build.tools.spp.Spp -be -nel -K$1 -Dtype=$1 -DType=$2 -DFulltype=$3 \
           -DMs=Heap -Dms=heap -DSWAP="" -DRO="" -iX-Buffers-bin.java.template -o$out
 
-    if [ "$1" == "byte" ] ; then
+    if [ "$1" = "byte" ] ; then
       genBin $1 $2 $3 $4 X-ByteBuffers-bin.java.template
       genBin char Char Character 2 X-ByteBuffers-bin.java.template
       genBin short Short Short 2 X-ByteBuffers-bin.java.template
