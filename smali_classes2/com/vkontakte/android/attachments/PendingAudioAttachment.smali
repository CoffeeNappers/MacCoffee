.class public Lcom/vkontakte/android/attachments/PendingAudioAttachment;
.super Lcom/vkontakte/android/attachments/AudioAttachment;
.source "PendingAudioAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/PendingAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PendingAudioAttachment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lcom/vkontakte/android/attachments/PendingAudioAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PendingAudioAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PendingAudioAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p1, "mt"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 0
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 17
    return-void
.end method


# virtual methods
.method public createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/AudioUploadTask;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    new-instance v0, Lcom/vkontakte/android/upload/AudioUploadTask;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingAudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/upload/AudioUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 53
    .local v0, "task":Lcom/vkontakte/android/upload/AudioUploadTask;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingAudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/upload/AudioUploadTask;->setID(I)V

    .line 54
    return-object v0
.end method

.method public bridge synthetic createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;
    .locals 1

    .prologue
    .line 9
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PendingAudioAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/AudioUploadTask;

    move-result-object v0

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingAudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    return v0
.end method

.method public getUploadId()I
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingAudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingAudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v0, v0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    return-object v0
.end method

.method public setId(I)V
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingAudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iput p1, v0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 48
    return-void
.end method
