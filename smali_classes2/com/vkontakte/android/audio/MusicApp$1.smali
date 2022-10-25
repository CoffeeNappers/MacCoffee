.class final Lcom/vkontakte/android/audio/MusicApp$1;
.super Ljava/lang/Object;
.source "MusicApp.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/MusicApp;->getActualLink(Ljava/lang/String;Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$result:[Ljava/lang/Object;


# direct methods
.method constructor <init>([Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/vkontakte/android/audio/MusicApp$1;->val$result:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicApp$1;->val$result:[Ljava/lang/Object;

    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 67
    return-void
.end method

.method public success(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p1, "res"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicApp$1;->val$result:[Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 62
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 58
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/MusicApp$1;->success(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method
