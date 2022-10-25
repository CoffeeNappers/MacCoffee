.class final Lcom/my/target/nativeads/NativeAd$1;
.super Ljava/util/ArrayList;
.source "NativeAd.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/nativeads/NativeAd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    const-string/jumbo v0, "promo"

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/NativeAd$1;->add(Ljava/lang/Object;)Z

    .line 22
    return-void
.end method
