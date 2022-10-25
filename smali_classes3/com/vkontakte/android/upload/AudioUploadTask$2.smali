.class Lcom/vkontakte/android/upload/AudioUploadTask$2;
.super Ljava/lang/Object;
.source "AudioUploadTask.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/AudioUploadTask;->save()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
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
.field final synthetic this$0:Lcom/vkontakte/android/upload/AudioUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/AudioUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/AudioUploadTask;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vkontakte/android/upload/AudioUploadTask$2;->this$0:Lcom/vkontakte/android/upload/AudioUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 89
    return-void
.end method

.method public success(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "audio"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/upload/AudioUploadTask$2;->this$0:Lcom/vkontakte/android/upload/AudioUploadTask;

    invoke-static {v0, p1}, Lcom/vkontakte/android/upload/AudioUploadTask;->access$002(Lcom/vkontakte/android/upload/AudioUploadTask;Lcom/vkontakte/android/audio/MusicTrack;)Lcom/vkontakte/android/audio/MusicTrack;

    .line 84
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 80
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/AudioUploadTask$2;->success(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method
