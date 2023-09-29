$NetBSD$

Limit tcp_info to Linux and FreeBSD.

--- percona-xtradb-cluster-galera/galerautils/src/gu_asio_stream_react.cpp.orig	2023-09-27 15:23:42.207195182 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_asio_stream_react.cpp
@@ -272,10 +272,12 @@ size_t gu::AsioStreamReact::get_send_buf
     return ::get_send_buffer_size(socket_);
 }
 
+#if defined(__linux__) || defined(__FreeBSD__)
 struct tcp_info gu::AsioStreamReact::get_tcp_info()
 {
     return ::get_tcp_info(socket_);
 }
+#endif
 
 void gu::AsioStreamReact::complete_client_handshake(
     const std::shared_ptr<AsioSocketHandler>& handler,
