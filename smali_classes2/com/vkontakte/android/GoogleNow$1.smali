.class final Lcom/vkontakte/android/GoogleNow$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "GoogleNow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/GoogleNow;->lambda$updateTokenAsync$0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 0

    .prologue
    .line 30
    invoke-static {}, Lcom/vkontakte/android/GoogleNow;->updateTokenAsync()V

    .line 31
    return-void
.end method
