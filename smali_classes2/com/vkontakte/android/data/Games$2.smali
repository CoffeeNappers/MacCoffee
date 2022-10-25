.class final Lcom/vkontakte/android/data/Games$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "Games.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Games;->deleteRequestAll(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 118
    invoke-static {}, Lcom/vkontakte/android/data/Games;->nullAppsCounter()V

    .line 119
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 115
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Games$2;->success(Ljava/lang/Boolean;)V

    return-void
.end method
