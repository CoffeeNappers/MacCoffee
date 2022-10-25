.class final Lcom/vkontakte/android/media/VigoApiEvent$1;
.super Ljava/lang/Object;
.source "VigoApiEvent.java"

# interfaces
.implements Lcom/vkontakte/android/media/VigoPool$ObjectFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/VigoApiEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/media/VigoPool$ObjectFactory",
        "<",
        "Lcom/vkontakte/android/media/VigoApiEvent;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newInstance()Lcom/vkontakte/android/media/VigoApiEvent;
    .locals 1

    .prologue
    .line 18
    new-instance v0, Lcom/vkontakte/android/media/VigoApiEvent;

    invoke-direct {v0}, Lcom/vkontakte/android/media/VigoApiEvent;-><init>()V

    return-object v0
.end method

.method public bridge synthetic newInstance()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/vkontakte/android/media/VigoApiEvent$1;->newInstance()Lcom/vkontakte/android/media/VigoApiEvent;

    move-result-object v0

    return-object v0
.end method
