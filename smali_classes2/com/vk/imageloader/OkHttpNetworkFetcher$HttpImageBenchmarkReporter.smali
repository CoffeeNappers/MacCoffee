.class public interface abstract Lcom/vk/imageloader/OkHttpNetworkFetcher$HttpImageBenchmarkReporter;
.super Ljava/lang/Object;
.source "OkHttpNetworkFetcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/imageloader/OkHttpNetworkFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "HttpImageBenchmarkReporter"
.end annotation


# virtual methods
.method public abstract reportImageLoadFailure(Ljava/lang/String;ILjava/lang/Exception;ZZ)V
.end method

.method public abstract reportImageLoadSucceeded(Ljava/lang/String;IIIZ)V
.end method
